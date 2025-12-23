import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;

  static final StorageService _instance = StorageService._internal();

  factory StorageService() {
    return _instance;
  }

  StorageService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  // Specific Keys
  static const String _storageUserProfileKey = 'user_profile_key';
  static const String _storageUserTokenKey = 'user_token_key';
  static const String _storageDeviceFirstOpenKey = 'device_first_open';

  // Specific Methods
  bool getDeviceFirstOpen() {
    return _prefs.getBool(_storageDeviceFirstOpenKey) ?? false;
  }

  Future<bool> setDeviceFirstOpen(bool firstOpen) {
    return _prefs.setBool(_storageDeviceFirstOpenKey, firstOpen);
  }

  bool isLoggedIn() {
    return _prefs.getString(_storageUserTokenKey) != null ? true : false;
  }

  Future<bool> setLoggedIn(String token) {
    return _prefs.setString(_storageUserTokenKey, token);
  }

  Future<bool> removeToken() {
    return _prefs.remove(_storageUserTokenKey);
  }
}

final storageService = StorageService();
