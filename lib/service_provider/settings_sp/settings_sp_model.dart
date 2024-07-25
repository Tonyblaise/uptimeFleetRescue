import '/components/settings_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/bottom_bar/bottom_bar_widget.dart';
import 'settings_sp_widget.dart' show SettingsSpWidget;
import 'package:flutter/material.dart';

class SettingsSpModel extends FlutterFlowModel<SettingsSpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for settingsComponent component.
  late SettingsComponentModel settingsComponentModel;
  // Model for bottom_bar component.
  late BottomBarModel bottomBarModel;

  @override
  void initState(BuildContext context) {
    settingsComponentModel =
        createModel(context, () => SettingsComponentModel());
    bottomBarModel = createModel(context, () => BottomBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    settingsComponentModel.dispose();
    bottomBarModel.dispose();
  }
}
