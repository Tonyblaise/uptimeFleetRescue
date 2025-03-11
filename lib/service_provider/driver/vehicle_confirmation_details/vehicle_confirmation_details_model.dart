import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'vehicle_confirmation_details_widget.dart'
    show VehicleConfirmationDetailsWidget;
import 'package:flutter/material.dart';

class VehicleConfirmationDetailsModel
    extends FlutterFlowModel<VehicleConfirmationDetailsWidget> {
  ///  Local state fields for this page.

  String? vehicleId;

  String? color;

  String? state;

  String? image =
      'https://dd8c54a01d09ed2b89dfbd9e5dfe0b12.cdn.bubble.io/f1707747018407x476662704940518100/photo.png';

  bool apiCallMade = false;

  String? details;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'At least 2 characters required';
    }

    return null;
  }

  // State field(s) for DropDownState widget.
  String? dropDownStateValue;
  FormFieldController<String>? dropDownStateValueController;
  // Stores action output result for [Backend Call - API (Get vehicles)] action in Button widget.
  ApiCallResponse? vehicle;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
