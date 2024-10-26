import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/home/repository/concert_repository.dart';
import 'package:flutter_shop/home/widgets/concert_item.dart';
import 'package:flutter_shop/home/widgets/featured_product.dart';
import 'package:flutter_shop/home/widgets/merch_store_with_button.dart';
import 'package:flutter_shop/home/widgets/product_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/concert_bloc.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_shop/cart/service/cart_service.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final CartService _cartService = CartService();
  int _cartItemsCount = 0;

  @override
  void initState() {
    super.initState();
    _initCart();
    // Добавляем слушатель изменений корзины
    _cartService.addListener(_updateCartCount);
  }

  Future<void> _initCart() async {
    await _cartService.init();
    _updateCartCount();
  }

  void _updateCartCount() {
    setState(() {
      _cartItemsCount = _cartService.getTotalCount();
    });
  }

  void scrollToCategories() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _cartService.removeListener(_updateCartCount);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<ConcertRepository>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.3),
        elevation: 60,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            showBadge: _cartItemsCount > 0,
            badgeContent: Text(
              _cartItemsCount.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                context.router.pushNamed('/cart');
              },
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
            onPressed: () {
              context.router.pushNamed('/profile');
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocProvider(
        create: (context) => ConcertBloc(repository),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFB71C1C),
                Colors.black,
              ],
            ),
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                  child: MerchStoreWithButton(onPressed: scrollToCategories)),
              SliverToBoxAdapter(child: FeaturedProduct()),
              SliverToBoxAdapter(child: ConcertItem()),
              SliverToBoxAdapter(child: ProductCategories()),
            ],
          ),
        ),
      ),
    );
  }
}
