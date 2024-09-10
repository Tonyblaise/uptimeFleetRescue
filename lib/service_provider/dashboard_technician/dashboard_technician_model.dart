import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/tech_status_component_widget.dart';
import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/service_provider/bottom_bar/bottom_bar_widget.dart';
import '/service_provider/driver/chat/service_summary_widget/service_summary_widget_widget.dart';
import '/service_provider/driver/confirm_cancellation/confirm_cancellation_widget.dart';
import '/service_provider/select_vehicle/select_vehicle_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'dashboard_technician_widget.dart' show DashboardTechnicianWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardTechnicianModel
    extends FlutterFlowModel<DashboardTechnicianWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Update technician position  using current postion)] action in dashboardTechnician widget.
  ApiCallResponse? apiResultayo6;
  InstantTimer? instantTimer2;
  // Stores action output result for [Backend Call - API (Update technician position  using current postion)] action in dashboardTechnician widget.
  ApiCallResponse? apiResultayoo;
  // Stores action output result for [Backend Call - Read Document] action in dashboardTechnician widget.
  RequestRecord? activeRequest;
  // Model for userDetails component.
  late UserDetailsModel userDetailsModel;
  // Model for empty_state_Simple component.
  late EmptyStateSimpleModel emptyStateSimpleModel;
  // Model for serviceSummaryWidget component.
  late ServiceSummaryWidgetModel serviceSummaryWidgetModel;
  // Model for confirmCancellation component.
  late ConfirmCancellationModel confirmCancellationModel;
  // Model for bottom_bar component.
  late BottomBarModel bottomBarModel;

  @override
  void initState(BuildContext context) {
    userDetailsModel = createModel(context, () => UserDetailsModel());
    emptyStateSimpleModel = createModel(context, () => EmptyStateSimpleModel());
    serviceSummaryWidgetModel =
        createModel(context, () => ServiceSummaryWidgetModel());
    confirmCancellationModel =
        createModel(context, () => ConfirmCancellationModel());
    bottomBarModel = createModel(context, () => BottomBarModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    instantTimer2?.cancel();
    userDetailsModel.dispose();
    emptyStateSimpleModel.dispose();
    serviceSummaryWidgetModel.dispose();
    confirmCancellationModel.dispose();
    bottomBarModel.dispose();
  }
}
