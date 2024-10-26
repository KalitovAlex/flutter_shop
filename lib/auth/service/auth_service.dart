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
      await init();
    }

    try {
      // Удаляем конкретный ключ
      await _box?.delete(_refreshTokenKey);
      // Для надежности очищаем весь бокс
      await _box?.clear();
      debugPrint('Auth data cleared successfully');
      
      // Проверяем, что токен действительно удален
      final checkToken = _box?.get(_refreshTokenKey);
      debugPrint('Verification - Refresh token after clearing: $checkToken');
    } catch (e) {
      debugPrint('Error while clearing auth data: $e');
      throw Exception('Ошибка при очистке данных авторизации');
    }
  }

  bool get isInitialized => _box != null && _box!.isOpen;
}
