import '/flutter_flow/flutter_flow_util.dart';
import 'connection_problem_widget.dart' show ConnectionProblemWidget;
import 'package:flutter/material.dart';

class ConnectionProblemModel extends FlutterFlowModel<ConnectionProblemWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
