import 'package:Technofy/pages/homewidgets/add_to_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Technofy/models/cart.dart';
import 'package:Technofy/pages/homedetailPage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';

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
    ).color(context.cardColor).rounded.square(150).make().py12();
  }
}
