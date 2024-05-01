import '/chat/service_summary_widget/service_summary_widget_widget.dart';
import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'start_request_widget.dart' show StartRequestWidget;
import 'package:flutter/material.dart';

class StartRequestModel extends FlutterFlowModel<StartRequestWidget> {
  ///  Local state fields for this page.

  List<int> numebr = [];
  void addToNumebr(int item) => numebr.add(item);
  void removeFromNumebr(int item) => numebr.remove(item);
  void removeAtIndexFromNumebr(int index) => numebr.removeAt(index);
  void insertAtIndexInNumebr(int index, int item) => numebr.insert(index, item);
  void updateNumebrAtIndex(int index, Function(int) updateFn) =>
      numebr[index] = updateFn(numebr[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for userDetails component.
  late UserDetailsModel userDetailsModel;
  // Model for serviceSummaryWidget component.
  late ServiceSummaryWidgetModel serviceSummaryWidgetModel;

  @override
  void initState(BuildContext context) {
    userDetailsModel = createModel(context, () => UserDetailsModel());
    serviceSummaryWidgetModel =
        createModel(context, () => ServiceSummaryWidgetModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userDetailsModel.dispose();
    serviceSummaryWidgetModel.dispose();
  }
}
