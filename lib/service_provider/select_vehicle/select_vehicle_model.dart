import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/chat/empty_state_simple/empty_state_simple_widget.dart';
import 'select_vehicle_widget.dart' show SelectVehicleWidget;
import 'package:flutter/material.dart';

class SelectVehicleModel extends FlutterFlowModel<SelectVehicleWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for empty_state_Simple component.
  late EmptyStateSimpleModel emptyStateSimpleModel;
  // Stores action output result for [Backend Call - API (Get technician vehicles)] action in Container widget.
  ApiCallResponse? vehicles;
  // Stores action output result for [Backend Call - API (Update technician)] action in Container widget.
  ApiCallResponse? apiResultpgx;

  @override
  void initState(BuildContext context) {
    emptyStateSimpleModel = createModel(context, () => EmptyStateSimpleModel());
  }

  @override
  void dispose() {
    emptyStateSimpleModel.dispose();
  }
}
