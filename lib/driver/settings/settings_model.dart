import '/components/settings_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for settingsComponent component.
  late SettingsComponentModel settingsComponentModel;

  @override
  void initState(BuildContext context) {
    settingsComponentModel =
        createModel(context, () => SettingsComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    settingsComponentModel.dispose();
  }
}
