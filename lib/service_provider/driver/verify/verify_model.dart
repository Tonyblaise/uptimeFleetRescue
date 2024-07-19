import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'verify_widget.dart' show VerifyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifyModel extends FlutterFlowModel<VerifyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
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
    unfocusNode.dispose();
    pinCodeController?.dispose();
  }
}
