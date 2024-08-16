import '/backend/api_requests/api_calls.dart';
import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'service_confirmation_widget.dart' show ServiceConfirmationWidget;
import 'package:flutter/material.dart';

class ServiceConfirmationModel
    extends FlutterFlowModel<ServiceConfirmationWidget> {
  ///  Local state fields for this page.

  String? image;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for userDetails component.
  late UserDetailsModel userDetailsModel;
  // State field(s) for TextFiel_odometer widget.
  FocusNode? textFielOdometerFocusNode;
  TextEditingController? textFielOdometerTextController;
  String? Function(BuildContext, String?)?
      textFielOdometerTextControllerValidator;
  String? _textFielOdometerTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (Complete requests)] action in Button widget.
  ApiCallResponse? apiResultd4y;

  @override
  void initState(BuildContext context) {
    userDetailsModel = createModel(context, () => UserDetailsModel());
    textFielOdometerTextControllerValidator =
        _textFielOdometerTextControllerValidator;
  }

  @override
  void dispose() {
    userDetailsModel.dispose();
    textFielOdometerFocusNode?.dispose();
    textFielOdometerTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
