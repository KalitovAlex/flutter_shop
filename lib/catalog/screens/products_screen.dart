import 'package:flutter/material.dart';
import 'package:flutter_shop/core/utils/image_utils.dart';
import '../repository/product_repository.dart';
import '../models/product_model.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class ProductsScreen extends StatefulWidget {
  final bool isCap;
  final bool isTShirt;
  final String categoryTitle;

  const ProductsScreen({
    super.key,
    required this.isCap,
    required this.isTShirt,
    required this.categoryTitle,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductRepository _repository = ProductRepository();
  late Future<List<Product>> _productsFuture;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  // Add these fields
  final _searchSubject = BehaviorSubject<String>();
  final _minPriceSubject = BehaviorSubject<String>();
  final _maxPriceSubject = BehaviorSubject<String>();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _setupSearchListeners();
    _loadProducts();
  }

  void _setupSearchListeners() {
    // Combine all three streams
    CombineLatestStream.combine3(
      _searchSubject.debounceTime(const Duration(milliseconds: 500)),
      _minPriceSubject.debounceTime(const Duration(milliseconds: 500)),
      _maxPriceSubject.debounceTime(const Duration(milliseconds: 500)),
      (String search, String minPrice, String maxPrice) => {
        'search': search,
        'minPrice': minPrice,
        'maxPrice': maxPrice,
      },
    ).listen((values) {
      _loadProducts(
        title: values['search'],
        priceFrom: int.tryParse(values['minPrice'] ?? ''),
        priceTo: int.tryParse(values['maxPrice'] ?? ''),
      );
    });

    _searchSubject.add('');
    _minPriceSubject.add('');
    _maxPriceSubject.add('');

    _searchController.addListener(() {
      _searchSubject.add(_searchController.text);
    });

    _minPriceController.addListener(() {
      _minPriceSubject.add(_minPriceController.text);
    });

    _maxPriceController.addListener(() {
      _maxPriceSubject.add(_maxPriceController.text);
    });
  }

  void _loadProducts({String? title, int? priceFrom, int? priceTo}) {
    setState(() {
      _productsFuture = _repository.getProducts(
        isCap: widget.isCap,
        isTShirt: widget.isTShirt,
        title: title,
        priceFrom: priceFrom,
        priceTo: priceTo,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Найти.....',
                          prefixIcon: const Icon(Icons.search),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: _minPriceController,
                        decoration: InputDecoration(
                          hintText: 'Цена от',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: _maxPriceController,
                        decoration: InputDecoration(
                          hintText: 'Цена до',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: _productsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  final products = snapshot.data!;
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          0.7, // Adjusted aspect ratio for better card stretching
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return _buildProductCard(product);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                ImageUtils.getFullImageUrl(product.image),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '₽${product.price}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Товар добавлен в корзину')),
                      );
                    },
                    child: Center(child: Text('в корзину')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    _searchSubject.close();
    _minPriceSubject.close();
    _maxPriceSubject.close();
    _debounceTimer?.cancel();
    super.dispose();
  }
}
