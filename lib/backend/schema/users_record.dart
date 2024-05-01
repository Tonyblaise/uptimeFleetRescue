import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "companyId" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "driverId" field.
  String? _driverId;
  String get driverId => _driverId ?? '';
  bool hasDriverId() => _driverId != null;

  // "profilePicture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  bool hasProfilePicture() => _profilePicture != null;

  // "technicianId" field.
  String? _technicianId;
  String get technicianId => _technicianId ?? '';
  bool hasTechnicianId() => _technicianId != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "driverFleetManagerMessageThreadId" field.
  String? _driverFleetManagerMessageThreadId;
  String get driverFleetManagerMessageThreadId =>
      _driverFleetManagerMessageThreadId ?? '';
  bool hasDriverFleetManagerMessageThreadId() =>
      _driverFleetManagerMessageThreadId != null;

  // "driverSupportMessageThreadId" field.
  String? _driverSupportMessageThreadId;
  String get driverSupportMessageThreadId =>
      _driverSupportMessageThreadId ?? '';
  bool hasDriverSupportMessageThreadId() =>
      _driverSupportMessageThreadId != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "onDuty" field.
  bool? _onDuty;
  bool get onDuty => _onDuty ?? false;
  bool hasOnDuty() => _onDuty != null;

  // "activeVehicle" field.
  String? _activeVehicle;
  String get activeVehicle => _activeVehicle ?? '';
  bool hasActiveVehicle() => _activeVehicle != null;

  // "fcmToken" field.
  String? _fcmToken;
  String get fcmToken => _fcmToken ?? '';
  bool hasFcmToken() => _fcmToken != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "activeRequest" field.
  DocumentReference? _activeRequest;
  DocumentReference? get activeRequest => _activeRequest;
  bool hasActiveRequest() => _activeRequest != null;

  // "technicianLastUpdatedLocation" field.
  LatLng? _technicianLastUpdatedLocation;
  LatLng? get technicianLastUpdatedLocation => _technicianLastUpdatedLocation;
  bool hasTechnicianLastUpdatedLocation() =>
      _technicianLastUpdatedLocation != null;

  // "activeRequestBubble" field.
  String? _activeRequestBubble;
  String get activeRequestBubble => _activeRequestBubble ?? '';
  bool hasActiveRequestBubble() => _activeRequestBubble != null;

  // "driverSupportMessageThreadIdFirebase" field.
  DocumentReference? _driverSupportMessageThreadIdFirebase;
  DocumentReference? get driverSupportMessageThreadIdFirebase =>
      _driverSupportMessageThreadIdFirebase;
  bool hasDriverSupportMessageThreadIdFirebase() =>
      _driverSupportMessageThreadIdFirebase != null;

  // "driverFleetManagerMessageThreadIdFirebaseId" field.
  DocumentReference? _driverFleetManagerMessageThreadIdFirebaseId;
  DocumentReference? get driverFleetManagerMessageThreadIdFirebaseId =>
      _driverFleetManagerMessageThreadIdFirebaseId;
  bool hasDriverFleetManagerMessageThreadIdFirebaseId() =>
      _driverFleetManagerMessageThreadIdFirebaseId != null;

  void _initializeFields() {
    _companyId = snapshotData['companyId'] as String?;
    _companyName = snapshotData['companyName'] as String?;
    _driverId = snapshotData['driverId'] as String?;
    _profilePicture = snapshotData['profilePicture'] as String?;
    _technicianId = snapshotData['technicianId'] as String?;
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _fullName = snapshotData['fullName'] as String?;
    _driverFleetManagerMessageThreadId =
        snapshotData['driverFleetManagerMessageThreadId'] as String?;
    _driverSupportMessageThreadId =
        snapshotData['driverSupportMessageThreadId'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _onDuty = snapshotData['onDuty'] as bool?;
    _activeVehicle = snapshotData['activeVehicle'] as String?;
    _fcmToken = snapshotData['fcmToken'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _activeRequest = snapshotData['activeRequest'] as DocumentReference?;
    _technicianLastUpdatedLocation =
        snapshotData['technicianLastUpdatedLocation'] as LatLng?;
    _activeRequestBubble = snapshotData['activeRequestBubble'] as String?;
    _driverSupportMessageThreadIdFirebase =
        snapshotData['driverSupportMessageThreadIdFirebase']
            as DocumentReference?;
    _driverFleetManagerMessageThreadIdFirebaseId =
        snapshotData['driverFleetManagerMessageThreadIdFirebaseId']
            as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? companyId,
  String? companyName,
  String? driverId,
  String? profilePicture,
  String? technicianId,
  String? email,
  String? photoUrl,
  String? uid,
  String? fullName,
  String? driverFleetManagerMessageThreadId,
  String? driverSupportMessageThreadId,
  DateTime? createdTime,
  String? displayName,
  String? phoneNumber,
  bool? onDuty,
  String? activeVehicle,
  String? fcmToken,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  DocumentReference? activeRequest,
  LatLng? technicianLastUpdatedLocation,
  String? activeRequestBubble,
  DocumentReference? driverSupportMessageThreadIdFirebase,
  DocumentReference? driverFleetManagerMessageThreadIdFirebaseId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'companyId': companyId,
      'companyName': companyName,
      'driverId': driverId,
      'profilePicture': profilePicture,
      'technicianId': technicianId,
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'fullName': fullName,
      'driverFleetManagerMessageThreadId': driverFleetManagerMessageThreadId,
      'driverSupportMessageThreadId': driverSupportMessageThreadId,
      'created_time': createdTime,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'onDuty': onDuty,
      'activeVehicle': activeVehicle,
      'fcmToken': fcmToken,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'activeRequest': activeRequest,
      'technicianLastUpdatedLocation': technicianLastUpdatedLocation,
      'activeRequestBubble': activeRequestBubble,
      'driverSupportMessageThreadIdFirebase':
          driverSupportMessageThreadIdFirebase,
      'driverFleetManagerMessageThreadIdFirebaseId':
          driverFleetManagerMessageThreadIdFirebaseId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.companyId == e2?.companyId &&
        e1?.companyName == e2?.companyName &&
        e1?.driverId == e2?.driverId &&
        e1?.profilePicture == e2?.profilePicture &&
        e1?.technicianId == e2?.technicianId &&
        e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.fullName == e2?.fullName &&
        e1?.driverFleetManagerMessageThreadId ==
            e2?.driverFleetManagerMessageThreadId &&
        e1?.driverSupportMessageThreadId == e2?.driverSupportMessageThreadId &&
        e1?.createdTime == e2?.createdTime &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.onDuty == e2?.onDuty &&
        e1?.activeVehicle == e2?.activeVehicle &&
        e1?.fcmToken == e2?.fcmToken &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.activeRequest == e2?.activeRequest &&
        e1?.technicianLastUpdatedLocation ==
            e2?.technicianLastUpdatedLocation &&
        e1?.activeRequestBubble == e2?.activeRequestBubble &&
        e1?.driverSupportMessageThreadIdFirebase ==
            e2?.driverSupportMessageThreadIdFirebase &&
        e1?.driverFleetManagerMessageThreadIdFirebaseId ==
            e2?.driverFleetManagerMessageThreadIdFirebaseId;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.companyId,
        e?.companyName,
        e?.driverId,
        e?.profilePicture,
        e?.technicianId,
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.fullName,
        e?.driverFleetManagerMessageThreadId,
        e?.driverSupportMessageThreadId,
        e?.createdTime,
        e?.displayName,
        e?.phoneNumber,
        e?.onDuty,
        e?.activeVehicle,
        e?.fcmToken,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.activeRequest,
        e?.technicianLastUpdatedLocation,
        e?.activeRequestBubble,
        e?.driverSupportMessageThreadIdFirebase,
        e?.driverFleetManagerMessageThreadIdFirebaseId
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
