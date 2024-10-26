import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_shop/cart/service/cart_service.dart';
import 'package:flutter_shop/core/utils/image_utils.dart';
import '../../catalog/bloc/products_bloc.dart';
import '../../catalog/bloc/products_state.dart';
import '../../catalog/bloc/products_event.dart';
import '../components/product_card.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              'ПОПУЛЯРНОЕ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return state.when(
                initial: () {
                  context
                      .read<ProductsBloc>()
                      .add(const LoadRecommendedProducts());
                  return const Center(child: CircularProgressIndicator());
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (products) => CarouselSlider.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index, realIndex) {
                    final product = products[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () async {
                          try {
                            await context.read<CartService>().addItem(
                                  product.uuid,
                                  'product',
                                );
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Товар добавлен в корзину'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Ошибка при добавлении товара: $e'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        child: ProductCard(
                          imageUrl: ImageUtils.getFullImageUrl(product.image),
                          title: product.title,
                          price: '${product.price} руб.',
                          imageHeight: 200,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 350,
                    viewportFraction: 0.8,
                    padEnds: true,
                    enableInfiniteScroll: false,
                  ),
                ),
                error: (message) => Center(
                  child: Text('Ошибка: $message',
                      style: const TextStyle(color: Colors.red)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
