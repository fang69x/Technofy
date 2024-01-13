import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universe7/models/cart.dart';
import 'package:universe7/pages/homedetailPage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widgets/themes.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                          catalog: catalog,
                        ))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(
              catalog.image,
              height: 100, // Set an appropriate height for the image
              width: 100, // Set an appropriate width for the image
            ).box.p12.color(context.canvasColor).make().p12(),
          ),
          Expanded(
              child: Column(
            children: [
              catalog.name.text.lg.color(context.accentColor).xl.bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mH4,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(
                    catalog: catalog,
                    key: UniqueKey(),
                  )
                ],
              )

              // Add other widgets as needed
            ],
          ).pOnly(right: 8.0)),
        ],
      ),
    ).color(context.cardColor).roundedSM.square(150).make().py12();
  }
}

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    required Key key,
    required this.catalog,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        isInCart = isInCart.toggle();
        if (isInCart) {
          final catalog = CatalogModel();
          _cart.catalog = catalog;
          _cart.add(widget.catalog);
          setState(() {});
        }
      },
      // button ka colour change karne ke liye

      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).floatingActionButtonTheme.backgroundColor,
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
