import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'verify_model.dart';
export 'verify_model.dart';

class VerifyWidget extends StatefulWidget {
  const VerifyWidget({
    super.key,
    required this.phoneNumber,
    this.serviceProviderId,
    this.fleetManagerId,
    required this.signUpType,
    this.fullName,
    bool? signUp,
  }) : signUp = signUp ?? false;

  final String? phoneNumber;
  final String? serviceProviderId;
  final String? fleetManagerId;
  final String? signUpType;
  final String? fullName;
  final bool signUp;

  @override
  State<VerifyWidget> createState() => _VerifyWidgetState();
}

class _VerifyWidgetState extends State<VerifyWidget> {
  late VerifyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Text(
                'OTP verification',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Yantramanav',
                      color: const Color(0xFF1E293B),
                      fontSize: 30.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 84.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'We\'ve send a verification code to ${widget.phoneNumber}',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Yantramanav',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      PinCodeTextField(
                        autoDisposeControllers: false,
                        appContext: context,
                        length: 6,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Yantramanav',
                                  letterSpacing: 0.0,
                                ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: false,
                        autoFocus: true,
                        enablePinAutofill: false,
                        errorTextSpace: 16.0,
                        showCursor: true,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        obscureText: false,
                        hintCharacter: '●',
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          fieldHeight: 44.0,
                          fieldWidth: 44.0,
                          borderWidth: 2.0,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          shape: PinCodeFieldShape.box,
                          activeColor: FlutterFlowTheme.of(context).primaryText,
                          inactiveColor: FlutterFlowTheme.of(context).alternate,
                          selectedColor: FlutterFlowTheme.of(context).primary,
                          activeFillColor:
                              FlutterFlowTheme.of(context).primaryText,
                          inactiveFillColor:
                              FlutterFlowTheme.of(context).alternate,
                          selectedFillColor:
                              FlutterFlowTheme.of(context).primary,
                        ),
                        controller: _model.pinCodeController,
                        onChanged: (_) {},
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: _model.pinCodeControllerValidator
                            .asValidator(context),
                      ),
                    ].divide(const SizedBox(height: 15.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    final smsCodeVal = _model.pinCodeController!.text;
                    if (smsCodeVal.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Enter SMS verification code.'),
                        ),
                      );
                      return;
                    }
                    final phoneVerifiedUser = await authManager.verifySmsCode(
                      context: context,
                      smsCode: smsCodeVal,
                    );
                    if (phoneVerifiedUser == null) {
                      return;
                    }

                    _model.token = await actions.getFcmToken();
                    if (widget.signUp) {
                      if (widget.signUpType == 'fleet') {
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
                        _model.supportchat = ChatsRecord.getDocumentFromData({
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
                        _model.driver =
                            await UptimeFleetAppGroup.createDriverCall.call(
                          fleetManagerId: widget.fleetManagerId,
                          fullName: widget.fullName,
                          phoneNumber: widget.phoneNumber,
                          token: _model.token,
                          driverTechnicianMessageThreadIdFirebase:
                              _model.technicianChat?.reference.id,
                          driverSupportMessageThreadIdFirebase:
                              _model.supportchat?.reference.id,
                        );

                        await currentUserReference!
                            .update(createUsersRecordData(
                          companyId:
                              UptimeFleetAppGroup.createDriverCall.companyId(
                            (_model.driver?.jsonBody ?? ''),
                          ),
                          companyName:
                              UptimeFleetAppGroup.createDriverCall.companyName(
                            (_model.driver?.jsonBody ?? ''),
                          ),
                          driverId: UptimeFleetAppGroup.createDriverCall.id(
                            (_model.driver?.jsonBody ?? ''),
                          ),
                          fullName: widget.fullName,
                          driverFleetManagerMessageThreadId: UptimeFleetAppGroup
                              .createDriverCall
                              .driverFleetManagerMessageThreadId(
                            (_model.driver?.jsonBody ?? ''),
                          ),
                          driverSupportMessageThreadId: UptimeFleetAppGroup
                              .createDriverCall
                              .driverSupportMessageThreadId(
                            (_model.driver?.jsonBody ?? ''),
                          ),
                          profilePicture: '',
                          phoneNumber: widget.phoneNumber,
                          driverSupportMessageThreadIdFirebase:
                              _model.supportchat?.reference,
                          driverFleetManagerMessageThreadIdFirebaseId:
                              _model.technicianChat?.reference,
                        ));

                        context.goNamedAuth('dashboardDriver', context.mounted);
                      } else if (widget.signUpType == 'technician') {
                        var chatsRecordReference3 =
                            ChatsRecord.collection.doc();
                        await chatsRecordReference3.set({
                          ...createChatsRecordData(
                            userA: currentUserReference,
                          ),
                          ...mapToFirestore(
                            {
                              'users': [currentUserReference],
                            },
                          ),
                        });
                        _model.supportchat2 = ChatsRecord.getDocumentFromData({
                          ...createChatsRecordData(
                            userA: currentUserReference,
                          ),
                          ...mapToFirestore(
                            {
                              'users': [currentUserReference],
                            },
                          ),
                        }, chatsRecordReference3);

                        var chatsRecordReference4 =
                            ChatsRecord.collection.doc();
                        await chatsRecordReference4.set({
                          ...createChatsRecordData(
                            userA: currentUserReference,
                          ),
                          ...mapToFirestore(
                            {
                              'users': [currentUserReference],
                            },
                          ),
                        });
                        _model.technicianChat2 =
                            ChatsRecord.getDocumentFromData({
                          ...createChatsRecordData(
                            userA: currentUserReference,
                          ),
                          ...mapToFirestore(
                            {
                              'users': [currentUserReference],
                            },
                          ),
                        }, chatsRecordReference4);
                        _model.technician =
                            await UptimeFleetAppGroup.createTechnicianCall.call(
                          serviceProviderId: widget.serviceProviderId,
                          fullName: widget.fullName,
                          phoneNumber: widget.phoneNumber,
                          token: _model.token,
                          driverTechnicianMessageThreadIdFirebase:
                              _model.technicianChat2?.reference.id,
                          driverSupportMessageThreadIdFirebase:
                              _model.supportchat2?.reference.id,
                        );

                        await currentUserReference!
                            .update(createUsersRecordData(
                          companyId: UptimeFleetAppGroup.createTechnicianCall
                              .companyId(
                            (_model.technician?.jsonBody ?? ''),
                          ),
                          companyName: UptimeFleetAppGroup.createTechnicianCall
                              .companyName(
                            (_model.technician?.jsonBody ?? ''),
                          ),
                          technicianId: UptimeFleetAppGroup.createTechnicianCall
                              .technicianId(
                            (_model.technician?.jsonBody ?? ''),
                          ),
                          fullName: widget.fullName,
                          phoneNumber: widget.phoneNumber,
                          onDuty: false,
                          driverFleetManagerMessageThreadId: UptimeFleetAppGroup
                              .createTechnicianCall
                              .technicianServiceProviderMessageThreadId(
                            (_model.technician?.jsonBody ?? ''),
                          ),
                          driverSupportMessageThreadId: UptimeFleetAppGroup
                              .createTechnicianCall
                              .technicianSupportMessageThreadId(
                            (_model.technician?.jsonBody ?? ''),
                          ),
                          driverSupportMessageThreadIdFirebase:
                              _model.supportchat2?.reference,
                          driverFleetManagerMessageThreadIdFirebaseId:
                              _model.technicianChat2?.reference,
                        ));

                        context.goNamedAuth(
                            'dashboardTechnician', context.mounted);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Something went wrong. Please try again later.',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      }
                    } else {
                      if (widget.signUpType == 'fleet') {
                        await UptimeFleetAppGroup.updateDriverTokenCall.call(
                          driverId:
                              valueOrDefault(currentUserDocument?.driverId, ''),
                          token: _model.token,
                        );

                        context.goNamedAuth('dashboardDriver', context.mounted);
                      } else if (widget.signUpType == 'technician') {
                        await UptimeFleetAppGroup.updateTechnicianCall.call(
                          technicianId: valueOrDefault(
                              currentUserDocument?.technicianId, ''),
                          token: _model.token,
                        );

                        context.goNamedAuth(
                            'dashboardTechnician', context.mounted);
                      }
                    }

                    setState(() {});
                  },
                  text: 'Confirm',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 50.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
