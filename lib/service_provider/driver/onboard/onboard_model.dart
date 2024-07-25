import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'onboard_widget.dart' show OnboardWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class OnboardModel extends FlutterFlowModel<OnboardWidget> {
  ///  Local state fields for this page.

  String? signUpType;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  // Stores action output result for [Backend Call - API (Check user)] action in Button widget.
  ApiCallResponse? check;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    fullnameFocusNode?.dispose();
    fullnameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
