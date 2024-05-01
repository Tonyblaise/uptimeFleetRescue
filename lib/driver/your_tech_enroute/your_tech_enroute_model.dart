import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'your_tech_enroute_widget.dart' show YourTechEnrouteWidget;
import 'package:flutter/material.dart';

class YourTechEnrouteModel extends FlutterFlowModel<YourTechEnrouteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
