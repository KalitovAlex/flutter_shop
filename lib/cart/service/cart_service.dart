import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_shop/core/api/dio_client.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/cart_item_model.dart';
import '../models/cart_product_model.dart';

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  static const String _cartBox = 'cartBox';
  Box<CartItemModel>? _box;

  Future<void> init() async {
    try {
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(CartItemModelAdapter());
      }
      _box = await Hive.openBox<CartItemModel>(_cartBox);
      debugPrint('CartService: Initialized successfully');
      debugPrint('CartService: Box is open: ${_box?.isOpen}');
    } catch (e) {
      debugPrint('CartService: Error during initialization: $e');
    }
  }

  Future<void> addItem(String id, String type) async {
    try {
      debugPrint('CartService: Attempting to add item: $id, type: $type');
      
      if (_box == null || !_box!.isOpen) {
        debugPrint('CartService: Box is not initialized, initializing...');
        await init();
      }

      if (_box == null || !_box!.isOpen) {
        debugPrint('CartService: Box is still not initialized after init!');
        throw Exception('Failed to initialize cart storage');
      }

      final existingItems = _box!.values.toList();
      debugPrint('CartService: Current items in box: ${existingItems.length}');
      
      final existingItemKey = existingItems.indexWhere(
        (item) => item.id == id && item.type == type,
      );

      if (existingItemKey != -1) {
        final existingItem = _box!.getAt(existingItemKey)!;
        final newCount = existingItem.count + 1;
        debugPrint('CartService: Updating existing item count to $newCount');
        
        await _box!.putAt(
          existingItemKey,
          existingItem.copyWith(count: newCount),
        );
      } else {
        debugPrint('CartService: Adding new item');
        await _box!.add(CartItemModel(id: id, type: type));
      }

      final newItems = _box!.values.toList();
      debugPrint('CartService: New items count: ${newItems.length}');
      notifyListeners();
    } catch (e, stackTrace) {
      debugPrint('CartService: Error adding item: $e');
      debugPrint('Stack trace: $stackTrace');
      rethrow;
    }
  }

  List<CartItemModel> getItems() {
    try {
      if (_box == null || !_box!.isOpen) {
        debugPrint('CartService: Box is not initialized when getting items');
        return [];
      }
      final items = _box!.values.toList();
      debugPrint('CartService: Retrieved ${items.length} items');
      return items;
    } catch (e) {
      debugPrint('CartService: Error getting items: $e');
      return [];
    }
  }

  int getTotalCount() {
    try {
      if (_box == null || !_box!.isOpen) {
        debugPrint(
            'CartService: Box is not initialized when getting total count');
        return 0;
      }
      final count = _box!.values.fold(0, (sum, item) => sum + item.count);
      debugPrint('CartService: Total count: $count');
      return count;
    } catch (e) {
      debugPrint('CartService: Error getting total count: $e');
      return 0;
    }
  }

  Future<void> clear() async {
    try {
      if (_box == null || !_box!.isOpen) {
        await init();
      }
      await _box!.clear();
      debugPrint('CartService: Cart cleared');
      notifyListeners(); // Уведомляем слушателей об изменении
    } catch (e) {
      debugPrint('CartService: Error clearing cart: $e');
    }
  }

  Future<List<CartProduct>> fetchCartProducts() async {
    try {
      final items = getItems();
      final uuids = items.map((item) => item.id).toList();

      final response = await DioClient.instance.post('/product/uuids', data: {
        'uuids': uuids,
      });
      print(response.data);
      return (response.data as List)
          .map((json) => CartProduct.fromJson(json))
          .toList();
    } on DioException catch (e) {
      debugPrint('CartService: DioException occurred: $e');
      return [];
    }
  }

  Future<void> updateItemCount(String id, int newCount) async {
    try {
      if (_box == null || !_box!.isOpen) {
        debugPrint('CartService: Box is not initialized, initializing...');
        await init();
      }

      final existingItemKey = _box!.values.toList().indexWhere(
            (item) => item.id == id,
          );

      if (existingItemKey != -1) {
        final existingItem = _box!.getAt(existingItemKey)!;
        await _box!.putAt(
          existingItemKey,
          existingItem.copyWith(count: newCount),
        );
        debugPrint('CartService: Updated item count: $id, new count: $newCount');
        notifyListeners(); // Уведомляем слушателей об изменении
      } else {
        debugPrint('CartService: Item not found: $id');
      }
    } catch (e) {
      debugPrint('CartService: Error updating item count: $e');
      rethrow;
    }
  }

  Future<void> removeItem(String id) async {
    try {
      if (_box == null || !_box!.isOpen) {
        await init();
      }

      final existingItemKey = _box!.values.toList().indexWhere(
            (item) => item.id == id,
          );

      if (existingItemKey != -1) {
        await _box!.deleteAt(existingItemKey);
        debugPrint('CartService: Removed item: $id');
        notifyListeners();
      }
    } catch (e) {
      debugPrint('CartService: Error removing item: $e');
      rethrow;
    }
  }
}
