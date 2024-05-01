import '/flutter_flow/flutter_flow_util.dart';
import 'check_your_email_widget.dart' show CheckYourEmailWidget;
import 'package:flutter/material.dart';

class CheckYourEmailModel extends FlutterFlowModel<CheckYourEmailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
