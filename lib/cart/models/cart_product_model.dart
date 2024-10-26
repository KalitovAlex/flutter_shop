import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product_model.freezed.dart';
part 'cart_product_model.g.dart';

@freezed
class CartProduct with _$CartProduct {
  const factory CartProduct({
    required String uuid,
    required String title,
    required double price,
    String? date,
    @Default([]) List<String> images,
    String? place,
    String? image,
    String? category,
    required String createdAt,
    required String updatedAt,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}
