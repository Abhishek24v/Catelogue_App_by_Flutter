import "package:flutter/material.dart";
import "package:my_catelog_app/widgets/themes.dart";
import "package:velocity_x/velocity_x.dart";

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(MyTheme.darkBlueColor).make(),
      ),
    );
  }
}