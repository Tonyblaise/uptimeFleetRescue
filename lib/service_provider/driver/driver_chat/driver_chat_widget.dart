import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/driver/chat/chat_thread_component_1/chat_thread_component1_widget.dart';
import 'package:flutter/material.dart';
import 'driver_chat_model.dart';
export 'driver_chat_model.dart';

class DriverChatWidget extends StatefulWidget {
  const DriverChatWidget({
    super.key,
    int? state,
  }) : state = state ?? 2;

  final int state;

  @override
  State<DriverChatWidget> createState() => _DriverChatWidgetState();
}

class _DriverChatWidgetState extends State<DriverChatWidget> {
  late DriverChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DriverChatModel());

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
        title: 'driverChat',
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
              ),
              actions: const [],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 500.0,
                  ),
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
                                        _model.pageState = 2;
                                        safeSetState(() {});
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
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Manager',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Yantramanav',
                                                color: valueOrDefault<Color>(
                                                  _model.pageState == 2
                                                      ? Colors.black
                                                      : FlutterFlowTheme.of(
                                                              context)
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
                                        _model.pageState = 3;
                                        safeSetState(() {});
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
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Support',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Yantramanav',
                                                color: valueOrDefault<Color>(
                                                  _model.pageState == 3
                                                      ? Colors.black
                                                      : FlutterFlowTheme.of(
                                                              context)
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
                                        text: '\n',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: () {
                                          if (_model.pageState == 2) {
                                            return 'your manager';
                                          } else if (_model.pageState == 3) {
                                            return 'support';
                                          } else {
                                            return 'your tech';
                                          }
                                        }(),
                                        style: const TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Yantramanav',
                                          fontSize: 34.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
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

                              final containermanagerChatsRecord =
                                  snapshot.data!;

                              return Container(
                                decoration: const BoxDecoration(),
                                child: StreamBuilder<ChatsRecord>(
                                  stream: ChatsRecord.getDocument(
                                      currentUserDocument!
                                          .driverSupportMessageThreadIdFirebase!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40.0,
                                          height: 40.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
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
                                        updateCallback: () =>
                                            safeSetState(() {}),
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
          ),
        ));
  }
}
