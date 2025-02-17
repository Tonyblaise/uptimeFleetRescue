// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:io';
import 'package:universal_html/html.dart' as html;
import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';

Future<void> openLocationSettings() async {
  Future<void> _openAppSettings() async {
    if (await Permission.location.isPermanentlyDenied) {
      // Open settings if location permission is permanently denied
      if (kIsWeb) {
        try {
          final permission = await html.window.navigator.permissions
              ?.query({'name': 'geolocation'});
          if (permission?.state == 'denied') {
            final userAgent = html.window.navigator.userAgent.toLowerCase();
            String settingsUrl = '';

            if (userAgent.contains('chrome')) {
              settingsUrl = 'chrome://settings/content/location';
            } else if (userAgent.contains('firefox')) {
              settingsUrl = 'about:preferences#privacy';
            } else if (userAgent.contains('edge')) {
              settingsUrl = 'edge://settings/content/location';
            } else if (userAgent.contains('safari')) {
              settingsUrl = 'safari://settings';
            }

            if (settingsUrl.isNotEmpty) {
              html.window.open(settingsUrl, '_blank');
            }
          } else {
            html.window.navigator.geolocation?.getCurrentPosition();
          }
        } catch (e) {
          print('Error checking location permission: $e');
        }
      } else if (Platform.isAndroid) {
        await AppSettings.openAppSettings();
      } else if (Platform.isIOS) {
        if (await canLaunchUrl(Uri.parse('app-settings:'))) {
          await launchUrl(Uri.parse('app-settings:'));
        }
      }
      await AppSettings.openAppSettings();
    } else {
      // Request location permission first
      await Permission.location.request();
    }
  }
}
