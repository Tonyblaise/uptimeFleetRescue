import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BidsRecord extends FirestoreRecord {
  BidsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  bool hasDistance() => _distance != null;

  // "distanceMapbox" field.
  double? _distanceMapbox;
  double get distanceMapbox => _distanceMapbox ?? 0.0;
  bool hasDistanceMapbox() => _distanceMapbox != null;

  // "eta" field.
  String? _eta;
  String get eta => _eta ?? '';
  bool hasEta() => _eta != null;

  // "lat" field.
  String? _lat;
  String get lat => _lat ?? '';
  bool hasLat() => _lat != null;

  // "lng" field.
  String? _lng;
  String get lng => _lng ?? '';
  bool hasLng() => _lng != null;

  // "pricing" field.
  double? _pricing;
  double get pricing => _pricing ?? 0.0;
  bool hasPricing() => _pricing != null;

  // "technician" field.
  DocumentReference? _technician;
  DocumentReference? get technician => _technician;
  bool hasTechnician() => _technician != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "technicianName" field.
  String? _technicianName;
  String get technicianName => _technicianName ?? '';
  bool hasTechnicianName() => _technicianName != null;

  // "FleetCompanyName" field.
  String? _fleetCompanyName;
  String get fleetCompanyName => _fleetCompanyName ?? '';
  bool hasFleetCompanyName() => _fleetCompanyName != null;

  // "position" field.
  LatLng? _position;
  LatLng? get position => _position;
  bool hasPosition() => _position != null;

  // "requestId" field.
  DocumentReference? _requestId;
  DocumentReference? get requestId => _requestId;
  bool hasRequestId() => _requestId != null;

  void _initializeFields() {
    _accepted = snapshotData['accepted'] as bool?;
    _distance = castToType<double>(snapshotData['distance']);
    _distanceMapbox = castToType<double>(snapshotData['distanceMapbox']);
    _eta = snapshotData['eta'] as String?;
    _lat = snapshotData['lat'] as String?;
    _lng = snapshotData['lng'] as String?;
    _pricing = castToType<double>(snapshotData['pricing']);
    _technician = snapshotData['technician'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _technicianName = snapshotData['technicianName'] as String?;
    _fleetCompanyName = snapshotData['FleetCompanyName'] as String?;
    _position = snapshotData['position'] as LatLng?;
    _requestId = snapshotData['requestId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bids');

  static Stream<BidsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BidsRecord.fromSnapshot(s));

  static Future<BidsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BidsRecord.fromSnapshot(s));

  static BidsRecord fromSnapshot(DocumentSnapshot snapshot) => BidsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BidsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BidsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BidsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BidsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBidsRecordData({
  bool? accepted,
  double? distance,
  double? distanceMapbox,
  String? eta,
  String? lat,
  String? lng,
  double? pricing,
  DocumentReference? technician,
  String? status,
  String? technicianName,
  String? fleetCompanyName,
  LatLng? position,
  DocumentReference? requestId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'accepted': accepted,
      'distance': distance,
      'distanceMapbox': distanceMapbox,
      'eta': eta,
      'lat': lat,
      'lng': lng,
      'pricing': pricing,
      'technician': technician,
      'status': status,
      'technicianName': technicianName,
      'FleetCompanyName': fleetCompanyName,
      'position': position,
      'requestId': requestId,
    }.withoutNulls,
  );

  return firestoreData;
}

class BidsRecordDocumentEquality implements Equality<BidsRecord> {
  const BidsRecordDocumentEquality();

  @override
  bool equals(BidsRecord? e1, BidsRecord? e2) {
    return e1?.accepted == e2?.accepted &&
        e1?.distance == e2?.distance &&
        e1?.distanceMapbox == e2?.distanceMapbox &&
        e1?.eta == e2?.eta &&
        e1?.lat == e2?.lat &&
        e1?.lng == e2?.lng &&
        e1?.pricing == e2?.pricing &&
        e1?.technician == e2?.technician &&
        e1?.status == e2?.status &&
        e1?.technicianName == e2?.technicianName &&
        e1?.fleetCompanyName == e2?.fleetCompanyName &&
        e1?.position == e2?.position &&
        e1?.requestId == e2?.requestId;
  }

  @override
  int hash(BidsRecord? e) => const ListEquality().hash([
        e?.accepted,
        e?.distance,
        e?.distanceMapbox,
        e?.eta,
        e?.lat,
        e?.lng,
        e?.pricing,
        e?.technician,
        e?.status,
        e?.technicianName,
        e?.fleetCompanyName,
        e?.position,
        e?.requestId
      ]);

  @override
  bool isValidKey(Object? o) => o is BidsRecord;
}
