import "package:flutter/material.dart";
import "package:my_catelog_app/widgets/themes.dart";
import "package:velocity_x/velocity_x.dart";

import "../models/catelog.dart";

class HomeDetailPage extends StatelessWidget {
  final Item catelog;

  const HomeDetailPage({super.key, required this.catelog});

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
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catelog.price!}".text.bold.red800.xl4.make(),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(context.theme.buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {},
                    child: "Add to cart".text.make()).wh(120, 50)
              ],
            ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catelog.id.toString()),
                child: Image.network(catelog.image!)).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catelog.name!.text.xl4.color(context.accentColor).bold.make(),
                      catelog.des!.text.textStyle(context.captionStyle).xl.make(),
                      "The iPhone is a line of smartphones produced by Apple Inc. which uses Apple's own iOS mobile operating system. The first-generation iPhone was announced by then-Apple CEO Steve Jobs on January 9, 2007. Since then, Apple has annually released new iPhone models and iOS updates."
                      .text.textStyle(context.captionStyle).make().p16()
                    ],
                  ).py64(),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
