import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'select_vehicle_model.dart';
export 'select_vehicle_model.dart';

class SelectVehicleWidget extends StatefulWidget {
  const SelectVehicleWidget({super.key});

  @override
  State<SelectVehicleWidget> createState() => _SelectVehicleWidgetState();
}

class _SelectVehicleWidgetState extends State<SelectVehicleWidget> {
  late SelectVehicleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectVehicleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: AuthUserStreamWidget(
        builder: (context) => FutureBuilder<ApiCallResponse>(
          future: UptimeFleetAppGroup.getTechnicianVehiclesCall.call(
            technicianId: valueOrDefault(currentUserDocument?.technicianId, ''),
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
            final containerGetTechnicianVehiclesResponse = snapshot.data!;
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
                      width: MediaQuery.sizeOf(context).width * 0.9,
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
                          'Please select vehicle',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Yantramanav',
                                    color: Colors.black,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (!functions.checkNull(
                          UptimeFleetAppGroup.getTechnicianVehiclesCall
                              .licensePlate(
                                containerGetTechnicianVehiclesResponse.jsonBody,
                              )
                              ?.first)) {
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 84.0,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Registration Number',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Yantramanav',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(null),
                                  options: UptimeFleetAppGroup
                                      .getTechnicianVehiclesCall
                                      .licensePlate(
                                    containerGetTechnicianVehiclesResponse
                                        .jsonBody,
                                  )!,
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue = val),
                                  width: double.infinity,
                                  height: 50.0,
                                  searchHintTextStyle:
                                      FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            letterSpacing: 0.0,
                                          ),
                                  searchTextStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Yantramanav',
                                        letterSpacing: 0.0,
                                      ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Yantramanav',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Please select...',
                                  searchHintText: 'Search for a vehicle',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 10.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: true,
                                  isMultiSelect: false,
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          width: double.infinity,
                          height: 180.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: wrapWithModel(
                            model: _model.emptyStateSimpleModel,
                            updateCallback: () => setState(() {}),
                            child: EmptyStateSimpleWidget(
                              icon: Icon(
                                Icons.fire_truck_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 40.0,
                              ),
                              title: 'No vehicles to display',
                              body:
                                  'Vehicles added by your manager will appear here',
                              action: () async {},
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.0),
                                      border: Border.all(
                                        color: const Color(0xFF0CCA4A),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Cancel',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Yantramanav',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (UptimeFleetAppGroup.getTechnicianVehiclesCall
                                        .licensePlate(
                                          containerGetTechnicianVehiclesResponse
                                              .jsonBody,
                                        )
                                        ?.first !=
                                    null &&
                                UptimeFleetAppGroup.getTechnicianVehiclesCall
                                        .licensePlate(
                                          containerGetTechnicianVehiclesResponse
                                              .jsonBody,
                                        )
                                        ?.first !=
                                    '')
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.vehicles =
                                          await UptimeFleetAppGroup
                                              .getTechnicianVehiclesCall
                                              .call(
                                        technicianId: valueOrDefault(
                                            currentUserDocument?.technicianId,
                                            ''),
                                      );
                                      if ((_model.vehicles?.succeeded ??
                                          true)) {
                                        _model.apiResultpgx =
                                            await UptimeFleetAppGroup
                                                .updateTechnicianCall
                                                .call(
                                          activeVehiceId: UptimeFleetAppGroup
                                              .getTechnicianVehiclesCall
                                              .id(
                                                (_model.vehicles?.jsonBody ??
                                                    ''),
                                              )
                                              ?.where((e) =>
                                                  e == _model.dropDownValue)
                                              .toList()
                                              .first,
                                          technicianId: valueOrDefault(
                                              currentUserDocument?.technicianId,
                                              ''),
                                        );
                                        if ((_model.apiResultpgx?.succeeded ??
                                            true)) {
                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            activeVehicle: UptimeFleetAppGroup
                                                .getTechnicianVehiclesCall
                                                .id(
                                                  (_model.vehicles?.jsonBody ??
                                                      ''),
                                                )
                                                ?.where((e) =>
                                                    e == _model.dropDownValue)
                                                .toList()
                                                .first,
                                          ));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Entry updated successfully!',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          Navigator.pop(context);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Something went wrong. Please try again later',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  const Color(0xFFF50833),
                                            ),
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Something went wrong. Please try again later',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor: const Color(0xFFF50833),
                                          ),
                                        );
                                      }

                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 56.0,
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF7DEFA2),
                                            Color(0xFF0CCA4A)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Confirm',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Yantramanav',
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
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
    );
  }
}
