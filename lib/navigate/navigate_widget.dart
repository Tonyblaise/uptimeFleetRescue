import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'navigate_model.dart';
export 'navigate_model.dart';

class NavigateWidget extends StatefulWidget {
  const NavigateWidget({
    super.key,
    required this.originLat,
    required this.originLng,
    required this.destinationLat,
    required this.destinationLng,
  });

  final double? originLat;
  final double? originLng;
  final double? destinationLat;
  final double? destinationLng;

  @override
  State<NavigateWidget> createState() => _NavigateWidgetState();
}

class _NavigateWidgetState extends State<NavigateWidget> {
  late NavigateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigateModel());

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
            child: Text(
              'Start Navigation',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Yantramanav',
                    color: const Color(0xFF1E293B),
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
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
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
        ),
      ),
    );
  }
}
