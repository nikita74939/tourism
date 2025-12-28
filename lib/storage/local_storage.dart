import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import '../utils/constants.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();
  factory LocalStorage() => _instance;
  LocalStorage._internal();

  final _box = GetStorage();

  // Initialize storage
  static Future<void> init() async {
    await GetStorage.init();
  }

  // Token Management
  Future<void> saveToken(String token) async {
    await _box.write(AppConstants.tokenKey, token);
  }

  String? getToken() {
    return _box.read(AppConstants.tokenKey);
  }

  Future<void> deleteToken() async {
    await _box.remove(AppConstants.tokenKey);
  }

  bool hasToken() {
    return _box.hasData(AppConstants.tokenKey);
  }

  // User Data Management
  Future<void> saveUser(Map<String, dynamic> userData) async {
    await _box.write(AppConstants.userKey, jsonEncode(userData));
  }

  Map<String, dynamic>? getUser() {
    final userString = _box.read(AppConstants.userKey);
    if (userString != null) {
      return jsonDecode(userString);
    }
    return null;
  }

  Future<void> deleteUser() async {
    await _box.remove(AppConstants.userKey);
  }

  // Login Status
  Future<void> setLoggedIn(bool isLoggedIn) async {
    await _box.write(AppConstants.isLoggedInKey, isLoggedIn);
  }

  bool isLoggedIn() {
    return _box.read(AppConstants.isLoggedInKey) ?? false;
  }

  // Clear All Data
  Future<void> clearAll() async {
    await _box.erase();
  }

  // Generic Read/Write
  Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  T? read<T>(String key) {
    return _box.read<T>(key);
  }

  Future<void> remove(String key) async {
    await _box.remove(key);
  }

  bool hasData(String key) {
    return _box.hasData(key);
  }

  // Save Last Location
  Future<void> saveLastLocation(double lat, double lng) async {
    await _box.write('last_lat', lat);
    await _box.write('last_lng', lng);
  }

  Map<String, double>? getLastLocation() {
    final lat = _box.read<double>('last_lat');
    final lng = _box.read<double>('last_lng');

    if (lat != null && lng != null) {
      return {'lat': lat, 'lng': lng};
    }
    return null;
  }

  // Save Search History
  Future<void> addSearchHistory(String query) async {
    List<String> history = getSearchHistory();

    // Remove if already exists
    history.remove(query);

    // Add to beginning
    history.insert(0, query);

    // Keep only last 10
    if (history.length > 10) {
      history = history.sublist(0, 10);
    }

    await _box.write('search_history', history);
  }

  List<String> getSearchHistory() {
    final history = _box.read<List>('search_history');
    if (history != null) {
      return history.cast<String>();
    }
    return [];
  }

  Future<void> clearSearchHistory() async {
    await _box.remove('search_history');
  }
}
