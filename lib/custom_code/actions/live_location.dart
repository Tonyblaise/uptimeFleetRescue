// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter/services.dart';

class LatLong {
  String _latitude;
  String _longitude;

  LatLong([this._latitude = "", this._longitude = ""]);

  /// Get latitude
  String get latitude => _latitude;

  /// Get longitude
  String get longitude => _longitude;

  /// Return the string of latitude and longitude.
  @override
  String toString() {
    return 'Latitude: $_latitude, Longitude: $_longitude';
  }
}

class LiveLocation {
  static const MethodChannel _channel = MethodChannel('live_location');
  static final StreamController<LatLong> changeController =
      StreamController<LatLong>.broadcast();
  static Timer? getLocationTimer;

  /// Get location
  static Future<void> getLocation() async {
    List<String> pos;
    try {
      pos = await getLatLong;
      changeController.add(LatLong(pos[0], pos[1]));
    } on PlatformException catch (e) {
      print('PlatformException: $e');
    }
  }

  /// Location with repeating by timer
  static void start(int time) {
    getLocationTimer =
        Timer.periodic(Duration(seconds: time), (Timer t) => getLocation());
  }

  /// Stop repeating by timer
  static void stop() {
    getLocationTimer?.cancel();
  }

  /// The stream getter where others can listen to
  static Stream<LatLong> get onChange => changeController.stream;

  /// Method to get the current location
  static Future<List<String>> get getLatLong async {
    final String latitude = await _channel.invokeMethod('getLatitude');
    final String longitude = await _channel.invokeMethod('getLongitude');
    return [latitude, longitude];
  }

  /// Dispose the stream controller
  static void dispose() {
    changeController.close();
  }
}

Future<void> liveLocation() async {
  // Add your function code here
}
