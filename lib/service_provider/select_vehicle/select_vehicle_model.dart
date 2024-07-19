import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'select_vehicle_widget.dart' show SelectVehicleWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectVehicleModel extends FlutterFlowModel<SelectVehicleWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for empty_state_Simple component.
  late EmptyStateSimpleModel emptyStateSimpleModel;
  // Stores action output result for [Backend Call - API (Update technician)] action in Button widget.
  ApiCallResponse? apiResultpgxCopy;

  @override
  void initState(BuildContext context) {
    emptyStateSimpleModel = createModel(context, () => EmptyStateSimpleModel());
  }

  @override
  void dispose() {
    emptyStateSimpleModel.dispose();
  }
}
