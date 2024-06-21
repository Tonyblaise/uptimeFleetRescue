import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestRecord extends FirestoreRecord {
  RequestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "bubbleId" field.
  String? _bubbleId;
  String get bubbleId => _bubbleId ?? '';
  bool hasBubbleId() => _bubbleId != null;

  // "firebaseMessageThread" field.
  DocumentReference? _firebaseMessageThread;
  DocumentReference? get firebaseMessageThread => _firebaseMessageThread;
  bool hasFirebaseMessageThread() => _firebaseMessageThread != null;

  // "technician" field.
  DocumentReference? _technician;
  DocumentReference? get technician => _technician;
  bool hasTechnician() => _technician != null;

  // "driver" field.
  DocumentReference? _driver;
  DocumentReference? get driver => _driver;
  bool hasDriver() => _driver != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "driverName" field.
  String? _driverName;
  String get driverName => _driverName ?? '';
  bool hasDriverName() => _driverName != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "distance" field.
  String? _distance;
  String get distance => _distance ?? '';
  bool hasDistance() => _distance != null;

  // "dropOffLocationLatLng" field.
  LatLng? _dropOffLocationLatLng;
  LatLng? get dropOffLocationLatLng => _dropOffLocationLatLng;
  bool hasDropOffLocationLatLng() => _dropOffLocationLatLng != null;

  // "requestPending" field.
  bool? _requestPending;
  bool get requestPending => _requestPending ?? false;
  bool hasRequestPending() => _requestPending != null;

  // "started" field.
  bool? _started;
  bool get started => _started ?? false;
  bool hasStarted() => _started != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _bubbleId = snapshotData['bubbleId'] as String?;
    _firebaseMessageThread =
        snapshotData['firebaseMessageThread'] as DocumentReference?;
    _technician = snapshotData['technician'] as DocumentReference?;
    _driver = snapshotData['driver'] as DocumentReference?;
    _location = snapshotData['location'] as LatLng?;
    _driverName = snapshotData['driverName'] as String?;
    _duration = snapshotData['duration'] as String?;
    _distance = snapshotData['distance'] as String?;
    _dropOffLocationLatLng = snapshotData['dropOffLocationLatLng'] as LatLng?;
    _requestPending = snapshotData['requestPending'] as bool?;
    _started = snapshotData['started'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('request');

  static Stream<RequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestRecord.fromSnapshot(s));

  static Future<RequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestRecord.fromSnapshot(s));

  static RequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestRecordData({
  String? status,
  String? bubbleId,
  DocumentReference? firebaseMessageThread,
  DocumentReference? technician,
  DocumentReference? driver,
  LatLng? location,
  String? driverName,
  String? duration,
  String? distance,
  LatLng? dropOffLocationLatLng,
  bool? requestPending,
  bool? started,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'bubbleId': bubbleId,
      'firebaseMessageThread': firebaseMessageThread,
      'technician': technician,
      'driver': driver,
      'location': location,
      'driverName': driverName,
      'duration': duration,
      'distance': distance,
      'dropOffLocationLatLng': dropOffLocationLatLng,
      'requestPending': requestPending,
      'started': started,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestRecordDocumentEquality implements Equality<RequestRecord> {
  const RequestRecordDocumentEquality();

  @override
  bool equals(RequestRecord? e1, RequestRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.bubbleId == e2?.bubbleId &&
        e1?.firebaseMessageThread == e2?.firebaseMessageThread &&
        e1?.technician == e2?.technician &&
        e1?.driver == e2?.driver &&
        e1?.location == e2?.location &&
        e1?.driverName == e2?.driverName &&
        e1?.duration == e2?.duration &&
        e1?.distance == e2?.distance &&
        e1?.dropOffLocationLatLng == e2?.dropOffLocationLatLng &&
        e1?.requestPending == e2?.requestPending &&
        e1?.started == e2?.started;
  }

  @override
  int hash(RequestRecord? e) => const ListEquality().hash([
        e?.status,
        e?.bubbleId,
        e?.firebaseMessageThread,
        e?.technician,
        e?.driver,
        e?.location,
        e?.driverName,
        e?.duration,
        e?.distance,
        e?.dropOffLocationLatLng,
        e?.requestPending,
        e?.started
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestRecord;
}
