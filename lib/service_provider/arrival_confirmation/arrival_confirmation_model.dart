import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'arrival_confirmation_widget.dart' show ArrivalConfirmationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArrivalConfirmationModel
    extends FlutterFlowModel<ArrivalConfirmationWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Update request)] action in Container widget.
  ApiCallResponse? apiResultoan;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
