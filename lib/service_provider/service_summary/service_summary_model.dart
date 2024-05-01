import '/flutter_flow/flutter_flow_util.dart';
import 'service_summary_widget.dart' show ServiceSummaryWidget;
import 'package:flutter/material.dart';

class ServiceSummaryModel extends FlutterFlowModel<ServiceSummaryWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
