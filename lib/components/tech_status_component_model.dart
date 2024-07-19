import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'tech_status_component_widget.dart' show TechStatusComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TechStatusComponentModel
    extends FlutterFlowModel<TechStatusComponentWidget> {
  ///  Local state fields for this component.

  bool onDuty = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (Update tech status)] action in Container widget.
  ApiCallResponse? apiResult5nw;
  // Stores action output result for [Backend Call - API (Update technician position)] action in Container widget.
  ApiCallResponse? apiResultksz;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
