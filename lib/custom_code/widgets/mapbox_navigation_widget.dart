// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:js_interop';

// import '/service_provider/service_updates_component_s_p/service_updates_component_s_p_widget.dart'; // Imports other custom widgets

import 'dart:async';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';

class MapboxNavigationWidget extends StatefulWidget {
  const MapboxNavigationWidget({
    super.key,
    this.width,
    this.height,
    required this.originLat,
    required this.originLng,
    required this.destinationLat,
    required this.destinationLng,
    required this.chat,
    required this.request,
    required this.updatePosition,
    required this.driverName,
    required this.color,
    required this.title,
    this.startRequest,
  });

  final double? width;
  final double? height;
  final double originLat;
  final double originLng;
  final double destinationLat;
  final double destinationLng;
  final String chat;
  final String driverName;
  final DocumentReference request;
  final Future Function(String duration, String distance) updatePosition;

  final Color color;
  final String title;
  final Future Function()? startRequest;

  @override
  State<MapboxNavigationWidget> createState() => _MapboxNavigationWidgetState();
}

class _MapboxNavigationWidgetState extends State<MapboxNavigationWidget> {
  String? _platformVersion;
  String? _instruction;

  final bool _isMultipleStop = false;
  double? _distanceRemaining, _durationRemaining;
  MapBoxNavigationViewController? _controller;
  bool _routeBuilt = false;
  bool _isNavigating = false;
  bool _inFreeDrive = false;
  late MapBoxOptions _navigationOption;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initialize() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    _navigationOption = MapBoxNavigation.instance.getDefaultOptions();
    _navigationOption.simulateRoute = true;
    _navigationOption.language = "en";
    //_navigationOption.initialLatitude = 36.1175275;
    //_navigationOption.initialLongitude = -115.1839524;
    MapBoxNavigation.instance.registerRouteEventListener(_onEmbeddedRouteEvent);
  }

  @override
  Widget build(BuildContext context) {
    final _home = WayPoint(
        name: widget.driverName,
        latitude: widget.originLat,
        longitude: widget.originLng,
        isSilent: false);

    final _store = WayPoint(
        name: "Your Location",
        latitude: widget.destinationLat,
        longitude: widget.destinationLng,
        isSilent: false);
    return Container(
      height: 56,
      child: ElevatedButton(
        onPressed: () async {
          var wayPoints = <WayPoint>[];
          wayPoints.add(_home);
          wayPoints.add(_store);
          var opt = MapBoxOptions.from(_navigationOption);
          opt.simulateRoute = false;
          opt.voiceInstructionsEnabled = true;
          opt.bannerInstructionsEnabled = true;
          opt.units = VoiceUnits.metric;
          opt.language = "en";

          widget.startRequest?.call();

          await MapBoxNavigation.instance
              .startNavigation(wayPoints: wayPoints, options: opt);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
          foregroundColor: Colors.white,
        ),
        child: Text(widget.title),
      ),
    );
  }

  Future<void> _onEmbeddedRouteEvent(e) async {
    _distanceRemaining = await MapBoxNavigation.instance.getDistanceRemaining();
    _durationRemaining = await MapBoxNavigation.instance.getDurationRemaining();

    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        var progressEvent = e.data as RouteProgressEvent;
        if (progressEvent.currentStepInstruction != null) {
          _instruction = progressEvent.currentStepInstruction;
          widget.updatePosition(
              "${(_durationRemaining! / 60).toStringAsFixed(0)} minutes",
              "${(_distanceRemaining! * 0.000621371).toStringAsFixed(1)} miles");
        }
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        setState(() {
          _routeBuilt = true;
        });
        break;
      case MapBoxEvent.route_build_failed:
        setState(() {
          _routeBuilt = false;
        });
        break;
      case MapBoxEvent.navigation_running:
        setState(() {
          _isNavigating = true;
        });
        break;
      case MapBoxEvent.on_arrival:
        if (!_isMultipleStop) {
          await Future.delayed(const Duration(seconds: 3));
          await _controller?.finishNavigation();
        } else {}
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        setState(() {
          _routeBuilt = false;
          _isNavigating = false;
        });
        break;
      default:
        break;
    }
    setState(() {});
  }
}
