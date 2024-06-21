import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/driver/service_updates_component/service_updates_component_widget.dart';
import 'landing_page_widget.dart' show LandingPageWidget;
import 'package:flutter/material.dart';

class LandingPageModel extends FlutterFlowModel<LandingPageWidget> {
  ///  Local state fields for this page.

  LatLng? latLng;

  bool addressView = true;

  List<LatLng> locations = [];
  void addToLocations(LatLng item) => locations.add(item);
  void removeFromLocations(LatLng item) => locations.remove(item);
  void removeAtIndexFromLocations(int index) => locations.removeAt(index);
  void insertAtIndexInLocations(int index, LatLng item) =>
      locations.insert(index, item);
  void updateLocationsAtIndex(int index, Function(LatLng) updateFn) =>
      locations[index] = updateFn(locations[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMapone widget.
  LatLng? googleMaponesCenter;
  final googleMaponesController = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // Model for serviceUpdatesComponent component.
  late ServiceUpdatesComponentModel serviceUpdatesComponentModel;

  @override
  void initState(BuildContext context) {
    serviceUpdatesComponentModel =
        createModel(context, () => ServiceUpdatesComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    serviceUpdatesComponentModel.dispose();
  }
}
