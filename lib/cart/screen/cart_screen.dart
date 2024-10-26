import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/models/cart_item_model.dart';
import 'package:flutter_shop/cart/models/cart_product_model.dart';
import 'package:flutter_shop/cart/service/cart_service.dart';
import 'package:flutter_shop/core/utils/image_utils.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartService = CartService();
  List<CartProduct> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    setState(() => _isLoading = true);
    try {
      final products = await _cartService.fetchCartProducts();
      final items = _cartService.getItems();

      // Оставляем только те продукты, которые есть в корзине
      _products = products.where((product) {
        return items.any((item) => item.id == product.uuid);
      }).toList();

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error loading cart items: $e');
      setState(() => _isLoading = false);
    }
  }

  double get _totalSum {
    return _products.fold(0, (sum, product) {
      final cartItem = _cartService.getItems().firstWhere(
            (item) => item.id == product.uuid,
            orElse: () => CartItemModel(id: product.uuid, type: ''),
          );
      return sum + (product.price * cartItem.count);
    });
  }

  Future<void> _handleOrder() async {
    await _cartService.clear();
    setState(() {});

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Заказ успешно оформлен!'),
        backgroundColor: Color(0xFFB71C1C),
        duration: Duration(seconds: 2),
      ),
    );

    context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    final items = _cartService.getItems();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => context.router.pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ЗАКАЗ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '(${items.length})',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          if (items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.black),
              onPressed: () async {
                await _cartService.clear();
                setState(() {});
              },
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: items.isEmpty
                      ? Center(
                          child: Text(
                            'Корзина пока пуста',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 16,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _products.length,
                          itemBuilder: (context, index) {
                            final product = _products[index];
                            final cartItem = items.firstWhere(
                              (item) => item.id == product.uuid,
                              orElse: () =>
                                  CartItemModel(id: product.uuid, type: ''),
                            );

                            // Если товар не найден в корзине, пропускаем его
                            if (cartItem.id.isEmpty) {
                              return const SizedBox.shrink();
                            }

                            final bool isConcert = product.date != null;

                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      ImageUtils.getFullImageUrl(isConcert
                                          ? product.images.first
                                          : product.image!),
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.title,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        if (isConcert) ...[
                                          Text(
                                            'Место: ${product.place}',
                                            style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                            ),
                                          ),
                                          Text(
                                            'Дата: ${product.date}',
                                            style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                            ),
                                          ),
                                        ] else if (product.category !=
                                            null) ...[
                                          Text(
                                            'Категория: ${product.category}',
                                            style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.remove),
                                              onPressed: () {
                                                if (cartItem.count <= 1) {
                                                  _cartService
                                                      .removeItem(cartItem.id);
                                                } else {
                                                  _cartService.updateItemCount(
                                                    cartItem.id,
                                                    cartItem.count - 1,
                                                  );
                                                }
                                                setState(() {});
                                              },
                                            ),
                                            Text(
                                              '${cartItem.count}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.add),
                                              onPressed: () {
                                                _cartService.updateItemCount(
                                                  cartItem.id,
                                                  cartItem.count + 1,
                                                );
                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '${(product.price * cartItem.count).toInt()} РУБ.',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
                if (items.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'СУММА',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${_totalSum.toInt()} РУБ',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _handleOrder,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFB71C1C),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'ЗАКАЗАТЬ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
