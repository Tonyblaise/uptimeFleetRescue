import '/components/settings_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

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
        title: 'settings',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Text(
                    'Settings',
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
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 500.0,
                    ),
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        wrapWithModel(
                          model: _model.settingsComponentModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const SettingsComponentWidget(),
                        ),
                      ].divide(const SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
