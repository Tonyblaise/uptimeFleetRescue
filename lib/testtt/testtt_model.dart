import '/flutter_flow/flutter_flow_util.dart';
import 'testtt_widget.dart' show TestttWidget;
import 'package:flutter/material.dart';

class TestttModel extends FlutterFlowModel<TestttWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
