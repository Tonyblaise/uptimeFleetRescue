import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'new_request_sp_model.dart';
export 'new_request_sp_model.dart';

class NewRequestSpWidget extends StatefulWidget {
  const NewRequestSpWidget({
    super.key,
    required this.request,
  });

  final DocumentReference? request;

  @override
  State<NewRequestSpWidget> createState() => _NewRequestSpWidgetState();
}

class _NewRequestSpWidgetState extends State<NewRequestSpWidget> {
  late NewRequestSpModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewRequestSpModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: StreamBuilder<RequestRecord>(
          stream: RequestRecord.getDocument(widget.request!),
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

            final containerRequestRecord = snapshot.data!;

            return Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: const BoxDecoration(),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => FutureBuilder<ApiCallResponse>(
                            future: UptimeFleetAppGroup.getRequestCall.call(
                              request: valueOrDefault(
                                  currentUserDocument?.requestPending, ''),
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
                              final containerGetRequestResponse =
                                  snapshot.data!;

                              return Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                              FlutterFlowTheme.of(context)
                                                  .tertiary
                                            ],
                                            stops: const [0.0, 1.0],
                                            begin:
                                                const AlignmentDirectional(0.0, -1.0),
                                            end: const AlignmentDirectional(0, 1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Accept request',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Yantramanav',
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 20.0, 10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Driver Name',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Text(
                                                    UptimeFleetAppGroup
                                                        .getRequestCall
                                                        .driverFullName(
                                                      containerGetRequestResponse
                                                          .jsonBody,
                                                    )!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color:
                                                              const Color(0xFF64748B),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Driver Phone Number',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
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
                                                      await launchUrl(Uri(
                                                        scheme: 'tel',
                                                        path: UptimeFleetAppGroup
                                                            .getRequestCall
                                                            .driverPhoneNumber(
                                                          containerGetRequestResponse
                                                              .jsonBody,
                                                        )!,
                                                      ));
                                                    },
                                                    child: Text(
                                                      UptimeFleetAppGroup
                                                          .getRequestCall
                                                          .driverPhoneNumber(
                                                        containerGetRequestResponse
                                                            .jsonBody,
                                                      )!,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Yantramanav',
                                                            color: const Color(
                                                                0xFF64748B),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Fleet Company Name',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Text(
                                                    UptimeFleetAppGroup
                                                        .getRequestCall
                                                        .driverCompanyName(
                                                      containerGetRequestResponse
                                                          .jsonBody,
                                                    )!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color:
                                                              const Color(0xFF64748B),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Service ID',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Text(
                                                    UptimeFleetAppGroup
                                                        .getRequestCall
                                                        .serviceId(
                                                      containerGetRequestResponse
                                                          .jsonBody,
                                                    )!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color:
                                                              const Color(0xFF64748B),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Timestamp',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Text(
                                                    dateTimeFormat(
                                                      "yMd",
                                                      functions
                                                          .converUnixTimestamp(
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .timestamp(
                                                        containerGetRequestResponse
                                                            .jsonBody,
                                                      )!),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color:
                                                              const Color(0xFF64748B),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Event Type',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Text(
                                                    UptimeFleetAppGroup
                                                        .getRequestCall
                                                        .fault(
                                                      containerGetRequestResponse
                                                          .jsonBody,
                                                    )!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color:
                                                              const Color(0xFF64748B),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Pick Up/Service Location',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Text(
                                                    UptimeFleetAppGroup
                                                        .getRequestCall
                                                        .location(
                                                      containerGetRequestResponse
                                                          .jsonBody,
                                                    )!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color:
                                                              const Color(0xFF64748B),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: FFButtonWidget(
                                                  onPressed: () async {},
                                                  text: 'Cancel',
                                                  options: FFButtonOptions(
                                                    height: 56.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: SizedBox(
                                                  width: 170.0,
                                                  height: 56.0,
                                                  child: custom_widgets
                                                      .MapboxNavigationWidget(
                                                    width: 170.0,
                                                    height: 56.0,
                                                    originLat: functions.getLat(
                                                        currentUserLocationValue!),
                                                    originLng: functions.getLng(
                                                        currentUserLocationValue!),
                                                    destinationLat: containerRequestRecord
                                                                .status ==
                                                            'enrouteToTowDestination'
                                                        ? functions.getLat(
                                                            containerRequestRecord
                                                                .dropOffLocationLatLng!)
                                                        : functions.getLat(
                                                            containerRequestRecord
                                                                .location!),
                                                    destinationLng: containerRequestRecord
                                                                .status ==
                                                            'enrouteToTowDestination'
                                                        ? functions.getLng(
                                                            containerRequestRecord
                                                                .dropOffLocationLatLng!)
                                                        : functions.getLng(
                                                            containerRequestRecord
                                                                .location!),
                                                    chat: containerRequestRecord
                                                        .firebaseMessageThread!
                                                        .id,
                                                    request:
                                                        containerRequestRecord
                                                            .reference,
                                                    driverName:
                                                        containerRequestRecord
                                                            .driverName,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    title: 'Start Job',
                                                    updatePosition: (duration,
                                                        distance) async {
                                                      await currentUserReference!
                                                          .update({
                                                        ...createUsersRecordData(
                                                          activeRequest:
                                                              containerRequestRecord
                                                                  .reference,
                                                          activeRequestBubble:
                                                              containerRequestRecord
                                                                  .bubbleId,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'requestPending':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await containerRequestRecord
                                                          .firebaseMessageThread!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'users': FieldValue
                                                                .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });

                                                      await widget.request!.update(
                                                          createRequestRecordData(
                                                        technician:
                                                            currentUserReference,
                                                      ));

                                                      await containerRequestRecord
                                                          .reference
                                                          .update(
                                                              createRequestRecordData(
                                                        status: 'inProgress',
                                                      ));
                                                      _model.apiResultoanCopy =
                                                          await UptimeFleetAppGroup
                                                              .updateRequestCall
                                                              .call(
                                                        id: containerRequestRecord
                                                            .bubbleId,
                                                        status: 'inProgress',
                                                      );

                                                      Navigator.pop(context);

                                                      context.pushNamed(
                                                          'dashboardTechnician');

                                                      safeSetState(() {});
                                                    },
                                                    startRequest: () async {},
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 15.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 10.0)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
