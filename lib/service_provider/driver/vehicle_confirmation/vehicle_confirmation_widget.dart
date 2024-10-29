import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/service_provider/confirm_vehicle_details/confirm_vehicle_details_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'vehicle_confirmation_model.dart';
export 'vehicle_confirmation_model.dart';

class VehicleConfirmationWidget extends StatefulWidget {
  const VehicleConfirmationWidget({
    super.key,
    required this.service,
    this.additionalInfo,
  });

  final String? service;
  final String? additionalInfo;

  @override
  State<VehicleConfirmationWidget> createState() =>
      _VehicleConfirmationWidgetState();
}

class _VehicleConfirmationWidgetState extends State<VehicleConfirmationWidget> {
  late VehicleConfirmationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VehicleConfirmationModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        title: 'vehicle_confirmation',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
              automaticallyImplyLeading: true,
              title: Container(
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Vehicle Confirmation',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Yantramanav',
                            color: const Color(0xFF1E293B),
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ].divide(const SizedBox(width: 10.0)),
                ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
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
                      Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xF304B53E),
                                    FlutterFlowTheme.of(context).tertiary
                                  ],
                                  stops: const [0.0, 1.0],
                                  begin: const AlignmentDirectional(0.0, -1.0),
                                  end: const AlignmentDirectional(0, 1.0),
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(36.0),
                                  bottomRight: Radius.circular(36.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Enter',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Yantramanav',
                                              color: Colors.black,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      const TextSpan(
                                        text: '\nvehicle details',
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
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        decoration: const BoxDecoration(),
                                        child: AuthUserStreamWidget(
                                          builder: (context) =>
                                              FutureBuilder<ApiCallResponse>(
                                            future: UptimeFleetAppGroup
                                                .getDriverVehiclesCall
                                                .call(
                                              driverId: valueOrDefault(
                                                  currentUserDocument?.driverId,
                                                  ''),
                                            ),
                                            builder: (context, snapshot) {
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
                                              final columnGetDriverVehiclesResponse =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  if (!functions.checkNull(
                                                      UptimeFleetAppGroup
                                                          .getDriverVehiclesCall
                                                          .licensePlate(
                                                            columnGetDriverVehiclesResponse
                                                                .jsonBody,
                                                          )
                                                          ?.first))
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            constraints:
                                                                const BoxConstraints(
                                                              minWidth: double
                                                                  .infinity,
                                                            ),
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Text(
                                                              'Select Vehicle',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Yantramanav',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .vehicledropdownValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: UptimeFleetAppGroup
                                                                  .getDriverVehiclesCall
                                                                  .licensePlate(
                                                                columnGetDriverVehiclesResponse
                                                                    .jsonBody,
                                                              )!,
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.vehicledropdownValue =
                                                                          val),
                                                              width: 300.0,
                                                              height: 52.0,
                                                              searchHintTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Yantramanav',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              searchTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Yantramanav',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Yantramanav',
                                                                        color: const Color(
                                                                            0xFF64748B),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  'Select vehicle option',
                                                              searchHintText:
                                                                  'Search for an vehicle',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius:
                                                                  18.0,
                                                              margin:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  true,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                _model.vehicle2 =
                                                                    await UptimeFleetAppGroup
                                                                        .getVehiclesByRegNoCall
                                                                        .call(
                                                                  vehicleRegNo:
                                                                      functions.convertToUppercase(
                                                                          _model
                                                                              .vehicledropdownValue),
                                                                  driverId: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.driverId,
                                                                      ''),
                                                                );

                                                                if ((_model.vehicle2
                                                                            ?.succeeded ??
                                                                        true) ==
                                                                    true) {
                                                                  _model.vehicleId =
                                                                      UptimeFleetAppGroup
                                                                          .getVehiclesByRegNoCall
                                                                          .id(
                                                                    (_model.vehicle2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.color =
                                                                      UptimeFleetAppGroup
                                                                          .getVehiclesByRegNoCall
                                                                          .color(
                                                                    (_model.vehicle2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.state =
                                                                      UptimeFleetAppGroup
                                                                          .getVehiclesByRegNoCall
                                                                          .state(
                                                                    (_model.vehicle2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.image =
                                                                      UptimeFleetAppGroup
                                                                          .getVehiclesByRegNoCall
                                                                          .image(
                                                                    (_model.vehicle2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.apiCallMade =
                                                                      true;
                                                                  _model.details =
                                                                      '${UptimeFleetAppGroup.getVehiclesByRegNoCall.make(
                                                                    (_model.vehicle2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )}${UptimeFleetAppGroup.getVehiclesByRegNoCall.model(
                                                                    (_model.vehicle2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )}';
                                                                  safeSetState(
                                                                      () {});

                                                                  context
                                                                      .pushNamed(
                                                                    'vehicle_confirmation2',
                                                                    queryParameters:
                                                                        {
                                                                      'service':
                                                                          serializeParam(
                                                                        widget
                                                                            .service,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'additionalInfo':
                                                                          serializeParam(
                                                                        widget
                                                                            .additionalInfo,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'licensePlate':
                                                                          serializeParam(
                                                                        UptimeFleetAppGroup
                                                                            .getVehiclesByRegNoCall
                                                                            .licensePlate(
                                                                          (_model.vehicle2?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'state':
                                                                          serializeParam(
                                                                        UptimeFleetAppGroup
                                                                            .getVehiclesByRegNoCall
                                                                            .state(
                                                                          (_model.vehicle2?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'color':
                                                                          serializeParam(
                                                                        UptimeFleetAppGroup
                                                                            .getVehiclesByRegNoCall
                                                                            .color(
                                                                          (_model.vehicle2?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'image':
                                                                          serializeParam(
                                                                        UptimeFleetAppGroup
                                                                            .getVehiclesByRegNoCall
                                                                            .image(
                                                                          (_model.vehicle2?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'id':
                                                                          serializeParam(
                                                                        UptimeFleetAppGroup
                                                                            .getVehiclesByRegNoCall
                                                                            .id(
                                                                          (_model.vehicle2?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                } else {
                                                                  if (getJsonField(
                                                                        (_model.vehicle2?.jsonBody ??
                                                                            ''),
                                                                        r'''$.body.message''',
                                                                      ) !=
                                                                      null) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          getJsonField(
                                                                            (_model.vehicle2?.jsonBody ??
                                                                                ''),
                                                                            r'''$.body.message''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            const Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            const Color(0xFFF50833),
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          getJsonField(
                                                                            (_model.vehicle2?.jsonBody ??
                                                                                ''),
                                                                            r'''$.translation''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            const Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            const Color(0xFFF50833),
                                                                      ),
                                                                    );
                                                                  }
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              text: 'Next',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: double
                                                                    .infinity,
                                                                height: 50.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Yantramanav',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 3.0,
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Text(
                                                              'OR',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Yantramanav',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 5.0)),
                                                      ),
                                                    ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: const BoxDecoration(),
                                                    child: Text(
                                                      'License Plate',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Yantramanav',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    decoration: const BoxDecoration(),
                                                    child: Form(
                                                      key: _model.formKey,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController,
                                                          focusNode: _model
                                                              .textFieldFocusNode,
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Enter license plate',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Yantramanav',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFFCBD5E1),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                            ),
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                            contentPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Yantramanav',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                          validator: _model
                                                              .textControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'State',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Yantramanav',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            controller: _model
                                                                    .dropDownStateValueController ??=
                                                                FormFieldController<
                                                                    String>(
                                                              _model.dropDownStateValue ??=
                                                                  (functions.checkNull(_model
                                                                              .state)
                                                                          ? true
                                                                          : false)
                                                                      ? _model
                                                                          .state
                                                                      : '  ',
                                                            ),
                                                            options: const [
                                                              'Alabama',
                                                              'Alaska',
                                                              'American Samoa',
                                                              'Arizona',
                                                              'Arkansas',
                                                              'California',
                                                              'Colorado',
                                                              'Connecticut',
                                                              'Delaware',
                                                              'District Of Columbia',
                                                              'Federated States Of Micronesia',
                                                              'Florida',
                                                              'Georgia',
                                                              'Guam',
                                                              'Hawaii',
                                                              'Idaho',
                                                              'Illinois',
                                                              'Indiana',
                                                              'Iowa',
                                                              'Kansas',
                                                              'Kentucky',
                                                              'Louisiana',
                                                              'Maine',
                                                              'Marshall Islands',
                                                              'Maryland',
                                                              'Massachusetts',
                                                              'Michigan',
                                                              'Minnesota',
                                                              'Mississippi',
                                                              'Missouri',
                                                              'Montana',
                                                              'Nebraska',
                                                              'Nevada',
                                                              'New Hampshire',
                                                              'New Jersey',
                                                              'New Mexico',
                                                              'New York',
                                                              'North Carolina',
                                                              'North Dakota',
                                                              'Northern Mariana Islands',
                                                              'Ohio',
                                                              'Oklahoma',
                                                              'Oregon',
                                                              'Palau',
                                                              'Pennsylvania',
                                                              'Puerto Rico',
                                                              'Rhode Island',
                                                              'South Carolina',
                                                              'South Dakota',
                                                              'Tennessee',
                                                              'Texas',
                                                              'Utah',
                                                              'Vermont',
                                                              'Virgin Islands',
                                                              'Virginia',
                                                              'Washington',
                                                              'West Virginia',
                                                              'Wisconsin',
                                                              'Wyoming'
                                                            ],
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.dropDownStateValue =
                                                                        val),
                                                            width: 300.0,
                                                            height: 52.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Yantramanav',
                                                                      color: const Color(
                                                                          0xFF64748B),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'Enter state of registration',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 2.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            borderWidth: 2.0,
                                                            borderRadius: 18.0,
                                                            margin:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: true,
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: const BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          if (_model.formKey
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          _model.vehicle =
                                                              await UptimeFleetAppGroup
                                                                  .getVehiclesCall
                                                                  .call(
                                                            vehicleRegNo: _model
                                                                .textController
                                                                .text,
                                                            driverId: valueOrDefault(
                                                                currentUserDocument
                                                                    ?.driverId,
                                                                ''),
                                                            state: _model
                                                                .dropDownStateValue,
                                                          );

                                                          if ((_model.vehicle
                                                                      ?.succeeded ??
                                                                  true) ==
                                                              true) {
                                                            _model.vehicleId =
                                                                UptimeFleetAppGroup
                                                                    .getVehiclesCall
                                                                    .id(
                                                              (_model.vehicle
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.color =
                                                                UptimeFleetAppGroup
                                                                    .getVehiclesCall
                                                                    .color(
                                                              (_model.vehicle
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.state =
                                                                UptimeFleetAppGroup
                                                                    .getVehiclesCall
                                                                    .state(
                                                              (_model.vehicle
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.image =
                                                                UptimeFleetAppGroup
                                                                    .getVehiclesCall
                                                                    .image(
                                                              (_model.vehicle
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.apiCallMade =
                                                                true;
                                                            _model.details =
                                                                '${UptimeFleetAppGroup.getVehiclesCall.make(
                                                              (_model.vehicle
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )}${UptimeFleetAppGroup.getVehiclesCall.model(
                                                              (_model.vehicle
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )}';
                                                            safeSetState(() {});
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () =>
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        ConfirmVehicleDetailsWidget(
                                                                      vehicleReg: _model
                                                                          .textController
                                                                          .text,
                                                                      service:
                                                                          widget
                                                                              .service!,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          } else {
                                                            if (getJsonField(
                                                                  (_model.vehicle
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.body.message''',
                                                                ) !=
                                                                null) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    getJsonField(
                                                                      (_model.vehicle
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.body.message''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      const Color(
                                                                          0xFFF50833),
                                                                ),
                                                              );
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    getJsonField(
                                                                      (_model.vehicle
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.translation''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      const Color(
                                                                          0xFFF50833),
                                                                ),
                                                              );
                                                            }
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text: 'Next',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 50.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Yantramanav',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(height: 5.0)),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 20.0)),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 20.0)),
                            ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
