import '/backend/api_requests/api_calls.dart';
import '/chat/service_summary_widget/service_summary_widget_widget.dart';
import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/service_provider/bottom_bar/bottom_bar_widget.dart';
import 'dashboard_technician_widget.dart' show DashboardTechnicianWidget;
import 'package:flutter/material.dart';

class DashboardTechnicianModel
    extends FlutterFlowModel<DashboardTechnicianWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Update technician position  using current postion)] action in dashboardTechnician widget.
  ApiCallResponse? apiResultayo6;
  InstantTimer? instantTimer2;
  // Stores action output result for [Backend Call - API (Update technician position  using current postion)] action in dashboardTechnician widget.
  ApiCallResponse? apiResultayoo;
  // Model for userDetails component.
  late UserDetailsModel userDetailsModel;
  // Model for empty_state_Simple component.
  late EmptyStateSimpleModel emptyStateSimpleModel;
  // Model for serviceSummaryWidget component.
  late ServiceSummaryWidgetModel serviceSummaryWidgetModel;
  // Model for bottom_bar component.
  late BottomBarModel bottomBarModel;

  @override
  void initState(BuildContext context) {
    userDetailsModel = createModel(context, () => UserDetailsModel());
    emptyStateSimpleModel = createModel(context, () => EmptyStateSimpleModel());
    serviceSummaryWidgetModel =
        createModel(context, () => ServiceSummaryWidgetModel());
    bottomBarModel = createModel(context, () => BottomBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    instantTimer2?.cancel();
    userDetailsModel.dispose();
    emptyStateSimpleModel.dispose();
    serviceSummaryWidgetModel.dispose();
    bottomBarModel.dispose();
  }
}
