import '/flutter_flow/flutter_flow_util.dart';
import 'navigate_widget.dart' show NavigateWidget;
import 'package:flutter/material.dart';

class NavigateModel extends FlutterFlowModel<NavigateWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
