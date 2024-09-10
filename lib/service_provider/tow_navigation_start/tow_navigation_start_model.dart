import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'tow_navigation_start_widget.dart' show TowNavigationStartWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TowNavigationStartModel
    extends FlutterFlowModel<TowNavigationStartWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Update request)] action in Button widget.
  ApiCallResponse? enrouteToTowDestination;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
