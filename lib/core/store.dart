import 'package:Technofy/models/cart.dart';
import 'package:Technofy/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel catalog;
  CartModel cart;

  MyStore()
      : catalog = CatalogModel(),
        cart = CartModel() {
    cart.catalog = catalog;
  }
}
