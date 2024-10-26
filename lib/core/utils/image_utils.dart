import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImageUtils {
  static String getFullImageUrl(String imageUrl) {
    final baseUrl = dotenv.env['API_URL'] ?? '';
    final decodedUrl = Uri.encodeComponent(imageUrl);
    return '$baseUrl/object-storage/$decodedUrl';
  }
}
