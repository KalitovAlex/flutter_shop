import 'package:flutter/material.dart';
import 'package:flutter_shop/home/widgets/concert_item.dart';
import 'package:flutter_shop/home/widgets/featured_product.dart';
import 'package:flutter_shop/home/widgets/merch_store_with_button.dart';
import 'package:flutter_shop/home/widgets/product_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB71C1C), // Темно-красный цвет
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: MerchStoreWithButton()),
          SliverToBoxAdapter(child: FeaturedProduct()),
          SliverToBoxAdapter(child: ConcertItem()),
          SliverToBoxAdapter(child: ProductCategories()),
        ],
      ),
    );
  }
}
