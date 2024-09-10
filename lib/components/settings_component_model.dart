import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/driver/delete_account/delete_account_widget.dart';
import '/service_provider/driver/log_out_confirmation/log_out_confirmation_widget.dart';
import 'settings_component_widget.dart' show SettingsComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
