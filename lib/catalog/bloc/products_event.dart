import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_event.freezed.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.loadProducts({
    required bool isCap,
    required bool isTShirt,
    String? title,
    int? priceFrom,
    int? priceTo,
  }) = LoadProducts;
  
  const factory ProductsEvent.loadRecommendedProducts() = LoadRecommendedProducts;
}
