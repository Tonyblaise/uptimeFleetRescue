import '/components/settings_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/service_provider/bottom_bar/bottom_bar_widget.dart';
import 'settings_sp_widget.dart' show SettingsSpWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsSpModel extends FlutterFlowModel<SettingsSpWidget> {
  ///  State fields for stateful widgets in this page.

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
    settingsComponentModel.dispose();
    bottomBarModel.dispose();
  }
}
