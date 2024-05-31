import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_location_widget.dart' show SelectLocationWidget;
import 'package:flutter/material.dart';

class SelectLocationModel extends FlutterFlowModel<SelectLocationWidget> {
  ///  Local state fields for this page.

  LatLng? latLng;

  bool addressView = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
