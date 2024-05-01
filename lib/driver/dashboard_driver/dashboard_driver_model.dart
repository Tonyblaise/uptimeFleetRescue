import '/components/page_title_widget.dart';
import '/components/user_details_widget.dart';
import '/driver/service_updates_component/service_updates_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_driver_widget.dart' show DashboardDriverWidget;
import 'package:flutter/material.dart';

class DashboardDriverModel extends FlutterFlowModel<DashboardDriverWidget> {
  ///  Local state fields for this page.

  String? service;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for userDetails component.
  late UserDetailsModel userDetailsModel;
  // Model for pageTitle component.
  late PageTitleModel pageTitleModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for serviceUpdatesComponent component.
  late ServiceUpdatesComponentModel serviceUpdatesComponentModel;

  @override
  void initState(BuildContext context) {
    userDetailsModel = createModel(context, () => UserDetailsModel());
    pageTitleModel = createModel(context, () => PageTitleModel());
    serviceUpdatesComponentModel =
        createModel(context, () => ServiceUpdatesComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userDetailsModel.dispose();
    pageTitleModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    serviceUpdatesComponentModel.dispose();
  }
}
