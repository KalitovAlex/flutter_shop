import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/product_repository.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository repository;

  ProductsBloc({required this.repository})
      : super(const ProductsState.initial()) {
    on<LoadRecommendedProducts>((event, emit) async {
      try {
        emit(const ProductsState.loading());
        final products = await repository.getRecommendedProducts();
        emit(ProductsState.loaded(products));
      } catch (e) {
        emit(ProductsState.error(e.toString()));
      }
    });

    // Add handler for LoadProducts event
    on<LoadProducts>((event, emit) async {
      try {
        emit(const ProductsState.loading());
        final products = await repository.getProducts(
          isCap: event.isCap,
          isTShirt: event.isTShirt,
          title: event.title,
          priceFrom: event.priceFrom,
          priceTo: event.priceTo,
        );
        debugPrint('Loaded ${products.length} products');
        emit(ProductsState.loaded(products));
      } catch (e) {
        debugPrint('Error loading products: $e');
        emit(ProductsState.error(e.toString()));
      }
    });
  }
}
