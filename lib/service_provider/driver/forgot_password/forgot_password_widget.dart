import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'forgot_password_model.dart';
export 'forgot_password_model.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  static String routeName = 'forgotPassword';
  static String routePath = 'forgotPassword';

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  late ForgotPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgotPasswordModel());

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
        title: 'forgotPassword',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
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
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Forgot password?',
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Yantramanav',
                                  color: Color(0xFF0F172A),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'No worries, we\'ll send a recovery link to your email.',
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Yantramanav',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 114.0,
                      decoration: BoxDecoration(),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Yantramanav',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Your email',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Yantramanav',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFCBD5E1),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(18.0),
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
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.apiResulth72 = await UptimeFleetAppGroup
                              .resetUserPasswordCall
                              .call(
                            email: _model.textController.text,
                          );

                          if ((_model.apiResulth72?.succeeded ?? true)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please check your email and follow instrucctions to reset your password',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 16.0,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Something went wrong. Please try again later.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 16.0,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFFF50833),
                              ),
                            );
                          }

                          safeSetState(() {});
                        },
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
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Send a recovery link',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Yantramanav',
                                    letterSpacing: 0.0,
                                  ),
                            ),
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
                        context.pushNamed(LoginWidget.routeName);
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  'Back to',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Yantramanav',
                                        color: Color(0xFF0F172A),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  'Log in',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Yantramanav',
                                        color: Color(0xFF0CCA4A),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 32.0)),
                ),
              ),
            ),
          ),
        ));
  }
}
