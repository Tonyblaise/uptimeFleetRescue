import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesRecord extends FirestoreRecord {
  ServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "defaultImage" field.
  String? _defaultImage;
  String get defaultImage => _defaultImage ?? '';
  bool hasDefaultImage() => _defaultImage != null;

  // "selectedImage" field.
  String? _selectedImage;
  String get selectedImage => _selectedImage ?? '';
  bool hasSelectedImage() => _selectedImage != null;

  // "no" field.
  int? _no;
  int get no => _no ?? 0;
  bool hasNo() => _no != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _defaultImage = snapshotData['defaultImage'] as String?;
    _selectedImage = snapshotData['selectedImage'] as String?;
    _no = castToType<int>(snapshotData['no']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesRecord.fromSnapshot(s));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesRecord.fromSnapshot(s));

  static ServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesRecordData({
  String? name,
  String? defaultImage,
  String? selectedImage,
  int? no,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'defaultImage': defaultImage,
      'selectedImage': selectedImage,
      'no': no,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicesRecordDocumentEquality implements Equality<ServicesRecord> {
  const ServicesRecordDocumentEquality();

  @override
  bool equals(ServicesRecord? e1, ServicesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.defaultImage == e2?.defaultImage &&
        e1?.selectedImage == e2?.selectedImage &&
        e1?.no == e2?.no;
  }

  @override
  int hash(ServicesRecord? e) => const ListEquality()
      .hash([e?.name, e?.defaultImage, e?.selectedImage, e?.no]);

  @override
  bool isValidKey(Object? o) => o is ServicesRecord;
}
