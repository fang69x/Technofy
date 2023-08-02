import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  AddToCart({
    required Key key,
    required this.catalog,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  bool isInCart = false; // Move the isInCart variable here to retain its state
  void initState() {
    super.initState();
    // Check if the item is already in the cart when the widget initializes
    isInCart = _cart.items.contains(widget.catalog);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          setState(() {
            isInCart = true; // Update the state using setState
            final catalog = CatalogModel();

            _cart.catalog = catalog;
            _cart.add(widget.catalog);
          });
        }
      },
      // button ka colour change karne ke liye

      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).floatingActionButtonTheme.backgroundColor,
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
