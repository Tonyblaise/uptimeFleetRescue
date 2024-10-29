import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _onDuty = await secureStorage.getBool('ff_onDuty') ?? _onDuty;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _test = '';
  String get test => _test;
  set test(String value) {
    _test = value;
  }

  String _requestAdditionalInfo = '';
  String get requestAdditionalInfo => _requestAdditionalInfo;
  set requestAdditionalInfo(String value) {
    _requestAdditionalInfo = value;
  }

  LatLng? _dropOffLocation;
  LatLng? get dropOffLocation => _dropOffLocation;
  set dropOffLocation(LatLng? value) {
    _dropOffLocation = value;
  }

  LatLng? _location = const LatLng(-3.2191864, 40.1168906);
  LatLng? get location => _location;
  set location(LatLng? value) {
    _location = value;
  }

  bool _onDuty = false;
  bool get onDuty => _onDuty;
  set onDuty(bool value) {
    _onDuty = value;
    secureStorage.setBool('ff_onDuty', value);
  }

  void deleteOnDuty() {
    secureStorage.delete(key: 'ff_onDuty');
  }

  String _technicianId = '';
  String get technicianId => _technicianId;
  set technicianId(String value) {
    _technicianId = value;
  }

  String _address = '';
  String get address => _address;
  set address(String value) {
    _address = value;
  }

  String _dropOffLocationAddress = '';
  String get dropOffLocationAddress => _dropOffLocationAddress;
  set dropOffLocationAddress(String value) {
    _dropOffLocationAddress = value;
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
