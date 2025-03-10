import '/components/page_title_widget.dart';
import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/bottom_bar/bottom_bar_widget.dart';
import 'package:flutter/material.dart';
import 'tech_status_model.dart';
export 'tech_status_model.dart';

class TechStatusWidget extends StatefulWidget {
  const TechStatusWidget({super.key});

  static String routeName = 'tech_status';
  static String routePath = 'techStatus';

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
        title: 'tech_status',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Color(0xFF1E293B)),
              automaticallyImplyLeading: false,
              title: Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Tech Status',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Yantramanav',
                            color: Color(0xFF1E293B),
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                decoration: BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.userDetailsModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: UserDetailsWidget(),
                                ),
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.pageTitleModel,
                            updateCallback: () => safeSetState(() {}),
                            child: PageTitleWidget(
                              title1: 'Set your',
                              title2: 'Status',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                    ),
                    wrapWithModel(
                      model: _model.bottomBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BottomBarWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
