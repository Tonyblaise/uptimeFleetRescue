import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/service_provider/driver/confirm_cancellation/confirm_cancellation_widget.dart';
import '/service_provider/driver/service_updates_component/service_updates_component_widget.dart';
import 'dart:io';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'landing_page_widget.dart' show LandingPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  FFPlace placePickerValue = FFPlace();
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
