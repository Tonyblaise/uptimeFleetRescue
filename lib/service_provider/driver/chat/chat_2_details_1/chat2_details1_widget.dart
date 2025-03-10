import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/driver/chat/chat_thread_component_1/chat_thread_component1_widget.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'chat2_details1_model.dart';
export 'chat2_details1_model.dart';

class Chat2Details1Widget extends StatefulWidget {
  const Chat2Details1Widget({
    super.key,
    required this.chatRef,
    bool? driver,
  }) : this.driver = driver ?? true;

  final ChatsRecord? chatRef;
  final bool driver;

  static String routeName = 'chat_2_Details_1';
  static String routePath = 'chat2Details1';

  @override
  State<Chat2Details1Widget> createState() => _Chat2Details1WidgetState();
}

class _Chat2Details1WidgetState extends State<Chat2Details1Widget> {
  late Chat2Details1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat2Details1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await widget.chatRef!.reference.update({
            ...mapToFirestore(
              {
                'last_message_seen_by':
                    FieldValue.arrayUnion([currentUserReference]),
              },
            ),
          });
        }(),
      );
    });

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
        title: 'chat_2_Details_1',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  if (widget.driver == true) {
                    context.pushNamed(LandingPageWidget.routeName);
                  } else {
                    context.pushNamed(DashboardTechnicianWidget.routeName);
                  }
                },
              ),
              title: Text(
                valueOrDefault<String>(
                  widget.driver == true
                      ? 'Chat with Technician'
                      : 'Chat with Driver',
                  'Chat with driver',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Yantramanav',
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: wrapWithModel(
                model: _model.chatThreadComponent1Model,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: ChatThreadComponent1Widget(
                  chatRef: widget.chatRef,
                  state: 1,
                ),
              ),
            ),
          ),
        ));
  }
}
