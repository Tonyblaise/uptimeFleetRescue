import '';
import '/backend/api_requests/api_calls.dart';
import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/driver/chat/service_summary_widget/service_summary_widget_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'start_request_model.dart';
export 'start_request_model.dart';

class StartRequestWidget extends StatefulWidget {
  const StartRequestWidget({
    super.key,
    required this.request,
  });

  final String? request;

  static String routeName = 'start_request';
  static String routePath = 'start_request';

  @override
  State<StartRequestWidget> createState() => _StartRequestWidgetState();
}

class _StartRequestWidgetState extends State<StartRequestWidget> {
  late StartRequestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartRequestModel());

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
        title: 'start_request',
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
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
              ),
              actions: [],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future: UptimeFleetAppGroup.getRequestCall.call(
                  request: widget.request,
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
                  final containerGetRequestResponse = snapshot.data!;

                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
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
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
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
                                  Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                          FlutterFlowTheme.of(context).tertiary
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(36.0),
                                        bottomRight: Radius.circular(36.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Service',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Yantramanav',
                                                    color: Colors.black,
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: '\nsummary',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 36.0,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Yantramanav',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.serviceSummaryWidgetModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ServiceSummaryWidgetWidget(
                                  fleetCompanyName: functions.checkNull(
                                              UptimeFleetAppGroup.getRequestCall
                                                  .driverCompanyName(
                                            containerGetRequestResponse
                                                .jsonBody,
                                          )) ==
                                          false
                                      ? UptimeFleetAppGroup.getRequestCall
                                          .driverCompanyName(
                                          containerGetRequestResponse.jsonBody,
                                        )
                                      : 'N/A',
                                  driverName: functions.checkNull(
                                              UptimeFleetAppGroup.getRequestCall
                                                  .driverFullName(
                                            containerGetRequestResponse
                                                .jsonBody,
                                          )) ==
                                          false
                                      ? UptimeFleetAppGroup.getRequestCall
                                          .driverFullName(
                                          containerGetRequestResponse.jsonBody,
                                        )
                                      : 'N/A',
                                  driverPhoneNumber: functions.checkNull(
                                              UptimeFleetAppGroup.getRequestCall
                                                  .driverPhoneNumber(
                                            containerGetRequestResponse
                                                .jsonBody,
                                          )) ==
                                          false
                                      ? UptimeFleetAppGroup.getRequestCall
                                          .driverPhoneNumber(
                                          containerGetRequestResponse.jsonBody,
                                        )
                                      : 'N/A',
                                  serviceId: functions.checkNull(
                                              UptimeFleetAppGroup.getRequestCall
                                                  .serviceId(
                                            containerGetRequestResponse
                                                .jsonBody,
                                          )) ==
                                          false
                                      ? UptimeFleetAppGroup.getRequestCall
                                          .serviceId(
                                          containerGetRequestResponse.jsonBody,
                                        )
                                      : 'N/A',
                                  timestamp: dateTimeFormat(
                                    "M/d h:mm a",
                                    functions.converUnixTimestamp(
                                        UptimeFleetAppGroup.getRequestCall
                                            .timestamp(
                                      containerGetRequestResponse.jsonBody,
                                    )!),
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  eventType:
                                      UptimeFleetAppGroup.getRequestCall.fault(
                                    containerGetRequestResponse.jsonBody,
                                  ),
                                  pickUp: UptimeFleetAppGroup.getRequestCall
                                      .location(
                                    containerGetRequestResponse.jsonBody,
                                  ),
                                  dropOff: functions.checkNull(
                                              UptimeFleetAppGroup.getRequestCall
                                                  .dropOffLocation(
                                                    containerGetRequestResponse
                                                        .jsonBody,
                                                  )
                                                  .toString()) ==
                                          false
                                      ? UptimeFleetAppGroup.getRequestCall
                                          .dropOffLocation(
                                            containerGetRequestResponse
                                                .jsonBody,
                                          )
                                          .toString()
                                      : 'N/A',
                                  vehicleLicenseNumber: UptimeFleetAppGroup
                                      .getRequestCall
                                      .vehicleRegNo(
                                    containerGetRequestResponse.jsonBody,
                                  ),
                                  vehicleInformation: functions.checkNull(
                                          UptimeFleetAppGroup.getRequestCall
                                              .vehicleDetails(
                                    containerGetRequestResponse.jsonBody,
                                  ))
                                      ? 'N/A'
                                      : UptimeFleetAppGroup.getRequestCall
                                          .vehicleDetails(
                                          containerGetRequestResponse.jsonBody,
                                        ),
                                  vehicleVinNumber: functions.checkNull(
                                              UptimeFleetAppGroup.getRequestCall
                                                  .vehicleVinNumber(
                                                    containerGetRequestResponse
                                                        .jsonBody,
                                                  )
                                                  .toString()) ==
                                          false
                                      ? UptimeFleetAppGroup.getRequestCall
                                          .vehicleVinNumber(
                                            containerGetRequestResponse
                                                .jsonBody,
                                          )
                                          .toString()
                                      : 'N/A',
                                  locationLat: functions.convertStringToDouble(
                                      functions
                                          .convertStringToDouble(
                                              UptimeFleetAppGroup.getRequestCall
                                                  .lat(
                                            containerGetRequestResponse
                                                .jsonBody,
                                          ))
                                          .toString())!,
                                  locationLng: functions.convertStringToDouble(
                                      functions
                                          .convertStringToDouble(
                                              UptimeFleetAppGroup.getRequestCall
                                                  .lng(
                                            containerGetRequestResponse
                                                .jsonBody,
                                          ))
                                          .toString())!,
                                  firebaseId:
                                      functions.convertStringToRequestDocRef(
                                          UptimeFleetAppGroup.getRequestCall
                                              .firebaseId(
                                    containerGetRequestResponse.jsonBody,
                                  ))!,
                                  status:
                                      UptimeFleetAppGroup.getRequestCall.status(
                                    containerGetRequestResponse.jsonBody,
                                  )!,
                                  driverTechMessageId: UptimeFleetAppGroup
                                      .getRequestCall
                                      .driverTechnicianMessageThreadId(
                                    containerGetRequestResponse.jsonBody,
                                  )!,
                                  bubbleId: UptimeFleetAppGroup.getRequestCall
                                      .uniqueBubbleId(
                                    containerGetRequestResponse.jsonBody,
                                  )!,
                                  driverImage: UptimeFleetAppGroup
                                      .getRequestCall
                                      .driverImage(
                                        containerGetRequestResponse.jsonBody,
                                      )
                                      .toString(),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
