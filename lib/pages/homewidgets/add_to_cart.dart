import 'package:Technofy/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    required Key key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          AddMutation(catalog);
          // setState(() {});
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
