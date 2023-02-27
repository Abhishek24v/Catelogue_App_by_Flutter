import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import '../themes.dart';

class CatelogImage extends StatelessWidget {
  final String image;

  const CatelogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .wPCT(context: context, widthPCT: context.isMobile ? 40 : 20);
  }
}