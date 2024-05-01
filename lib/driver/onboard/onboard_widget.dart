import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'onboard_model.dart';
export 'onboard_model.dart';

class OnboardWidget extends StatefulWidget {
  const OnboardWidget({
    super.key,
    this.fleetManagerId,
    this.serviceProviderId,
  });

  final String? fleetManagerId;
  final String? serviceProviderId;

  @override
  State<OnboardWidget> createState() => _OnboardWidgetState();
}

class _OnboardWidgetState extends State<OnboardWidget> {
  late OnboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.fleetManagerId != null && widget.fleetManagerId != '') {
        setState(() {
          _model.signUpType = 'fleet';
        });
      } else if (widget.serviceProviderId != null &&
          widget.serviceProviderId != '') {
        setState(() {
          _model.signUpType = 'technician';
        });
      } else if ((widget.fleetManagerId == null ||
              widget.fleetManagerId == '') &&
          (widget.serviceProviderId == null ||
              widget.serviceProviderId == '')) {
        context.pushNamed('login');
      }
    });

    _model.fullnameTextController ??= TextEditingController();
    _model.fullnameFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
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
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/image_logo.png',
                    width: 244.0,
                    height: 64.0,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 84.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Yantramanav',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
                          child: TextFormField(
                            controller: _model.fullnameTextController,
                            focusNode: _model.fullnameFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'What is your name?',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Yantramanav',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFCBD5E1),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Yantramanav',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            validator: _model.fullnameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 84.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What is your phone number',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Yantramanav',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.dropDownValue ??= '+1',
                                  ),
                                  options: const ['+1', '+254'],
                                  onChanged: (val) => setState(
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
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 4.0, 0.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 4.0),
                                    child: TextFormField(
                                      controller: _model.textController2,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Phone Number',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Yantramanav',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
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
                                      validator: _model.textController2Validator
                                          .asValidator(context),
                                      inputFormatters: [_model.textFieldMask],
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 5.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    _model.check = await UptimeFleetAppGroup.checkUserCall.call(
                      phoneNumber:
                          '${_model.dropDownValue}${_model.textController2.text}',
                    );
                    if ((_model.check?.succeeded ?? true)) {
                      if (UptimeFleetAppGroup.checkUserCall.signUpType(
                            (_model.check?.jsonBody ?? ''),
                          ) ==
                          'none') {
                        final phoneNumberVal =
                            '${_model.dropDownValue}${_model.textController2.text}';
                        if (phoneNumberVal.isEmpty ||
                            !phoneNumberVal.startsWith('+')) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Phone Number is required and has to start with +.'),
                            ),
                          );
                          return;
                        }
                        await authManager.beginPhoneAuth(
                          context: context,
                          phoneNumber: phoneNumberVal,
                          onCodeSent: (context) async {
                            context.goNamedAuth(
                              'verify',
                              context.mounted,
                              queryParameters: {
                                'phoneNumber': serializeParam(
                                  '${_model.dropDownValue}${_model.textController2.text}',
                                  ParamType.String,
                                ),
                                'fleetManagerId': serializeParam(
                                  widget.fleetManagerId,
                                  ParamType.String,
                                ),
                                'signUpType': serializeParam(
                                  _model.signUpType,
                                  ParamType.String,
                                ),
                                'serviceProviderId': serializeParam(
                                  widget.serviceProviderId,
                                  ParamType.String,
                                ),
                                'fullName': serializeParam(
                                  _model.fullnameTextController.text,
                                  ParamType.String,
                                ),
                                'signUp': serializeParam(
                                  true,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                              ignoreRedirect: true,
                            );
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'This account already exists. Please use a different phone number or log in.',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Something went wrong. Please try again later.',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }

                    setState(() {});
                  },
                  text: 'Create Account',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 56.0,
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
              ].divide(const SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
