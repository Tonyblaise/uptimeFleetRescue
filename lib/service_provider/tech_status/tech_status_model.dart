import '/components/page_title_widget.dart';
import '/components/tech_status_component_widget.dart';
import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/bottom_bar/bottom_bar_widget.dart';
import 'tech_status_widget.dart' show TechStatusWidget;
import 'package:flutter/material.dart';

class TechStatusModel extends FlutterFlowModel<TechStatusWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for userDetails component.
  late UserDetailsModel userDetailsModel;
  // Model for pageTitle component.
  late PageTitleModel pageTitleModel;
  // Model for techStatusComponent component.
  late TechStatusComponentModel techStatusComponentModel;
  // Model for bottom_bar component.
  late BottomBarModel bottomBarModel;

  @override
  void initState(BuildContext context) {
    userDetailsModel = createModel(context, () => UserDetailsModel());
    pageTitleModel = createModel(context, () => PageTitleModel());
    techStatusComponentModel =
        createModel(context, () => TechStatusComponentModel());
    bottomBarModel = createModel(context, () => BottomBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userDetailsModel.dispose();
    pageTitleModel.dispose();
    techStatusComponentModel.dispose();
    bottomBarModel.dispose();
  }
}
