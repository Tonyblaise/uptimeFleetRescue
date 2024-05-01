import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat/chat_thread_component_1/chat_thread_component1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'technician_chat_model.dart';
export 'technician_chat_model.dart';

class TechnicianChatWidget extends StatefulWidget {
  const TechnicianChatWidget({
    super.key,
    int? state,
  }) : state = state ?? 2;

  final int state;

  @override
  State<TechnicianChatWidget> createState() => _TechnicianChatWidgetState();
}

class _TechnicianChatWidgetState extends State<TechnicianChatWidget> {
  late TechnicianChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TechnicianChatModel());

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: false,
          title: Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('dashboardTechnician');
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Text(
                    'Messages',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Yantramanav',
                          color: const Color(0xFF1E293B),
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ].divide(const SizedBox(width: 15.0)),
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
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE2E8F0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.pageState = 2;
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      _model.pageState == 2
                                          ? const Color(0xFFE2E8F0)
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Manager',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Yantramanav',
                                          color: valueOrDefault<Color>(
                                            _model.pageState == 2
                                                ? Colors.black
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          fontSize: _model.pageState == 2
                                              ? 16.0
                                              : 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.pageState = 3;
                                  });
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      _model.pageState == 3
                                          ? const Color(0xFFE2E8F0)
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 1.0,
                                        color: Color(0x28000000),
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                        spreadRadius: 0.0,
                                      )
                                    ],
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Support',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Yantramanav',
                                          color: valueOrDefault<Color>(
                                            _model.pageState == 3
                                                ? Colors.black
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          fontSize: _model.pageState == 3
                                              ? 16.0
                                              : 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).secondary,
                              FlutterFlowTheme.of(context).tertiary
                            ],
                            stops: const [0.0, 1.0],
                            begin: const AlignmentDirectional(0.0, -1.0),
                            end: const AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(36.0),
                            bottomRight: Radius.circular(36.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'You can chat here with',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Yantramanav',
                                        color: Colors.black,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                                const TextSpan(
                                  text: '\nyour tech\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36.0,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Yantramanav',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: AuthUserStreamWidget(
                    builder: (context) => StreamBuilder<ChatsRecord>(
                      stream: ChatsRecord.getDocument(currentUserDocument!
                          .driverFleetManagerMessageThreadIdFirebaseId!),
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
                        final containermanagerChatsRecord = snapshot.data!;
                        return Container(
                          decoration: const BoxDecoration(),
                          child: StreamBuilder<ChatsRecord>(
                            stream: ChatsRecord.getDocument(currentUserDocument!
                                .driverSupportMessageThreadIdFirebase!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).tertiary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final containersupportChatsRecord =
                                  snapshot.data!;
                              return Container(
                                height: 200.0,
                                decoration: const BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.chatThreadComponent1Model,
                                  updateCallback: () => setState(() {}),
                                  child: ChatThreadComponent1Widget(
                                    chatRef: _model.pageState == 2
                                        ? containermanagerChatsRecord
                                        : containersupportChatsRecord,
                                    state: _model.pageState!,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
