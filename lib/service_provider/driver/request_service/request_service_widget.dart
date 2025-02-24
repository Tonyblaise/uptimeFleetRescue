import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/service_provider/request_location/request_location_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'request_service_model.dart';
export 'request_service_model.dart';

class RequestServiceWidget extends StatefulWidget {
  const RequestServiceWidget({
    super.key,
    required this.fleetManagerId,
  });

  final String? fleetManagerId;

  static String routeName = 'request_service';
  static String routePath = 'request_service';

  @override
  State<RequestServiceWidget> createState() => _RequestServiceWidgetState();
}

class _RequestServiceWidgetState extends State<RequestServiceWidget> {
  late RequestServiceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestServiceModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.fullnameTextController ??= TextEditingController();
    _model.fullnameFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
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

    return Title(
        title: 'request_service',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 500.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FutureBuilder<List<UsersRecord>>(
                          future: queryUsersRecordOnce(
                            queryBuilder: (usersRecord) => usersRecord.where(
                              'onDuty',
                              isEqualTo: true,
                            ),
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
                            List<UsersRecord> containerUsersRecordList =
                                snapshot.data!
                                    .where((u) => u.uid != currentUserUid)
                                    .toList();

                            return Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.5,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FlutterFlowGoogleMap(
                                controller: _model.googleMapsController,
                                onCameraIdle: (latLng) =>
                                    _model.googleMapsCenter = latLng,
                                initialLocation: _model.googleMapsCenter ??=
                                    currentUserLocationValue!,
                                markers: containerUsersRecordList
                                    .map((e) => e.technicianLastUpdatedLocation)
                                    .withoutNulls
                                    .toList()
                                    .map(
                                      (marker) => FlutterFlowMarker(
                                        marker.serialize(),
                                        marker,
                                      ),
                                    )
                                    .toList(),
                                markerColor: GoogleMarkerColor.violet,
                                markerImage: MarkerImage(
                                  imagePath:
                                      'https://dd8c54a01d09ed2b89dfbd9e5dfe0b12.cdn.bubble.io/f1739621667111x130442481430978140/WhatsApp%20Image%202025-02-15%20at%2001.39.52.jpeg',
                                  isAssetImage: false,
                                  size: 20.0 ?? 20,
                                ),
                                mapType: MapType.normal,
                                style: GoogleMapStyle.standard,
                                initialZoom: 14.0,
                                allowInteraction: true,
                                allowZoom: true,
                                showZoomControls: true,
                                showLocation: false,
                                showCompass: true,
                                showMapToolbar: true,
                                showTraffic: true,
                                centerMapOnMarkerTap: true,
                              ),
                            );
                          },
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 85.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Yantramanav',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: TextFormField(
                                          controller:
                                              _model.fullnameTextController,
                                          focusNode: _model.fullnameFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Enter your full names',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Yantramanav',
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFCBD5E1),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Yantramanav',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          validator: _model
                                              .fullnameTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 58.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowDropDown<String>(
                                        controller:
                                            _model.dropDownValueController ??=
                                                FormFieldController<String>(
                                          _model.dropDownValue ??= '+1',
                                        ),
                                        options: ['+1', '+254'],
                                        onChanged: (val) => safeSetState(
                                            () => _model.dropDownValue = val),
                                        width: 62.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Yantramanav',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: '+1',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        elevation: 0.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 0.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 4.0),
                                          child: TextFormField(
                                            controller: _model.textController2,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Enter Phone Number',
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
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Yantramanav',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            keyboardType: TextInputType.phone,
                                            validator: _model
                                                .textController2Validator
                                                .asValidator(context),
                                            inputFormatters: [
                                              _model.textFieldMask
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 56.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).secondary,
                                  FlutterFlowTheme.of(context).tertiary
                                ],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: FFButtonWidget(
                              onPressed: () async {
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                _model.location3 =
                                    await actions.checkLocationPermissions();
                                if (_model.location3 == true) {
                                  _model.check = await UptimeFleetAppGroup
                                      .checkUserCall
                                      .call(
                                    phoneNumber:
                                        '${_model.dropDownValue}${_model.textController2.text}',
                                  );

                                  if ((_model.check?.succeeded ?? true)) {
                                    if (UptimeFleetAppGroup.checkUserCall
                                            .signUpType(
                                          (_model.check?.jsonBody ?? ''),
                                        ) !=
                                        'technician') {
                                      GoRouter.of(context).prepareAuthEvent();
                                      final user = await authManager
                                          .signInAnonymously(context);
                                      if (user == null) {
                                        return;
                                      }

                                      var chatsRecordReference1 =
                                          ChatsRecord.collection.doc();
                                      await chatsRecordReference1.set({
                                        ...createChatsRecordData(
                                          userA: currentUserReference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'users': [currentUserReference],
                                          },
                                        ),
                                      });
                                      _model.supportchat =
                                          ChatsRecord.getDocumentFromData({
                                        ...createChatsRecordData(
                                          userA: currentUserReference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'users': [currentUserReference],
                                          },
                                        ),
                                      }, chatsRecordReference1);

                                      var chatsRecordReference2 =
                                          ChatsRecord.collection.doc();
                                      await chatsRecordReference2.set({
                                        ...createChatsRecordData(
                                          userA: currentUserReference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'users': [currentUserReference],
                                          },
                                        ),
                                      });
                                      _model.technicianChat =
                                          ChatsRecord.getDocumentFromData({
                                        ...createChatsRecordData(
                                          userA: currentUserReference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'users': [currentUserReference],
                                          },
                                        ),
                                      }, chatsRecordReference2);
                                      _model.driver = await UptimeFleetAppGroup
                                          .createDriverCall
                                          .call(
                                        fleetManagerId: widget.fleetManagerId,
                                        fullName:
                                            _model.fullnameTextController.text,
                                        phoneNumber:
                                            '${_model.dropDownValue}${_model.textController2.text}',
                                        driverTechnicianMessageThreadIdFirebase:
                                            _model.technicianChat?.reference.id,
                                        driverSupportMessageThreadIdFirebase:
                                            _model.supportchat?.reference.id,
                                      );

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        companyId: UptimeFleetAppGroup
                                            .createDriverCall
                                            .companyId(
                                          (_model.driver?.jsonBody ?? ''),
                                        ),
                                        companyName: UptimeFleetAppGroup
                                            .createDriverCall
                                            .companyName(
                                          (_model.driver?.jsonBody ?? ''),
                                        ),
                                        driverId: UptimeFleetAppGroup
                                            .createDriverCall
                                            .id(
                                          (_model.driver?.jsonBody ?? ''),
                                        ),
                                        fullName:
                                            _model.fullnameTextController.text,
                                        driverFleetManagerMessageThreadId:
                                            _model.technicianChat?.reference.id,
                                        driverSupportMessageThreadId:
                                            _model.supportchat?.reference.id,
                                        profilePicture: '',
                                        phoneNumber:
                                            '${_model.dropDownValue}${_model.textController2.text}',
                                        driverSupportMessageThreadIdFirebase:
                                            _model.supportchat?.reference,
                                        driverFleetManagerMessageThreadIdFirebaseId:
                                            _model.technicianChat?.reference,
                                      ));
                                      _model.test = await UptimeFleetAppGroup
                                          .updateDriverIdCall
                                          .call(
                                        bubbleId: UptimeFleetAppGroup
                                            .createDriverCall
                                            .id(
                                          (_model.driver?.jsonBody ?? ''),
                                        ),
                                        firebaseId: currentUserReference?.id,
                                      );

                                      context.goNamedAuth(
                                          LandingPageWidget.routeName,
                                          context.mounted);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Account already exists as a technician.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3200),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Something went wrong. Please try again later.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }
                                } else {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    isDismissible: false,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: RequestLocationWidget(
                                            phone:
                                                '${_model.dropDownValue}${_model.textController2.text}',
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }

                                safeSetState(() {});
                              },
                              text: 'Start request',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 56.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tertiary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Yantramanav',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 18.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
