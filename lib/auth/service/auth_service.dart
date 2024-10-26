import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthService {
  static const String _tokenBox = 'tokenBox';
  static const String _refreshTokenKey = 'refreshToken';
  Box<String>? _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox<String>(_tokenBox);
    debugPrint('Hive initialized. Box is open: ${_box?.isOpen}');
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    if (_box == null || !_box!.isOpen) {
      debugPrint('Box is not initialized. Initializing...');
      await init();
    }

    await _box!.put(_refreshTokenKey, refreshToken);
    final savedToken = _box!.get(_refreshTokenKey);
    debugPrint('Saved refresh token: $refreshToken');
    debugPrint('Verification - Read saved token: $savedToken');
  }

  String? getRefreshToken() {
    if (_box == null || !_box!.isOpen) {
      debugPrint('Box is not initialized when getting token');
      return null;
    }

    final token = _box!.get(_refreshTokenKey);
    debugPrint('Retrieved refresh token: $token');
    return token;
  }

  Future<void> clearAuth() async {
    if (_box == null || !_box!.isOpen) {
      debugPrint('Box is not initialized when clearing');
      return;
    }

    await _box!.clear();
    debugPrint('Cleared auth data');
  }

  bool get isInitialized => _box != null && _box!.isOpen;
}
