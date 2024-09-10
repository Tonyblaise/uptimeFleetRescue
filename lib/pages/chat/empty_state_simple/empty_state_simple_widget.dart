import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/service_provider/select_vehicle/select_vehicle_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'empty_state_simple_model.dart';
export 'empty_state_simple_model.dart';

class EmptyStateSimpleWidget extends StatefulWidget {
  const EmptyStateSimpleWidget({
    super.key,
    this.icon,
    String? title,
    String? body,
    this.action,
    bool? buttonVisible,
  })  : title = title ?? 'No Comments',
        body = body ?? 'There are no comments associated with this post.',
        buttonVisible = buttonVisible ?? false;

  final Widget? icon;
  final String title;
  final String body;
  final Future Function()? action;
  final bool buttonVisible;

  @override
  State<EmptyStateSimpleWidget> createState() => _EmptyStateSimpleWidgetState();
}

class _EmptyStateSimpleWidgetState extends State<EmptyStateSimpleWidget> {
  late EmptyStateSimpleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStateSimpleModel());

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
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.icon!,
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Yantramanav',
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          if (!widget.buttonVisible)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await actions.runWidgetAction(
                    () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: const SelectVehicleWidget(),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                  );
                },
                child: Text(
                  widget.body,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Yantramanav',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          if (widget.buttonVisible)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await actions.runWidgetAction(
                    () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: const SelectVehicleWidget(),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                  );
                },
                text: 'Update Vehicle',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).tertiary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
            ),
        ].divide(const SizedBox(height: 15.0)),
      ),
    );
  }
}
