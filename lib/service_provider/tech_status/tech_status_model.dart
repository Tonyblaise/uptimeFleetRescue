import '/components/page_title_widget.dart';
import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/service_provider/bottom_bar/bottom_bar_widget.dart';
import 'tech_status_widget.dart' show TechStatusWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TechStatusModel extends FlutterFlowModel<TechStatusWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for userDetails component.
  late UserDetailsModel userDetailsModel;
  // Model for pageTitle component.
  late PageTitleModel pageTitleModel;
  // Model for bottom_bar component.
  late BottomBarModel bottomBarModel;

  @override
  void initState(BuildContext context) {
    userDetailsModel = createModel(context, () => UserDetailsModel());
    pageTitleModel = createModel(context, () => PageTitleModel());
    bottomBarModel = createModel(context, () => BottomBarModel());
  }

  @override
  void dispose() {
    userDetailsModel.dispose();
    pageTitleModel.dispose();
    bottomBarModel.dispose();
  }
}
