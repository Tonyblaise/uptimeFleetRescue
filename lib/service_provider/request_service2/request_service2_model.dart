import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'request_service2_widget.dart' show RequestService2Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RequestService2Model extends FlutterFlowModel<RequestService2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameTextController;
  String? Function(BuildContext, String?)? fullnameTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  final textFieldMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - checkLocationPermissions] action in Startrequest widget.
  bool? location3;
  // Stores action output result for [Backend Call - API (Check user)] action in Startrequest widget.
  ApiCallResponse? check;
  // Stores action output result for [Backend Call - Create Document] action in Startrequest widget.
  ChatsRecord? supportchat;
  // Stores action output result for [Backend Call - Create Document] action in Startrequest widget.
  ChatsRecord? technicianChat;
  // Stores action output result for [Backend Call - API (Create driver)] action in Startrequest widget.
  ApiCallResponse? driver;
  // Stores action output result for [Backend Call - API (Update driverId)] action in Startrequest widget.
  ApiCallResponse? test;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fullnameFocusNode?.dispose();
    fullnameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
