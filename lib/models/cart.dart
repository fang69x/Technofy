import 'package:universe7/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel.internal();
  CartModel.internal();
  factory CartModel() => cartModel;
  CatalogModel? catalog;
  final List<int> itemIds = [];

// get items in the cart
  List<Item> get items => itemIds.map((id) => catalog!.getById(id)).toList();
// get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
// ADD items
  void add(Item item) {
    itemIds.add(item.id);
  }

// Remove Item
  void remove(Item item) {
    itemIds.remove(item.id);
  }
}
