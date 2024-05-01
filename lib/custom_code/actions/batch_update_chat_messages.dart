// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future batchUpdateChatMessages(List<DocumentReference>? chatMessages) async {
  // update chat messages read field to true
// Import necessary packages

// Define function to update chat messages read field to true
  Future<void> batchUpdateChatMessages(
      List<DocumentReference>? chatMessages) async {
    // Create batch object
    WriteBatch batch = FirebaseFirestore.instance.batch();

    // Loop through chat messages and update read field to true
    chatMessages?.forEach((chatMessage) {
      batch.update(chatMessage, {'read': true});
    });

    // Commit batch update
    await batch.commit();
  }
}
