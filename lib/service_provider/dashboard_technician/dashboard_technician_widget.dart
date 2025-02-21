import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocator/geolocator.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/tech_status_component_widget.dart';
import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/service_provider/bottom_bar/bottom_bar_widget.dart';
import '/service_provider/driver/chat/service_summary_widget/service_summary_widget_widget.dart';
import '/service_provider/driver/confirm_cancellation/confirm_cancellation_widget.dart';
import '/service_provider/select_vehicle/select_vehicle_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';

// Task Handler for Background Location Updates
@pragma('vm:entry-point')
class LocationTaskHandler extends TaskHandler {
  SendPort? _sendPort;

  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    _sendPort = sendPort;
    print('Foreground service started at $timestamp');
    
    // Request location permissions
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }
  }

  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {
    try {
      final currentLocation = await getCurrentUserLocation(
          defaultLocation: const LatLng(0.0, 0.0));

      if (currentLocation != null) {
        await UptimeFleetAppGroup
            .updateTechnicianPositionUsingCurrentPostionCall
            .call(
          technicianId: valueOrDefault(currentUserDocument?.technicianId, ''),
          position: currentLocation.toString(),
        );

        await currentUserReference?.update(createUsersRecordData(
          technicianLastUpdatedLocation: currentLocation,
        ));
      }
    } catch (e) {
      print('Error in background task: $e');
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    print('Foreground service stopped at $timestamp');
  }

  @override
  void onButtonPressed(String id) {
    print('Button pressed in notification: $id');
  }
}

class DashboardTechnicianWidget extends StatefulWidget {
  const DashboardTechnicianWidget({super.key});

  static String routeName = 'dashboardTechnician';
  static String routePath = 'dashboard_technician';

  @override
  State<DashboardTechnicianWidget> createState() =>
      _DashboardTechnicianWidgetState();
}

class _DashboardTechnicianWidgetState extends State<DashboardTechnicianWidget>
    with WidgetsBindingObserver {
  late DashboardTechnicianModel _model;
  bool _isRunning = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _model = createModel(context, () => DashboardTechnicianModel());
    _initForegroundTask();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      await Future.wait([
        _initializeLocation(),
        _checkActiveRequest(),
      ]);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _model.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("App in resumed");
        break;
      case AppLifecycleState.inactive:
        print("App in inactive");
        break;
      case AppLifecycleState.paused:
        print("App in paused");
        break;
      case AppLifecycleState.detached:
        print("App in detached");
        break;
    }
  }

  // Initialize foreground task configuration
  void _initForegroundTask() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'foreground_service',
        channelName: 'Foreground Service Notification',
        channelDescription:
            'This notification appears when the foreground service is running.',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
        iconData: const NotificationIconData(
          resType: ResourceType.mipmap,
          resPrefix: ResourcePrefix.ic,
          name: 'launcher',
        ),
        buttons: [
          NotificationButton(
            id: 'stopService',
            text: 'Stop Service',
          ),
        ],
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: false,
      ),
      foregroundTaskOptions: const ForegroundTaskOptions(
        interval: 300000, // 5 minutes
        isOnceEvent: false,
        autoRunOnBoot: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  // Start the foreground service
  Future<void> _startForegroundTask() async {
    if (!await FlutterForegroundTask.canDrawOverlays) {
      final isGranted =
          await FlutterForegroundTask.openSystemAlertWindowSettings();
      if (!isGranted) {
        print('SYSTEM_ALERT_WINDOW permission denied!');
        return;
      }
    }

    bool reqResult = await FlutterForegroundTask.startService(
      notificationTitle: 'Location Tracking Active',
      notificationText: 'Tap to return to the app',
      callback: startCallback,
    );

    setState(() {
      _isRunning = reqResult;
    });
  }

  // Stop the foreground service
  Future<void> _stopForegroundTask() async {
    bool reqResult = await FlutterForegroundTask.stopService();
    setState(() {
      _isRunning = !reqResult;
    });
  }

  Future<void> runBackgroundService(bool status) async {
    if (status) {
      await _startForegroundTask();
    } else {
      await _stopForegroundTask();
    }
  }

  Future<void> _initializeLocation() async {
    if (!await requestPermission(locationPermission)) {
      print('Location permission denied');
      return;
    }

    currentUserLocationValue =
        await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
    if (currentUserLocationValue != null) {
      await _updateTechnicianLocation(currentUserLocationValue!);
    }
  }

  Future<void> _updateTechnicianLocation(LatLng location) async {
    await UptimeFleetAppGroup.updateTechnicianPositionUsingCurrentPostionCall
        .call(
      technicianId: valueOrDefault(currentUserDocument?.technicianId, ''),
      position: location.toString(),
    );

    await currentUserReference?.update(createUsersRecordData(
      technicianLastUpdatedLocation: location,
    ));
  }

  Future<void> _checkActiveRequest() async {
    if (currentUserDocument?.activeRequest != null) {
      final activeRequest = await RequestRecord.getDocumentOnce(
          currentUserDocument!.activeRequest!);
      if (activeRequest?.started == false) {
        if (mounted) {
          context.pushNamed(
            'start_request',
            queryParameters: {
              'request': serializeParam(
                activeRequest?.bubbleId,
                ParamType.String,
              ),
            }.withoutNulls,
          );
        }
      }
    }
  }

  @pragma('vm:entry-point')
  void startCallback() {
    FlutterForegroundTask.setTaskHandler(LocationTaskHandler());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await FlutterForegroundTask.isRunningService) {
          moveTaskToBack();
          return false;
        }
        return true;
      },
      child: WithForegroundTask(
        child: Title(
          title: 'dashboardTechnician',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: Text(
                  'Dashboard',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Yantramanav',
                        color: Color(0xFF1E293B),
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                elevation: 1.0,
              ),
             body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            decoration: BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model.userDetailsModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: UserDetailsWidget(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (currentUserDocument?.activeRequest ==
                                          null)
                                        AuthUserStreamWidget(
                                          builder: (context) => Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/uptimefleet-removebg-preview.png',
                                                ).image,
                                              ),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 15.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              if (currentUserDocument
                                                          ?.activeRequest?.id ==
                                                      null ||
                                                  currentUserDocument
                                                          ?.activeRequest?.id ==
                                                      '') {
                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        300.0,
                                                                    child:
                                                                        TechStatusComponentWidget(
                                                                      onDuty: valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.onDuty,
                                                                          false),
                                                                          onDutyFunction: runBackgroundService,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: Container(
                                                          height: 56.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        60.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE5E7EE),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.onDuty,
                                                                          false)
                                                                      ? 'On Duty'
                                                                      : 'Off Duty',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Yantramanav',
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Container(
                                                                  width: 32.0,
                                                                  height: 32.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: valueOrDefault<bool>(
                                                                            currentUserDocument
                                                                                ?.onDuty,
                                                                            false)
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .tertiary
                                                                        : Color(
                                                                            0xFFB3B3B3),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.activeVehicle,
                                                                        '') !=
                                                                    '') {
                                                                  return Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.85,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFCBD5E1),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                0.0,
                                                                                20.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'Active Vehicle',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Yantramanav',
                                                                                          fontSize: 24.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(18.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Vehicle License Number',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Yantramanav',
                                                                                                color: Colors.black,
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault(currentUserDocument?.activeVehicle, ''),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Yantramanav',
                                                                                                color: Color(0xFF64748B),
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(context).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: SelectVehicleWidget(),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                            text:
                                                                                'Change Vehicle',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Yantramanav',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              elevation: 3.0,
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 5.0)),
                                                                      ),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.9,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFCBD5E1),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          200.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .emptyStateSimpleModel,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            EmptyStateSimpleWidget(
                                                                          icon:
                                                                              Icon(
                                                                            Icons.search_off,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                35.0,
                                                                          ),
                                                                          title:
                                                                              'No active vehicle selected',
                                                                          body:
                                                                              'Click here to update active vehicle',
                                                                          buttonVisible:
                                                                              true,
                                                                          action:
                                                                              () async {},
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 16.0)),
                                                  ),
                                                );
                                              } else {
                                                return AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      FutureBuilder<
                                                          ApiCallResponse>(
                                                    future: UptimeFleetAppGroup
                                                        .getRequestCall
                                                        .call(
                                                      request: valueOrDefault(
                                                          currentUserDocument
                                                              ?.activeRequestBubble,
                                                          ''),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final containerGetRequestResponse =
                                                          snapshot.data!;

                                                      return Container(
                                                        width: 100.0,
                                                        height: 624.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: StreamBuilder<
                                                              RequestRecord>(
                                                            stream: RequestRecord
                                                                .getDocument(
                                                                    currentUserDocument!
                                                                        .activeRequest!),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final containerRequestRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (containerRequestRecord
                                                                            .status !=
                                                                        'cancelled') {
                                                                      return Container(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          minHeight:
                                                                              double.infinity,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            wrapWithModel(
                                                                          model:
                                                                              _model.serviceSummaryWidgetModel,
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          child:
                                                                              ServiceSummaryWidgetWidget(
                                                                            fleetCompanyName:
                                                                                UptimeFleetAppGroup.getRequestCall.driverCompanyName(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            ),
                                                                            driverName:
                                                                                UptimeFleetAppGroup.getRequestCall.driverFullName(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            ),
                                                                            driverPhoneNumber:
                                                                                UptimeFleetAppGroup.getRequestCall.driverPhoneNumber(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            ),
                                                                            serviceId:
                                                                                UptimeFleetAppGroup.getRequestCall.serviceId(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            ),
                                                                            timestamp:
                                                                                dateTimeFormat(
                                                                              "M/d h:mm a",
                                                                              functions.converUnixTimestamp(UptimeFleetAppGroup.getRequestCall.timestamp(
                                                                                containerGetRequestResponse.jsonBody,
                                                                              )!),
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            eventType:
                                                                                UptimeFleetAppGroup.getRequestCall.fault(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            ),
                                                                            pickUp:
                                                                                UptimeFleetAppGroup.getRequestCall.location(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            ),
                                                                            dropOff: UptimeFleetAppGroup.getRequestCall
                                                                                .dropOffLocation(
                                                                                  containerGetRequestResponse.jsonBody,
                                                                                )
                                                                                .toString(),
                                                                            vehicleLicenseNumber:
                                                                                UptimeFleetAppGroup.getRequestCall.vehicleRegNo(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            ),
                                                                            vehicleInformation:
                                                                                UptimeFleetAppGroup.getRequestCall.vehicleColor(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            ),
                                                                            vehicleVinNumber: UptimeFleetAppGroup.getRequestCall
                                                                                .vehicleVinNumber(
                                                                                  containerGetRequestResponse.jsonBody,
                                                                                )
                                                                                .toString(),
                                                                            locationLat:
                                                                                functions.convertStringToDouble(UptimeFleetAppGroup.getRequestCall.lat(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            ))!,
                                                                            locationLng:
                                                                                functions.convertStringToDouble(UptimeFleetAppGroup.getRequestCall.lng(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            ))!,
                                                                            firebaseId:
                                                                                functions.convertStringToRequestDocRef(UptimeFleetAppGroup.getRequestCall.firebaseId(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            ))!,
                                                                            status:
                                                                                UptimeFleetAppGroup.getRequestCall.status(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            )!,
                                                                            driverTechMessageId:
                                                                                UptimeFleetAppGroup.getRequestCall.driverTechnicianMessageThreadId(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            )!,
                                                                            bubbleId:
                                                                                UptimeFleetAppGroup.getRequestCall.uniqueId(
                                                                              containerGetRequestResponse.jsonBody,
                                                                            )!,
                                                                            driverImage: UptimeFleetAppGroup.getRequestCall
                                                                                .driverImage(
                                                                                  containerGetRequestResponse.jsonBody,
                                                                                )
                                                                                .toString(),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            421.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        child:
                                                                            wrapWithModel(
                                                                          model:
                                                                              _model.confirmCancellationModel,
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          child:
                                                                              ConfirmCancellationWidget(
                                                                            request:
                                                                                containerRequestRecord.reference.id,
                                                                            driver:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 15.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.bottomBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BottomBarWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
// Don't forget to add these to your AndroidManifest.xml:
/*
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
<uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
*/

// And to your Info.plist:
/*
<key>UIBackgroundModes</key>
<array>
    <string>location</string>
    <string>fetch</string>
    <string>processing</string>
</array>
<key>NSLocationWhenInUseUsageDescription</key>
<string>Location is required to find out where you are</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>Location is required to find out where you are</string>
*/


