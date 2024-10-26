import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImageUtils {
  static String getFullImageUrl(String imageUrl) {
    final baseUrl = dotenv.env['API_URL'] ?? '';
    return '$baseUrl/object-storage/$imageUrl';
  }
}
