import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_component_widget.dart' show SettingsComponentWidget;
import 'package:flutter/material.dart';

class SettingsComponentModel extends FlutterFlowModel<SettingsComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for userDetails component.
  late UserDetailsModel userDetailsModel;

  @override
  void initState(BuildContext context) {
    userDetailsModel = createModel(context, () => UserDetailsModel());
  }

  @override
  void dispose() {
    userDetailsModel.dispose();
  }
}
