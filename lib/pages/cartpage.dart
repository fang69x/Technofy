import 'package:flutter/material.dart';
import 'package:universe7/models/cart.dart';
import 'package:universe7/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.xl2.make(),
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
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        "\$${_cart.totalPrice}".text.xl5.color(context.accentColor).make(),
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

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}
