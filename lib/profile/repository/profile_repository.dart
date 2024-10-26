import 'package:dio/dio.dart';
import 'package:flutter_shop/core/api/dio_client.dart';

class ProfileRepository {
  final Dio _dio = DioClient.instance;

  Future<void> updateProfile({
    required String email,
    required String password,
  }) async {
    try {
      await _dio.put(
        '/user',
        data: {
          'email': email,
          'password': password,
        },
      );
    } on DioException catch (e) {
      throw Exception(
          e.response?.data['message'] ?? 'Failed to update profile');
    }
  }
}
