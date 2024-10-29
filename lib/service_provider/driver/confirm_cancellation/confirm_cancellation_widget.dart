import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'confirm_cancellation_model.dart';
export 'confirm_cancellation_model.dart';

class ConfirmCancellationWidget extends StatefulWidget {
  const ConfirmCancellationWidget({
    super.key,
    required this.request,
    bool? driver,
  }) : driver = driver ?? true;

  final String? request;
  final bool driver;

  @override
  State<ConfirmCancellationWidget> createState() =>
      _ConfirmCancellationWidgetState();
}

class _ConfirmCancellationWidgetState extends State<ConfirmCancellationWidget> {
  late ConfirmCancellationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmCancellationModel());

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
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 20.0),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 500.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: SvgPicture.asset(
                    'assets/images/group_alert.svg',
                    width: 56.0,
                    height: 56.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'This request has been \ncancelled by support. Please reach out to support for more details',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Yantramanav',
                                    color: const Color(0xFF64748B),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 8.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'activeRequestBubble': FieldValue.delete(),
                                    'activeRequest': FieldValue.delete(),
                                  },
                                ),
                              });
                              if (widget.driver == true) {
                                await requestPermission(locationPermission);

                                context.goNamed('landing_page');
                              } else {
                                context.goNamed('dashboardTechnician');
                              }
                            },
                            text: 'Confirm',
                            options: FFButtonOptions(
                              width: 130.0,
                              height: 56.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Yantramanav',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
