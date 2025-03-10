import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'verify_widget.dart' show VerifyWidget;
import 'package:flutter/material.dart';

class VerifyModel extends FlutterFlowModel<VerifyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - getFcmToken] action in Button widget.
  String? token;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? supportchat;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? technicianChat;
  // Stores action output result for [Backend Call - API (Create driver)] action in Button widget.
  ApiCallResponse? driver;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? supportchat2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? technicianChat2;
  // Stores action output result for [Backend Call - API (Create technician)] action in Button widget.
  ApiCallResponse? technician;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
