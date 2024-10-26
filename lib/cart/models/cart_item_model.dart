import 'package:hive/hive.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 1)
class CartItemModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String type;

  @HiveField(2)
  final int count;

  CartItemModel({
    required this.id,
    required this.type,
    this.count = 1,
  });

  CartItemModel copyWith({
    String? id,
    String? type,
    int? count,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      type: type ?? this.type,
      count: count ?? this.count,
    );
  }
}
