import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'service_summary_widget.dart' show ServiceSummaryWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceSummaryModel extends FlutterFlowModel<ServiceSummaryWidget> {
  ///  Local state fields for this page.

  List<int> numebr = [];
  void addToNumebr(int item) => numebr.add(item);
  void removeFromNumebr(int item) => numebr.remove(item);
  void removeAtIndexFromNumebr(int index) => numebr.removeAt(index);
  void insertAtIndexInNumebr(int index, int item) => numebr.insert(index, item);
  void updateNumebrAtIndex(int index, Function(int) updateFn) =>
      numebr[index] = updateFn(numebr[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
