import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_shop/core/storage/auth_storage.dart';

class DioClient {
  static Dio? _instance;

  static Dio get instance {
    if (_instance == null) {
      _instance = Dio(
        BaseOptions(
          baseUrl: dotenv.env['API_URL']!,
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      _instance!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            final token = AuthStorage().accessToken;
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            return handler.next(options);
          },
        ),
      );
    }
    return _instance!;
  }
}
