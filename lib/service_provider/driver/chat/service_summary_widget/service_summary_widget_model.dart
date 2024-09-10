import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/service_provider/driver/cancel_request/cancel_request_widget.dart';
import '/service_provider/service_updates_component_s_p/service_updates_component_s_p_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'service_summary_widget_widget.dart' show ServiceSummaryWidgetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceSummaryWidgetModel
    extends FlutterFlowModel<ServiceSummaryWidgetWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Update request)] action in MapboxNavigationWidget widget.
  ApiCallResponse? apiResultoanCopy;
  // Model for serviceUpdatesComponentSP component.
  late ServiceUpdatesComponentSPModel serviceUpdatesComponentSPModel;

  @override
  void initState(BuildContext context) {
    serviceUpdatesComponentSPModel =
        createModel(context, () => ServiceUpdatesComponentSPModel());
  }

  @override
  void dispose() {
    serviceUpdatesComponentSPModel.dispose();
  }
}
