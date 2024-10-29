import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'confirm_vehicle_details_model.dart';
export 'confirm_vehicle_details_model.dart';

class ConfirmVehicleDetailsWidget extends StatefulWidget {
  const ConfirmVehicleDetailsWidget({
    super.key,
    required this.vehicleReg,
    required this.service,
  });

  final String? vehicleReg;
  final String? service;

  @override
  State<ConfirmVehicleDetailsWidget> createState() =>
      _ConfirmVehicleDetailsWidgetState();
}

class _ConfirmVehicleDetailsWidgetState
    extends State<ConfirmVehicleDetailsWidget> {
  late ConfirmVehicleDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmVehicleDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 20.0),
        child: AuthUserStreamWidget(
          builder: (context) => FutureBuilder<ApiCallResponse>(
            future: UptimeFleetAppGroup.getVehiclesByRegNoCall.call(
              vehicleRegNo: widget.vehicleReg,
              driverId: valueOrDefault(currentUserDocument?.driverId, ''),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final containerGetVehiclesByRegNoResponse = snapshot.data!;

              return Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 500.0,
                ),
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
                              FlutterFlowTheme.of(context).secondary,
                              FlutterFlowTheme.of(context).tertiary
                            ],
                            stops: const [0.0, 1.0],
                            begin: const AlignmentDirectional(0.0, -1.0),
                            end: const AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Confirm Vehicle Details',
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
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: const Color(0xFFCBD5E1),
                        ),
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
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'License Plate',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      UptimeFleetAppGroup.getVehiclesByRegNoCall
                                          .licensePlate(
                                        containerGetVehiclesByRegNoResponse
                                            .jsonBody,
                                      )!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            color: const Color(0xFF64748B),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Make',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      UptimeFleetAppGroup.getVehiclesByRegNoCall
                                          .make(
                                        containerGetVehiclesByRegNoResponse
                                            .jsonBody,
                                      )!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            color: const Color(0xFF64748B),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Model',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      UptimeFleetAppGroup.getVehiclesByRegNoCall
                                          .model(
                                        containerGetVehiclesByRegNoResponse
                                            .jsonBody,
                                      )!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            color: const Color(0xFF64748B),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Year',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      UptimeFleetAppGroup.getVehiclesByRegNoCall
                                          .year(
                                            containerGetVehiclesByRegNoResponse
                                                .jsonBody,
                                          )
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            color: const Color(0xFF64748B),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 10.0)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 20.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('landing_page');
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 56.0,
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.sizeOf(context).width * 0.9,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      Navigator.pop(context, false);

                                      context.pushNamed(
                                        'vehicle_confirmation',
                                        queryParameters: {
                                          'service': serializeParam(
                                            widget.service,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 130.0,
                                      height: 56.0,
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Not my vehicle',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Yantramanav',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      Navigator.pop(context, true);

                                      context.pushNamed(
                                        'vehicle_confirmation2',
                                        queryParameters: {
                                          'service': serializeParam(
                                            widget.service,
                                            ParamType.String,
                                          ),
                                          'additionalInfo': serializeParam(
                                            '',
                                            ParamType.String,
                                          ),
                                          'licensePlate': serializeParam(
                                            UptimeFleetAppGroup
                                                .getVehiclesByRegNoCall
                                                .licensePlate(
                                              containerGetVehiclesByRegNoResponse
                                                  .jsonBody,
                                            ),
                                            ParamType.String,
                                          ),
                                          'state': serializeParam(
                                            UptimeFleetAppGroup
                                                .getVehiclesByRegNoCall
                                                .state(
                                              containerGetVehiclesByRegNoResponse
                                                  .jsonBody,
                                            ),
                                            ParamType.String,
                                          ),
                                          'notes': serializeParam(
                                            UptimeFleetAppGroup
                                                .getVehiclesByRegNoCall
                                                .details(
                                                  containerGetVehiclesByRegNoResponse
                                                      .jsonBody,
                                                )
                                                .toString(),
                                            ParamType.String,
                                          ),
                                          'color': serializeParam(
                                            UptimeFleetAppGroup
                                                .getVehiclesByRegNoCall
                                                .color(
                                              containerGetVehiclesByRegNoResponse
                                                  .jsonBody,
                                            ),
                                            ParamType.String,
                                          ),
                                          'id': serializeParam(
                                            UptimeFleetAppGroup
                                                .getVehiclesByRegNoCall
                                                .id(
                                              containerGetVehiclesByRegNoResponse
                                                  .jsonBody,
                                            ),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    text: 'Confirm',
                                    options: FFButtonOptions(
                                      width: 130.0,
                                      height: 56.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 32.0)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
