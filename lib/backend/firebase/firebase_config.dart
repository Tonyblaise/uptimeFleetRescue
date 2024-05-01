import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAi91w1eUFJgoIqh_tQzJSMd0o2BZ3Fz3Q",
            authDomain: "uptimefleet-383db.firebaseapp.com",
            projectId: "uptimefleet-383db",
            storageBucket: "uptimefleet-383db.appspot.com",
            messagingSenderId: "510089801067",
            appId: "1:510089801067:web:a5a58d2d8bb8617632702e",
            measurementId: "G-00VZJDVQW1"));
  } else {
    await Firebase.initializeApp();
  }
}
