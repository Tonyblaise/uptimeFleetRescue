import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for yourOldPassword widget.
  FocusNode? yourOldPasswordFocusNode;
  TextEditingController? yourOldPasswordTextController;
  late bool yourOldPasswordVisibility;
  String? Function(BuildContext, String?)?
      yourOldPasswordTextControllerValidator;
  // State field(s) for yourNewPassword widget.
  FocusNode? yourNewPasswordFocusNode;
  TextEditingController? yourNewPasswordTextController;
  late bool yourNewPasswordVisibility;
  String? Function(BuildContext, String?)?
      yourNewPasswordTextControllerValidator;
  // State field(s) for confirmNewPassword widget.
  FocusNode? confirmNewPasswordFocusNode;
  TextEditingController? confirmNewPasswordTextController;
  late bool confirmNewPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmNewPasswordTextControllerValidator;
  // Stores action output result for [Backend Call - API (Change password)] action in Container widget.
  ApiCallResponse? apiResultjti;

  @override
  void initState(BuildContext context) {
    yourOldPasswordVisibility = false;
    yourNewPasswordVisibility = false;
    confirmNewPasswordVisibility = false;
  }

  @override
  void dispose() {
    yourOldPasswordFocusNode?.dispose();
    yourOldPasswordTextController?.dispose();

    yourNewPasswordFocusNode?.dispose();
    yourNewPasswordTextController?.dispose();

    confirmNewPasswordFocusNode?.dispose();
    confirmNewPasswordTextController?.dispose();
  }
}
