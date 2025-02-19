import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'request_location_model.dart';
export 'request_location_model.dart';

class RequestLocationWidget extends StatefulWidget {
  const RequestLocationWidget({
    super.key,
    required this.phone,
  });

  final String? phone;

  @override
  State<RequestLocationWidget> createState() => _RequestLocationWidgetState();
}

class _RequestLocationWidgetState extends State<RequestLocationWidget> {
  late RequestLocationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestLocationModel());

    authManager.handlePhoneAuthStateChanges(context);
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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 20.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
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
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 80.0,
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
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Allow location access',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Yantramanav',
                            color: Colors.black,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.location_on_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 56.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'In order to view your current location, this app needs permission to access your location',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Yantramanav',
                              color: Color(0xFF64748B),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Cancel',
                        options: FFButtonOptions(
                          height: 56.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Yantramanav',
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (isAndroid || isiOS) {
                            await actions.openLocationSettings();
                          } else {
                            await actions.openLocationSettings();
                          }

                          _model.check1 =
                              await UptimeFleetAppGroup.checkUserCall.call(
                            phoneNumber: widget.phone,
                          );

                          if ((_model.check1?.succeeded ?? true)) {
                            if (UptimeFleetAppGroup.checkUserCall.signUpType(
                                  (_model.check1?.jsonBody ?? ''),
                                ) !=
                                'none') {
                              final phoneNumberVal = widget.phone;
                              if (phoneNumberVal == null ||
                                  phoneNumberVal.isEmpty ||
                                  !phoneNumberVal.startsWith('+')) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
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
                                    VerifyWidget.routeName,
                                    context.mounted,
                                    queryParameters: {
                                      'phoneNumber': serializeParam(
                                        widget.phone,
                                        ParamType.String,
                                      ),
                                      'signUpType': serializeParam(
                                        UptimeFleetAppGroup.checkUserCall
                                            .signUpType(
                                          (_model.check1?.jsonBody ?? ''),
                                        ),
                                        ParamType.String,
                                      ),
                                      'signUp': serializeParam(
                                        false,
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
                                    'This account does not exist.',
                                    style: TextStyle(
                                      color: Colors.white,
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Something went wrong. Please try again later.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                          }

                          Navigator.pop(context);

                          safeSetState(() {});
                        },
                        text: 'Allow access',
                        options: FFButtonOptions(
                          height: 56.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).tertiary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Yantramanav',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 15.0)),
                ),
              ),
            ].divide(SizedBox(height: 32.0)),
          ),
        ),
      ),
    );
  }
}
