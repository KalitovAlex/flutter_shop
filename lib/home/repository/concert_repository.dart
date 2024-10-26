import 'package:dio/dio.dart';
import '../models/concert_model.dart';

class ConcertRepository {
  final Dio _dio;

  ConcertRepository(this._dio);

  Future<List<ConcertModel>> getConcerts() async {
    try {
      final response = await _dio.get('/concert');
      return (response.data as List)
          .map((json) => ConcertModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch concerts: $e');
    }
  }
}
