import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/core/api/dio_client.dart';
import '../models/product_model.dart';

class ProductRepository {
  Future<List<Product>> getProducts({
    bool? isCap,
    bool? isTShirt,
    String? title,
    int? priceFrom,
    int? priceTo,
  }) async {
    try {
      final response = await DioClient.instance.post(
        '/product',
        data: {
          'isCap': isCap,
          'isTShirt': isTShirt,
          if (title?.isNotEmpty == true) 'title': title,
          if (priceFrom != null) 'priceFrom': priceFrom,
          if (priceTo != null) 'priceTo': priceTo,
        },
      );

      final List<dynamic> jsonList = response.data;
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<List<Product>> getRecommendedProducts() async {
    try {
      final response = await DioClient.instance.get('/product/recommend');
      debugPrint('Recommended products response: ${response.data}');

      final products = (response.data as List)
          .map((json) => Product.fromJson(json))
          .toList();

      debugPrint('Parsed ${products.length} recommended products');
      return products;
    } catch (e) {
      debugPrint('Error fetching recommended products: $e');
      rethrow;
    }
  }
}
