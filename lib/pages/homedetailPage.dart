import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.catalog});
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: context.canvasColor,
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: Vx.m16,
            children: [
              "\$${catalog.price}".text.bold.xl4.red500.make(),
              ElevatedButton(
                      onPressed: () {},
                      // button ka colour change karne ke liye
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context)
                              .floatingActionButtonTheme
                              .backgroundColor,
                        ),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        ),
                      ),
                      child: "Add to cart".text.make())
                  .wh(130, 50)
            ],
          ).p16(),
        ),
        body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image),
                ).h32(context),
                Expanded(
                    child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.lg
                              .color(context.accentColor)
                              .xl4
                              .bold
                              .make(),
                          catalog.desc.text
                              .textStyle(context.captionStyle)
                              .make(),
                          10.heightBox,
                          Expanded(
                              child:
                                  " Eirmod aliquyam dolor no voluptua tempor lorem at, takimata aliquyam sed et sea aliquyam est justo sit, no elitr gubergren elitr vero. Sit est diam invidunt justo, labore diam invidunt voluptua lorem invidunt accusam gubergren lorem accusam. Dolores sed takimata rebum consetetur ut. Et duo accusam no sanctus justo eos."
                                      .text
                                      .textStyle(context.captionStyle)
                                      .make()
                                      .p16())
                        ],
                      ).py64()),
                ))
              ],
            )));
  }
}
