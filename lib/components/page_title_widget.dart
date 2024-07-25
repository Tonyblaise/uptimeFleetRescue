import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'page_title_model.dart';
export 'page_title_model.dart';

class PageTitleWidget extends StatefulWidget {
  const PageTitleWidget({
    super.key,
    String? title1,
    String? title2,
  })  : title1 = title1 ?? 'What service do you',
        title2 = title2 ?? 'need';

  final String title1;
  final String title2;

  @override
  State<PageTitleWidget> createState() => _PageTitleWidgetState();
}

class _PageTitleWidgetState extends State<PageTitleWidget> {
  late PageTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageTitleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title1,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Yantramanav',
                    color: Colors.black,
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            Text(
              widget.title2,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Yantramanav',
                    color: Colors.black,
                    fontSize: 34.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
