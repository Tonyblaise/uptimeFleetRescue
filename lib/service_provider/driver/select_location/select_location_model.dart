import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'select_location_widget.dart' show SelectLocationWidget;
import 'package:flutter/material.dart';

class SelectLocationModel extends FlutterFlowModel<SelectLocationWidget> {
  ///  Local state fields for this page.

  LatLng? latLng;

  bool addressView = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
