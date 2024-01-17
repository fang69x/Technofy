// ignore_for_file: unused_import

import 'package:Technofy/core/store.dart';
import 'package:flutter/material.dart';
import 'package:Technofy/models/cart.dart';
import 'package:Technofy/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxBuilder(
          mutations: {RemoveMutation},
          builder: (context, store, status) {
            return "\$${_cart.totalPrice}"
                .text
                .xl5
                .color(context.theme.highlightColor)
                .make();
          },
        ),
        30.widthBox,
        ElevatedButton(
            onPressed: () {
// niche se message lane ke liye we use scaffoldmessenger

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: ("Buying not supported yet")
                      .text
                      .color(context.cupertinoTheme.primaryContrastingColor)
                      .make()));
            },
            child: "Buy"
                .text
                .center
                .color(
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
                )
                .make()
                .w16(context))
      ]),
    );
  }
}

class _CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "Nothing to show"
            .text
            .xl3
            .color(context.theme.highlightColor)
            .makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) {
              if (_cart.items.length > index) {
                // Check if index is within the valid range
                return ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () => RemoveMutation(_cart.items[index]),
                  ),
                  title: _cart.items[index].name.text.make(),
                );
              } else {
                return SizedBox
                    .shrink(); // Return an empty widget if index is out of bounds
              }
            },
          );
  }
}
