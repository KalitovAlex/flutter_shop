import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_shop/auth/models/auth_model.dart';
import 'package:flutter_shop/auth/service/auth_service.dart';
import 'package:flutter_shop/core/storage/auth_storage.dart';
import 'package:flutter_shop/core/api/dio_client.dart';

class AuthRepository {
  final Dio _dio;
  final AuthService _authService;
  final AuthStorage _storage;

  AuthRepository({AuthService? authService})
      : _authService = authService ?? AuthService(),
        _storage = AuthStorage(),
        _dio = DioClient.instance;

  Future<String?> signIn(AuthRequest request) async {
    try {
      final response = await _dio.post(
        '/auth/signin',
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final authResponse = AuthResponse.fromJson(response.data);
        await _authService.saveRefreshToken(authResponse.refreshToken);
        _storage.accessToken = authResponse.accessToken;
        _storage.currentUser = authResponse.user;
        return authResponse.accessToken;
      }
      return null;
    } on DioException catch (e) {
      debugPrint('DioException during signin: ${e.message}');
      if (e.response != null) {
        throw Exception(
            'Ошибка сервера: ${e.response?.data['message'] ?? e.message}');
      } else {
        throw Exception('Ошибка сети: ${e.message}');
      }
    } catch (e) {
      debugPrint('General exception during signin: $e');
      throw Exception('Произошла ошибка: $e');
    }
  }

  Future<bool> refresh() async {
    try {
      if (!_authService.isInitialized) {
        await _authService.init();
      }

      final refreshToken = _authService.getRefreshToken();
      debugPrint('Refresh token from storage: $refreshToken');

      if (refreshToken == null) {
        debugPrint('No refresh token found');
        return false;
      }

      final response = await _dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      debugPrint('Refresh response: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final refreshResponse = RefreshResponse.fromJson(response.data);
        _storage.accessToken = refreshResponse.accessToken;
        _storage.currentUser = refreshResponse.user;
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Refresh error: $e');
      if (e.toString().contains('401')) {
        await _authService.clearAuth();
      }
      return false;
    }
  }

  bool isAuthenticated() {
    return _storage.accessToken != null && _storage.currentUser != null;
  }

  Future<void> logout() async {
    try {
      await _authService.clearAuth();
      _storage.accessToken = null;
      _storage.currentUser = null;
    } catch (e) {
      debugPrint('Error during logout: $e');
      throw Exception('Ошибка при выходе из системы');
    }
  }

  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      final response = await _dio.post(
        '/auth/signup',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response.data['accessToken'];
    } catch (e) {
      throw Exception('Ошибка при регистрации');
    }
  }
}
