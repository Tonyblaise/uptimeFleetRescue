import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/service_updates_component_s_p/service_updates_component_s_p_widget.dart';
import 'service_summary_widget_widget.dart' show ServiceSummaryWidgetWidget;
import 'package:flutter/material.dart';

class ServiceSummaryWidgetModel
    extends FlutterFlowModel<ServiceSummaryWidgetWidget> {
  ///  State fields for stateful widgets in this component.

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
