import '/components/settings_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for settingsComponent component.
  late SettingsComponentModel settingsComponentModel;

  @override
  void initState(BuildContext context) {
    settingsComponentModel =
        createModel(context, () => SettingsComponentModel());
  }

  @override
  void dispose() {
    settingsComponentModel.dispose();
  }
}
