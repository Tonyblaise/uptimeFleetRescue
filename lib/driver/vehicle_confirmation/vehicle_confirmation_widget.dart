import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/driver/confirm_request/confirm_request_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/chat/empty_image/empty_image_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'vehicle_confirmation_model.dart';
export 'vehicle_confirmation_model.dart';

class VehicleConfirmationWidget extends StatefulWidget {
  const VehicleConfirmationWidget({
    super.key,
    required this.service,
    required this.latLng,
    this.additionalInfo,
  });

  final String? service;
  final LatLng? latLng;
  final String? additionalInfo;

  @override
  State<VehicleConfirmationWidget> createState() =>
      _VehicleConfirmationWidgetState();
}

class _VehicleConfirmationWidgetState extends State<VehicleConfirmationWidget> {
  late VehicleConfirmationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VehicleConfirmationModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: (functions.checkNull(_model.color) ? true : false)
            ? _model.color
            : '  ');
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(
        text: (functions.checkNull(_model.color) ? true : false)
            ? _model.details
            : '  ');
    _model.textFieldFocusNode3 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
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
                              FlutterFlowTheme.of(context).secondary,
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
                                  text: 'Please confirm',
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
                                  text: '\nyour vehicle',
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
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(),
                                        child: Text(
                                          'License Plate',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Yantramanav',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        decoration: const BoxDecoration(),
                                        child: Form(
                                          key: _model.formKey2,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 4.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController1,
                                              focusNode:
                                                  _model.textFieldFocusNode1,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Enter license plate',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFCBD5E1),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0, 0.0, 8.0, 0.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Yantramanav',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              validator: _model
                                                  .textController1Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_model.apiCallMade != true)
                                        Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.formKey2
                                                          .currentState ==
                                                      null ||
                                                  !_model.formKey2.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              _model.vehicle =
                                                  await UptimeFleetAppGroup
                                                      .getVehiclesCall
                                                      .call(
                                                vehicleRegNo:
                                                    _model.textController1.text,
                                                driverId: valueOrDefault(
                                                    currentUserDocument
                                                        ?.driverId,
                                                    ''),
                                              );
                                              if ((_model.vehicle?.succeeded ??
                                                      true) ==
                                                  true) {
                                                setState(() {
                                                  _model.vehicleId =
                                                      UptimeFleetAppGroup
                                                          .getVehiclesCall
                                                          .id(
                                                    (_model.vehicle?.jsonBody ??
                                                        ''),
                                                  );
                                                  _model.color =
                                                      UptimeFleetAppGroup
                                                          .getVehiclesCall
                                                          .color(
                                                    (_model.vehicle?.jsonBody ??
                                                        ''),
                                                  );
                                                  _model.state =
                                                      UptimeFleetAppGroup
                                                          .getVehiclesCall
                                                          .state(
                                                    (_model.vehicle?.jsonBody ??
                                                        ''),
                                                  );
                                                  _model.image =
                                                      UptimeFleetAppGroup
                                                          .getVehiclesCall
                                                          .image(
                                                    (_model.vehicle?.jsonBody ??
                                                        ''),
                                                  );
                                                  _model.apiCallMade = true;
                                                  _model.details =
                                                      UptimeFleetAppGroup
                                                          .getVehiclesCall
                                                          .details(
                                                            (_model.vehicle
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString();
                                                });
                                              } else {
                                                if (getJsonField(
                                                      (_model.vehicle
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.body.message''',
                                                    ) !=
                                                    null) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        getJsonField(
                                                          (_model.vehicle
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.body.message''',
                                                        ).toString(),
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          const Color(0xFFF50833),
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        getJsonField(
                                                          (_model.vehicle
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.translation''',
                                                        ).toString(),
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          const Color(0xFFF50833),
                                                    ),
                                                  );
                                                }
                                              }

                                              setState(() {});
                                            },
                                            text: 'Next',
                                            options: FFButtonOptions(
                                              height: 50.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Yantramanav',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                    ].divide(const SizedBox(height: 5.0)),
                                  ),
                                ),
                                if (_model.apiCallMade == true)
                                  Form(
                                    key: _model.formKey1,
                                    autovalidateMode: AutovalidateMode.always,
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Color',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Yantramanav',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 4.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController2,
                                                      focusNode: _model
                                                          .textFieldFocusNode2,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Enter vehicle’s color',
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors.white,
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
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                      validator: _model
                                                          .textController2Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 5.0)),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Details',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Yantramanav',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 4.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController3,
                                                      focusNode: _model
                                                          .textFieldFocusNode3,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Enter vehicle’s color',
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors.white,
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
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                      validator: _model
                                                          .textController3Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 5.0)),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'State',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Yantramanav',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  decoration: const BoxDecoration(),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .dropDownValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.dropDownValue ??=
                                                          (functions.checkNull(
                                                                      _model
                                                                          .state)
                                                                  ? true
                                                                  : false)
                                                              ? _model.state
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
                                                        setState(() => _model
                                                                .dropDownValue =
                                                            val),
                                                    width: 300.0,
                                                    height: 52.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Yantramanav',
                                                          color:
                                                              const Color(0xFF64748B),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        'Enter state of registration',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                    borderRadius: 18.0,
                                                    margin:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    isOverButton: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 5.0)),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if (_model.image != null &&
                                                  _model.image != '') {
                                                return Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  decoration: const BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Upload image (press image to replace)',
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
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        height: 150.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            final selectedMedia =
                                                                await selectMediaWithSourceBottomSheet(
                                                              context: context,
                                                              allowPhoto: true,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              setState(() =>
                                                                  _model.isDataUploading1 =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                showUploadMessage(
                                                                  context,
                                                                  'Uploading file...',
                                                                  showLoading:
                                                                      true,
                                                                );
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                downloadUrls = (await Future
                                                                        .wait(
                                                                  selectedMedia
                                                                      .map(
                                                                    (m) async =>
                                                                        await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                  ),
                                                                ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                              } finally {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .hideCurrentSnackBar();
                                                                _model.isDataUploading1 =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                setState(() {
                                                                  _model.uploadedLocalFile1 =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl1 =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                                showUploadMessage(
                                                                    context,
                                                                    'Success!');
                                                              } else {
                                                                setState(() {});
                                                                showUploadMessage(
                                                                    context,
                                                                    'Failed to upload data');
                                                                return;
                                                              }
                                                            }

                                                            setState(() {
                                                              _model.image = _model
                                                                  .uploadedFileUrl2;
                                                            });
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              _model.image !=
                                                                          null &&
                                                                      _model.image !=
                                                                          ''
                                                                  ? _model
                                                                      .image!
                                                                  : 'https://dd8c54a01d09ed2b89dfbd9e5dfe0b12.cdn.bubble.io/f1707787273689x274480270947387900/photo.png',
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 5.0)),
                                                  ),
                                                );
                                              } else {
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isDataUploading2 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        showUploadMessage(
                                                          context,
                                                          'Uploading file...',
                                                          showLoading: true,
                                                        );
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading2 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile2 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl2 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                        showUploadMessage(
                                                            context,
                                                            'Success!');
                                                      } else {
                                                        setState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Failed to upload data');
                                                        return;
                                                      }
                                                    }

                                                    setState(() {
                                                      _model.image = _model
                                                          .uploadedFileUrl2;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 179.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .emptyImageModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: EmptyImageWidget(
                                                        icon: Icon(
                                                          Icons
                                                              .file_upload_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 40.0,
                                                        ),
                                                        title:
                                                            'Upload vehicle image',
                                                        body:
                                                            'Click here to upload vehicle image',
                                                        action: () async {},
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          if (_model.apiCallMade == true)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 20.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  currentUserLocationValue =
                                                      await getCurrentUserLocation(
                                                          defaultLocation:
                                                              const LatLng(0.0, 0.0));
                                                  if (_model.image != null &&
                                                      _model.image != '') {
                                                    var chatsRecordReference =
                                                        ChatsRecord.collection
                                                            .doc();
                                                    await chatsRecordReference
                                                        .set({
                                                      ...createChatsRecordData(
                                                        userA:
                                                            currentUserReference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'users': [
                                                            currentUserReference
                                                          ],
                                                        },
                                                      ),
                                                    });
                                                    _model.chatId = ChatsRecord
                                                        .getDocumentFromData({
                                                      ...createChatsRecordData(
                                                        userA:
                                                            currentUserReference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'users': [
                                                            currentUserReference
                                                          ],
                                                        },
                                                      ),
                                                    }, chatsRecordReference);
                                                    _model.apiResult1adCopy =
                                                        await UptimeFleetAppGroup
                                                            .updateVehicleCall
                                                            .call(
                                                      licensePlate: _model
                                                          .textController1.text,
                                                      state:
                                                          _model.dropDownValue,
                                                      color: _model
                                                          .textController2.text,
                                                      id: _model.vehicleId,
                                                    );

                                                    var requestRecordReference =
                                                        RequestRecord.collection
                                                            .doc();
                                                    await requestRecordReference
                                                        .set(
                                                            createRequestRecordData(
                                                      status: 'newCase',
                                                      firebaseMessageThread:
                                                          _model.chatId
                                                              ?.reference,
                                                      driver:
                                                          currentUserReference,
                                                      location:
                                                          currentUserLocationValue,
                                                      driverName: valueOrDefault(
                                                          currentUserDocument
                                                              ?.fullName,
                                                          ''),
                                                    ));
                                                    _model.request = RequestRecord
                                                        .getDocumentFromData(
                                                            createRequestRecordData(
                                                              status: 'newCase',
                                                              firebaseMessageThread:
                                                                  _model.chatId
                                                                      ?.reference,
                                                              driver:
                                                                  currentUserReference,
                                                              location:
                                                                  currentUserLocationValue,
                                                              driverName: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.fullName,
                                                                  ''),
                                                            ),
                                                            requestRecordReference);
                                                    if ((_model.apiResult1adCopy
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.apiResulty8vCopy =
                                                          await UptimeFleetAppGroup
                                                              .createARequestCall
                                                              .call(
                                                        date: getCurrentTimestamp
                                                            .millisecondsSinceEpoch,
                                                        driverId: valueOrDefault(
                                                            currentUserDocument
                                                                ?.driverId,
                                                            ''),
                                                        fault: widget.service,
                                                        vehicleId:
                                                            _model.vehicleId,
                                                        additionalInfo: widget
                                                            .additionalInfo,
                                                        supportReview: false,
                                                        position: widget.latLng
                                                            ?.toString(),
                                                        chatId: _model.chatId
                                                            ?.reference.id,
                                                        firebaseId: _model
                                                            .request
                                                            ?.reference
                                                            .id,
                                                        driverImage:
                                                            _model.image,
                                                      );
                                                      if ((_model
                                                              .apiResulty8vCopy
                                                              ?.succeeded ??
                                                          true)) {
                                                        await _model
                                                            .request!.reference
                                                            .update(
                                                                createRequestRecordData(
                                                          bubbleId:
                                                              UptimeFleetAppGroup
                                                                  .createARequestCall
                                                                  .uniqueId(
                                                            (_model.apiResulty8vCopy
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                        ));

                                                        await currentUserReference!
                                                            .update(
                                                                createUsersRecordData(
                                                          activeRequest: _model
                                                              .request
                                                              ?.reference,
                                                          activeRequestBubble:
                                                              UptimeFleetAppGroup
                                                                  .createARequestCall
                                                                  .uniqueId(
                                                            (_model.apiResulty8vCopy
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                        ));
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          isDismissible: false,
                                                          enableDrag: false,
                                                          useSafeArea: true,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    SizedBox(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.6,
                                                                  child:
                                                                      const ConfirmRequestWidget(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              getJsonField(
                                                                (_model.apiResulty8vCopy
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.body.message''',
                                                              ).toString(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
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
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            getJsonField(
                                                              (_model.apiResult1adCopy
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.body.message''',
                                                            ).toString(),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              fontSize: 14.0,
                                                            ),
                                                          ),
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              const Color(0xFFF50833),
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Please upload an image',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            const Color(0xFFF50833),
                                                      ),
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                text: 'Next',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  height: 50.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Yantramanav',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                        ].divide(const SizedBox(height: 20.0)),
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
    );
  }
}
