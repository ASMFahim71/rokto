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
  static const String _storageUserNameKey = 'user_name_key';
  static const String _storageUserTokenKey = 'user_token_key';
  static const String _storageDeviceFirstOpenKey = 'device_first_open';
  static const String _storageLastDonationDateKey = 'last_donation_date';

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

  Future<bool> removeUserName() {
    return _prefs.remove(_storageUserNameKey);
  }

  String? getUserToken() {
    return _prefs.getString(_storageUserTokenKey);
  }

  Future<bool> setUserName(String name) {
    return _prefs.setString(_storageUserNameKey, name);
  }

  String? getUserName() {
    return _prefs.getString(_storageUserNameKey);
  }

  static const String _storageUserBloodGroupKey = 'user_blood_group_key';
  static const String _storageUserDistrictKey = 'user_district_key';

  Future<bool> setUserBloodGroup(String bloodGroup) {
    return _prefs.setString(_storageUserBloodGroupKey, bloodGroup);
  }

  String? getUserBloodGroup() {
    return _prefs.getString(_storageUserBloodGroupKey);
  }

  Future<bool> setUserDistrict(String district) {
    return _prefs.setString(_storageUserDistrictKey, district);
  }

  String? getUserDistrict() {
    return _prefs.getString(_storageUserDistrictKey);
  }

  Future<bool> setLastDonationDate(String date) {
    return _prefs.setString(_storageLastDonationDateKey, date);
  }

  String? getLastDonationDate() {
    return _prefs.getString(_storageLastDonationDateKey);
  }
}

final storageService = StorageService();
