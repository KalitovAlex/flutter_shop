import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String uuid,
    required String title,
    required int price,
    required String image,
    required String category,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
