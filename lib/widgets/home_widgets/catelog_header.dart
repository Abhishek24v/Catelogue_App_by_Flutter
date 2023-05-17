import 'package:flutter/cupertino.dart';
import 'package:my_catelog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        "Catelog App".text.xl5.bold.color(context.theme.canvasColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}