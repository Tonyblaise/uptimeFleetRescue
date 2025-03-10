import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bottom_bar_model.dart';
export 'bottom_bar_model.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  late BottomBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomBarModel());

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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: 60.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Color(0x410F172A),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(DashboardTechnicianWidget.routeName);
                    },
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/image_selectvehicle_icon.svg',
                              width: 20.0,
                              height: 16.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentUserDocument?.activeRequest != null
                                  ? 'Service Updates'
                                  : 'Select vehicle',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Yantramanav',
                                    color: Color(0xFF64748B),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(height: 6.0)),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        TechnicianChatWidget.routeName,
                        queryParameters: {
                          'state': serializeParam(
                            0,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/image_messages_icon.svg',
                              width: 20.0,
                              height: 16.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            'Messages',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Yantramanav',
                                  color: Color(0xFF64748B),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(height: 6.0)),
                      ),
                    ),
                  ),
                  
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('settingsSp');
                    },
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/image_settings_icon.svg',
                              width: 20.0,
                              height: 16.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            'Settings',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Yantramanav',
                                  color: Color(0xFF64748B),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(height: 6.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
