import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/driver/confirm_cancellation/confirm_cancellation_widget.dart';
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

  // State field(s) for GoogleMapone widget.
  LatLng? googleMaponesCenter1;
  final googleMaponesController1 = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for confirmCancellation component.
  late ConfirmCancellationModel confirmCancellationModel1;
  // State field(s) for GoogleMapone widget.
  LatLng? googleMaponesCenter2;
  final googleMaponesController2 = Completer<GoogleMapController>();
  // Model for confirmCancellation component.
  late ConfirmCancellationModel confirmCancellationModel2;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // Model for serviceUpdatesComponent component.
  late ServiceUpdatesComponentModel serviceUpdatesComponentModel;

  @override
  void initState(BuildContext context) {
    confirmCancellationModel1 =
        createModel(context, () => ConfirmCancellationModel());
    confirmCancellationModel2 =
        createModel(context, () => ConfirmCancellationModel());
    serviceUpdatesComponentModel =
        createModel(context, () => ServiceUpdatesComponentModel());
  }

  @override
  void dispose() {
    confirmCancellationModel1.dispose();
    confirmCancellationModel2.dispose();
    serviceUpdatesComponentModel.dispose();
  }
}
