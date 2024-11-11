import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/service_provider/driver/confirm_cancellation/confirm_cancellation_widget.dart';
import '/service_provider/driver/service_updates_component/service_updates_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'landing_page_model.dart';
export 'landing_page_model.dart';

class LandingPageWidget extends StatefulWidget {
  const LandingPageWidget({super.key});

  @override
  State<LandingPageWidget> createState() => _LandingPageWidgetState();
}

class _LandingPageWidgetState extends State<LandingPageWidget> {
  late LandingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      if (isAndroid || isiOS) {
        _model.latLng = currentUserLocationValue;
        safeSetState(() {});
      } else {
        _model.latLng = currentUserLocationValue;
        safeSetState(() {});
        if (valueOrDefault(currentUserDocument?.technicianId, '') != '') {
          context.pushNamed('dashboardTechnician');
        }
      }
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
    context.watch<FFAppState>();

    return Title(
        title: 'landing_page',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 500.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              if (currentUserDocument?.activeRequest == null) {
                                return Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: const BoxDecoration(),
                                          child: Builder(builder: (context) {
                                            final googleMapMarker =
                                                _model.latLng;
                                            return FlutterFlowGoogleMap(
                                              controller: _model
                                                  .googleMap6879sController,
                                              onCameraIdle: (latLng) =>
                                                  safeSetState(() => _model
                                                          .googleMap6879sCenter =
                                                      latLng),
                                              initialLocation: _model
                                                      .googleMap6879sCenter ??=
                                                  _model.latLng!,
                                              markers: [
                                                if (googleMapMarker != null)
                                                  FlutterFlowMarker(
                                                    googleMapMarker
                                                        .serialize(),
                                                    googleMapMarker,
                                                  ),
                                              ],
                                              markerColor:
                                                  GoogleMarkerColor.violet,
                                              mapType: MapType.normal,
                                              style: GoogleMapStyle.standard,
                                              initialZoom: 14.0,
                                              allowInteraction: true,
                                              allowZoom: true,
                                              showZoomControls: true,
                                              showLocation: true,
                                              showCompass: true,
                                              showMapToolbar: true,
                                              showTraffic: true,
                                              centerMapOnMarkerTap: true,
                                            );
                                          }),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return AuthUserStreamWidget(
                                  builder: (context) =>
                                      StreamBuilder<RequestRecord>(
                                    stream: RequestRecord.getDocument(
                                        currentUserDocument!.activeRequest!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final containerRequestRecord =
                                          snapshot.data!;

                                      return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            if (containerRequestRecord
                                                    .started ==
                                                true) {
                                              return Builder(
                                                builder: (context) {
                                                  if (containerRequestRecord
                                                          .status !=
                                                      'cancelled') {
                                                    return Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord
                                                            .getDocument(
                                                                containerRequestRecord
                                                                    .technician!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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

                                                          final containerUsersRecord =
                                                              snapshot.data!;

                                                          return Container(
                                                            height: 600.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 145.0),
                                                                              child: Builder(builder: (context) {
                                                                                final googleMapMarker = containerUsersRecord.technicianLastUpdatedLocation;
                                                                                return FlutterFlowGoogleMap(
                                                                                  controller: _model.googleMapsController,
                                                                                  onCameraIdle: (latLng) => safeSetState(() => _model.googleMapsCenter = latLng),
                                                                                  initialLocation: _model.googleMapsCenter ??= containerUsersRecord.technicianLastUpdatedLocation!,
                                                                                  markers: [
                                                                                    if (googleMapMarker != null)
                                                                                      FlutterFlowMarker(
                                                                                        googleMapMarker.serialize(),
                                                                                        googleMapMarker,
                                                                                      ),
                                                                                  ],
                                                                                  markerColor: GoogleMarkerColor.violet,
                                                                                  mapType: MapType.normal,
                                                                                  style: GoogleMapStyle.standard,
                                                                                  initialZoom: 14.0,
                                                                                  allowInteraction: true,
                                                                                  allowZoom: true,
                                                                                  showZoomControls: true,
                                                                                  showLocation: true,
                                                                                  showCompass: true,
                                                                                  showMapToolbar: true,
                                                                                  showTraffic: true,
                                                                                  centerMapOnMarkerTap: true,
                                                                                );
                                                                              }),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.9),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                      height: 80.0,
                                                                                      constraints: BoxConstraints(
                                                                                        maxWidth: MediaQuery.sizeOf(context).width * 0.9,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(18.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                        ),
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                          child: Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                            constraints: BoxConstraints(
                                                                                              maxWidth: MediaQuery.sizeOf(context).width * 0.9,
                                                                                            ),
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 44.0,
                                                                                                  height: 44.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    image: DecorationImage(
                                                                                                      fit: BoxFit.cover,
                                                                                                      image: Image.asset(
                                                                                                        'assets/images/image_avatar.jpg',
                                                                                                      ).image,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    width: 100.0,
                                                                                                    height: 100.0,
                                                                                                    decoration: const BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: double.infinity,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Container(
                                                                                                            decoration: const BoxDecoration(),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  ),
                                                                                                                  child: Container(
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          containerUsersRecord.companyName,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Yantramanav',
                                                                                                                                color: const Color(0xFF0F172A),
                                                                                                                                fontSize: 16.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          functions.convertToUppercase(containerUsersRecord.fullName)!,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Yantramanav',
                                                                                                                                color: const Color(0xFF64748B),
                                                                                                                                fontSize: 12.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        'ETA:',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Yantramanav',
                                                                                                                              color: const Color(0xFF64748B),
                                                                                                                              fontSize: 12.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      if (containerUsersRecord.technicianLastUpdatedLocation != null)
                                                                                                                        FutureBuilder<ApiCallResponse>(
                                                                                                                          future: MapboxCall.call(
                                                                                                                            from: '${functions.getLng(containerUsersRecord.technicianLastUpdatedLocation!).toString()},${functions.getLat(containerUsersRecord.technicianLastUpdatedLocation!).toString()}',
                                                                                                                            to: '${functions.getLng(containerRequestRecord.location!).toString()},${functions.getLat(containerRequestRecord.location!).toString()}',
                                                                                                                          ),
                                                                                                                          builder: (context, snapshot) {
                                                                                                                            // Customize what your widget looks like when it's loading.
                                                                                                                            if (!snapshot.hasData) {
                                                                                                                              return Center(
                                                                                                                                child: SizedBox(
                                                                                                                                  width: 50.0,
                                                                                                                                  height: 50.0,
                                                                                                                                  child: CircularProgressIndicator(
                                                                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            }
                                                                                                                            final textMapboxResponse = snapshot.data!;

                                                                                                                            return Text(
                                                                                                                              functions.relativeTime(MapboxCall.durationSeconds(
                                                                                                                                textMapboxResponse.jsonBody,
                                                                                                                              ))!,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Yantramanav',
                                                                                                                                    color: const Color(0xFF64748B),
                                                                                                                                    fontSize: 12.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(const SizedBox(height: 6.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(const SizedBox(width: 16.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                  child: StreamBuilder<ChatsRecord>(
                                                                                    stream: ChatsRecord.getDocument(containerRequestRecord.firebaseMessageThread!),
                                                                                    builder: (context, snapshot) {
                                                                                      // Customize what your widget looks like when it's loading.
                                                                                      if (!snapshot.hasData) {
                                                                                        return Center(
                                                                                          child: SizedBox(
                                                                                            width: 50.0,
                                                                                            height: 50.0,
                                                                                            child: CircularProgressIndicator(
                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }

                                                                                      final buttonChatsRecord = snapshot.data!;

                                                                                      return FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          context.pushNamed(
                                                                                            'chat_2_Details_1',
                                                                                            queryParameters: {
                                                                                              'chatRef': serializeParam(
                                                                                                buttonChatsRecord,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'driver': serializeParam(
                                                                                                true,
                                                                                                ParamType.bool,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'chatRef': buttonChatsRecord,
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        text: 'Message Technician',
                                                                                        options: FFButtonOptions(
                                                                                          width: double.infinity,
                                                                                          height: 50.0,
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'Yantramanav',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          elevation: 3.0,
                                                                                          borderSide: const BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(height: 16.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  } else {
                                                    return Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 450.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .confirmCancellationModel1,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                ConfirmCancellationWidget(
                                                              request:
                                                                  containerRequestRecord
                                                                      .reference
                                                                      .id,
                                                              driver: true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              );
                                            } else {
                                              return Builder(
                                                builder: (context) {
                                                  if (containerRequestRecord
                                                          .status !=
                                                      'cancelled') {
                                                    return StreamBuilder<
                                                        List<UsersRecord>>(
                                                      stream: queryUsersRecord(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                          'onDuty',
                                                          isEqualTo: true,
                                                        ),
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
                                                        List<UsersRecord>
                                                            containerUsersRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child:
                                                                  FlutterFlowGoogleMap(
                                                                controller: _model
                                                                    .googleMaponesController,
                                                                onCameraIdle: (latLng) =>
                                                                    safeSetState(() =>
                                                                        _model.googleMaponesCenter =
                                                                            latLng),
                                                                initialLocation: _model
                                                                        .googleMaponesCenter ??=
                                                                    containerRequestRecord
                                                                        .location!,
                                                                markers: containerUsersRecordList
                                                                    .map((e) => e.technicianLastUpdatedLocation)
                                                                    .withoutNulls
                                                                    .toList()
                                                                    .map(
                                                                      (marker) =>
                                                                          FlutterFlowMarker(
                                                                        marker
                                                                            .serialize(),
                                                                        marker,
                                                                      ),
                                                                    )
                                                                    .toList(),
                                                                markerColor:
                                                                    GoogleMarkerColor
                                                                        .red,
                                                                mapType: MapType
                                                                    .normal,
                                                                style:
                                                                    GoogleMapStyle
                                                                        .standard,
                                                                initialZoom:
                                                                    14.0,
                                                                allowInteraction:
                                                                    true,
                                                                allowZoom: true,
                                                                showZoomControls:
                                                                    true,
                                                                showLocation:
                                                                    true,
                                                                showCompass:
                                                                    true,
                                                                showMapToolbar:
                                                                    true,
                                                                showTraffic:
                                                                    true,
                                                                centerMapOnMarkerTap:
                                                                    true,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    return Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .confirmCancellationModel2,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            ConfirmCancellationWidget(
                                                          request:
                                                              containerRequestRecord
                                                                  .reference.id,
                                                          driver: true,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              );
                                            }
                                          },
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
                      Container(
                        decoration: const BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            if (currentUserDocument?.activeRequest == null) {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  decoration: const BoxDecoration(),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: GetAddressFromLatLngCall.call(
                                      lat: functions.getLat(_model.latLng!),
                                      lng: functions.getLng(_model.latLng!),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final columnGetAddressFromLatLngResponse =
                                          snapshot.data!;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(),
                                            child: Visibility(
                                              visible: _model.addressView,
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          'We see your location as: ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Yantramanav',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    const TextSpan(
                                                      text: '\n',
                                                      style: TextStyle(
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: _model.address !=
                                                                  null &&
                                                              _model.address !=
                                                                  ''
                                                          ? _model.address!
                                                          : valueOrDefault<
                                                              String>(
                                                              GetAddressFromLatLngCall
                                                                  .placename(
                                                                columnGetAddressFromLatLngResponse
                                                                    .jsonBody,
                                                              )?.first,
                                                              '.',
                                                            ),
                                                      style: const TextStyle(),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Yantramanav',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (!_model.addressView)
                                            FlutterFlowPlacePicker(
                                              iOSGoogleMapsApiKey:
                                                  'AIzaSyCQCtKBOInrdAHzTTfpXIeTqKe4-9Q1iB8',
                                              androidGoogleMapsApiKey:
                                                  'AIzaSyCQCtKBOInrdAHzTTfpXIeTqKe4-9Q1iB8',
                                              webGoogleMapsApiKey:
                                                  'AIzaSyCQCtKBOInrdAHzTTfpXIeTqKe4-9Q1iB8',
                                              onSelect: (place) async {
                                                safeSetState(() => _model
                                                    .placePickerValue = place);
                                              },
                                              defaultText:
                                                  'Type in your location',
                                              icon: const Icon(
                                                Icons.place,
                                                color: Color(0xFF0F172A),
                                                size: 16.0,
                                              ),
                                              buttonOptions: FFButtonOptions(
                                                width: double.infinity,
                                                height: 50.0,
                                                color: const Color(0xFFF1F5F9),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Yantramanav',
                                                      color: const Color(0xFF0F172A),
                                                      letterSpacing: 0.0,
                                                    ),
                                                elevation: 2.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.addressView =
                                                  !_model.addressView;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Text(
                                                _model.addressView
                                                    ? 'Change location'
                                                    : 'Back',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Yantramanav',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.addressView == true) {
                                                if (FFAppState().address ==
                                                        '') {
                                                  FFAppState().location =
                                                      _model.latLng;
                                                  FFAppState().address =
                                                      valueOrDefault<String>(
                                                    GetAddressFromLatLngCall
                                                        .placename(
                                                      columnGetAddressFromLatLngResponse
                                                          .jsonBody,
                                                    )?.first,
                                                    '.',
                                                  );
                                                  safeSetState(() {});

                                                  context.pushNamed(
                                                      'dashboardDriver');
                                                } else {
                                                  FFAppState().address =
                                                      _model.address!;
                                                  FFAppState().location =
                                                      _model.latLng;
                                                  safeSetState(() {});
                                                  _model.address = null;
                                                  safeSetState(() {});

                                                  context.pushNamed(
                                                      'dashboardDriver');
                                                }
                                              } else {
                                                await _model
                                                    .googleMap6879sController
                                                    .future
                                                    .then(
                                                  (c) => c.animateCamera(
                                                    CameraUpdate.newLatLng(
                                                        _model.placePickerValue
                                                            .latLng
                                                            .toGoogleMaps()),
                                                  ),
                                                );
                                                _model.addressView = true;
                                                _model.latLng = _model
                                                    .placePickerValue.latLng;
                                                _model.address =
                                                    '${_model.placePickerValue.zipCode} ${_model.placePickerValue.name},${_model.placePickerValue.city}${_model.placePickerValue.state} ${_model.placePickerValue.country}';
                                                safeSetState(() {});
                                              }
                                            },
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.9,
                                              height: 56.0,
                                              constraints: BoxConstraints(
                                                maxWidth:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                              ),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary
                                                  ],
                                                  stops: const [0.0, 1.0],
                                                  begin: const AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: const AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  _model.addressView
                                                      ? 'Confirm Location'
                                                      : 'Confirm Address',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Yantramanav',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 10.0)),
                                      );
                                    },
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                height: 350.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: AuthUserStreamWidget(
                                  builder: (context) =>
                                      StreamBuilder<RequestRecord>(
                                    stream: RequestRecord.getDocument(
                                        currentUserDocument!.activeRequest!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final containerRequestRecord =
                                          snapshot.data!;

                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model
                                              .serviceUpdatesComponentModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          updateOnChange: true,
                                          child: ServiceUpdatesComponentWidget(
                                            request: containerRequestRecord,
                                            chat: containerRequestRecord
                                                .firebaseMessageThread!,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ].divide(const SizedBox(height: 5.0)),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
