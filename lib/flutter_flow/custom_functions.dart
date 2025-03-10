import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool checkNull(String? string) {
  // check if a string is empty or null
  if (string == null || string.isEmpty) {
    return true;
  } else {
    return false;
  }
}

bool checkNullImage(String? image) {
  // check if a string is empty or null
  if (image == null || image.isEmpty) {
    return true;
  } else {
    return false;
  }
}

String convertLatLngToString(LatLng position) {
  // convert latlng to string
  return '${position.toString()}';
}

double getLat(LatLng latLng) {
  // get latitude from latLng
  return latLng.latitude;
}

double getLng(LatLng latLng) {
  // get longitude from latLng
// get longitude from latLng
  return latLng.longitude;
}

DateTime converUnixTimestamp(int timestamp) {
  // convert unix timestamp to date in 12 hour format
  return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toLocal();
}

double? convertStringToDouble(String? stringToConvert) {
  String? myString = stringToConvert;
  double? myDouble = num.tryParse(myString!)?.toDouble();
  return myDouble;
}

DocumentReference? convertStringToRequestDocRef(String? requestId) {
  // convert string to chatdocRef
  if (requestId == null) {
    return null;
  } else {
    return FirebaseFirestore.instance.collection('request').doc(requestId);
  }
}

LatLng converLatLngStringToLatLng(
  double lat,
  double lng,
) {
  // convert lat and lng string to LatLng
  return LatLng(lat, lng);
}

DocumentReference? convertStringToTechnicianDocRef(String technicianId) {
  // convert string to chatdocRef
  if (technicianId == null) {
    return null;
  } else {
    return FirebaseFirestore.instance.collection('users').doc(technicianId);
  }
}

String combineTextNames(List<String> text) {
  // function to join a list of texts to a single string using ,
  return text.join(',');
}

DocumentReference? convertStringToChatDocRef(String? chatId) {
  // convert string to chatdocRef
  if (chatId == null) {
    return null;
  } else {
    return FirebaseFirestore.instance.collection('chats').doc(chatId);
  }
}

String? relativeTime(double? seconds) {
  // convert seconds into hours minutes and seconds. Use min for minutes and secs for seconds
  if (seconds == null) return null;

  final duration = Duration(seconds: seconds.toInt());
  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);
  final secs = duration.inSeconds.remainder(60);

  if (hours > 0) {
    return '$hours hrs $minutes min $secs secs';
  } else if (minutes > 0) {
    return '$minutes min $secs secs';
  } else {
    return '$secs secs';
  }
}

int? addOne(int? number) {
  // add one to a number
  return number != null ? number + 1 : null;
}

String? convertToUppercase(String? text) {
  // make string uppercase
  return text?.toUpperCase();
}

List<UsersRecord> getLocationFromUsers(List<UsersRecord> users) {
  // return a list of users documents from a list of user documents
  return users
      .where((user) => user.technicianLastUpdatedLocation != null)
      .toList();
}

String? latLngToString(LatLng? latLng) {
  if (latLng == null) {
    return null;
  }

  // convert LatLng to "{lat},{lng}" string
  String latLngString = '${latLng.latitude},${latLng.longitude}';

  return latLngString;
}

String joinListofImagURLs(List<String> images) {
  // Take a list of strings and return one string joined with ,
  // join a list of strings with ,
  return images.join(',');
}

BidsRecord? compareLatLngToBidsLng(
  LatLng? latLng,
  List<BidsRecord>? bids,
) {
  // function that takes a lat lng and a list of bids document then takes the lat lng and compares it to the position field of the bids documents which is a latlng. It then return the one that matches the closest
  if (latLng == null || bids == null || bids.isEmpty) {
    return null;
  }

  BidsRecord closestBid = bids.first;
  double minDistance = double.infinity;

  // Helper function to calculate distance between two points using Haversine formula
  double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371000; // meters
    double latRad1 = lat1 * math.pi / 180;
    double latRad2 = lat2 * math.pi / 180;
    double deltaLat = (lat2 - lat1) * math.pi / 180;
    double deltaLon = (lon2 - lon1) * math.pi / 180;

    double a = math.sin(deltaLat / 2) * math.sin(deltaLat / 2) +
        math.cos(latRad1) *
            math.cos(latRad2) *
            math.sin(deltaLon / 2) *
            math.sin(deltaLon / 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadius * c; // distance in meters
  }

  for (var bid in bids) {
    if (bid.position != null) {
      double distance = calculateDistance(
        latLng.latitude,
        latLng.longitude,
        bid.position!.latitude,
        bid.position!.longitude,
      );

      if (distance < minDistance) {
        minDistance = distance;
        closestBid = bid;
      }
    }
  }

  return closestBid;
}

int divideNumberByTwo(int no) {
  // function to modulo number by 2
  return no % 2;
}
