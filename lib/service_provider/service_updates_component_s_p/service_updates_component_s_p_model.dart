import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'service_updates_component_s_p_widget.dart'
    show ServiceUpdatesComponentSPWidget;
import 'package:flutter/material.dart';

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
