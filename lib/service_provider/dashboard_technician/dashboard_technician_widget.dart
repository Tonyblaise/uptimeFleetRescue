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
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dashboard_technician_model.dart';
export 'dashboard_technician_model.dart';

class DashboardTechnicianWidget extends StatefulWidget {
  const DashboardTechnicianWidget({super.key});

  static String routeName = 'dashboardTechnician';
  static String routePath = 'dashboard_technician';

  @override
  State<DashboardTechnicianWidget> createState() =>
      _DashboardTechnicianWidgetState();
}

class _DashboardTechnicianWidgetState extends State<DashboardTechnicianWidget> {
  late DashboardTechnicianModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardTechnicianModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      await Future.wait([
        Future(() async {
          if (currentUserLocationValue != null) {
            _model.apiResultayo6 = await UptimeFleetAppGroup
                .updateTechnicianPositionUsingCurrentPostionCall
                .call(
              technicianId:
                  valueOrDefault(currentUserDocument?.technicianId, ''),
              position: currentUserLocationValue?.toString(),
            );

            await currentUserReference!.update(createUsersRecordData(
              technicianLastUpdatedLocation: currentUserLocationValue,
            ));
          } else {
            await requestPermission(locationPermission);
            _model.apiResultayoo = await UptimeFleetAppGroup
                .updateTechnicianPositionUsingCurrentPostionCall
                .call(
              technicianId:
                  valueOrDefault(currentUserDocument?.technicianId, ''),
              position: currentUserLocationValue?.toString(),
            );

            await currentUserReference!.update(createUsersRecordData(
              technicianLastUpdatedLocation: currentUserLocationValue,
            ));
          }
        }),
        Future(() async {
          if (currentUserDocument?.activeRequest != null) {
            _model.activeRequest = await RequestRecord.getDocumentOnce(
                currentUserDocument!.activeRequest!);
            if (_model.activeRequest?.started == false) {
              context.pushNamed(
                StartRequestWidget.routeName,
                queryParameters: {
                  'request': serializeParam(
                    _model.activeRequest?.bubbleId,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            }
          }
        }),
      ]);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'dashboardTechnician',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Container(
                decoration: BoxDecoration(),
                child: Text(
                  'Dashboard',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Yantramanav',
                        color: Color(0xFF1E293B),
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              actions: [],
              centerTitle: false,
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
                                                                            currentUserDocument?.activeVehicle,
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
