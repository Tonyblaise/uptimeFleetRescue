// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:geolocator/geolocator.dart';

Future<bool> checkLocationPermissions() async {
  // function to check whether the current location permissions are enabled for web, ios and android
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.

    return false;
  }

  permission = await _geolocatorPlatform.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await _geolocatorPlatform.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.

      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.

    return false;
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

  return true;
}
