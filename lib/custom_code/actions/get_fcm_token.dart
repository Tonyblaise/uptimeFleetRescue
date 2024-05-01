// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:typed_data';
import 'package:flutter/foundation.dart'
    show kIsWeb; // Import to check platform

Future<String?> getFcmToken() async {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  if (kIsWeb) {
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      print('User declined or has not accepted permission');
      return 'ERROR: Web User declined or has not accepted permission';
    }
  } else {
    try {
      await _firebaseMessaging.requestPermission();
    } catch (e) {
      print('Error requesting permission: $e');
      return null;
    }
  }
  String? token;
  try {
    token = await _firebaseMessaging.getToken().timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        print("Getting FCM token took too long!");
        return null;
      },
    );
  } catch (e) {
    print('Error while getting FCM token: $e');
    return null;
  }

  return token;
}
