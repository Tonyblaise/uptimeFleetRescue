import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/service_provider/arrival_confirmation/arrival_confirmation_widget.dart';
import '/service_provider/arrival_confirmation_copy/arrival_confirmation_copy_widget.dart';
import '/service_provider/driver/cancel_request/cancel_request_widget.dart';
import '/service_provider/tow_navigation_start/tow_navigation_start_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'service_updates_component_s_p_widget.dart'
    show ServiceUpdatesComponentSPWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ServiceUpdatesComponentSPModel
    extends FlutterFlowModel<ServiceUpdatesComponentSPWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Update technician position  using current postion)] action in serviceUpdatesComponentSP widget.
  ApiCallResponse? apiResultayo6;
  InstantTimer? instantTimer2;
  // Stores action output result for [Backend Call - API (Update technician position  using current postion)] action in serviceUpdatesComponentSP widget.
  ApiCallResponse? apiResultayoo;
  // Stores action output result for [Backend Call - API (Update request)] action in MapboxNavigationWidget widget.
  ApiCallResponse? apiResultoanCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    instantTimer2?.cancel();
  }
}
