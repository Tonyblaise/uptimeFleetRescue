import '/components/page_title_widget.dart';
import '/components/tech_status_component_widget.dart';
import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/bottom_bar/bottom_bar_widget.dart';
import 'package:flutter/material.dart';
import 'tech_status_model.dart';
export 'tech_status_model.dart';

class TechStatusWidget extends StatefulWidget {
  const TechStatusWidget({super.key});

  @override
  State<TechStatusWidget> createState() => _TechStatusWidgetState();
}

class _TechStatusWidgetState extends State<TechStatusWidget> {
  late TechStatusModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TechStatusModel());

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
          iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
          automaticallyImplyLeading: false,
          title: Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Tech Status',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            decoration: const BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.userDetailsModel,
                              updateCallback: () => setState(() {}),
                              child: const UserDetailsWidget(),
                            ),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.pageTitleModel,
                        updateCallback: () => setState(() {}),
                        child: const PageTitleWidget(
                          title1: 'Set your',
                          title2: 'Status',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.techStatusComponentModel,
                    updateCallback: () => setState(() {}),
                    child: const TechStatusComponentWidget(),
                  ),
                ),
                wrapWithModel(
                  model: _model.bottomBarModel,
                  updateCallback: () => setState(() {}),
                  child: const BottomBarWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
