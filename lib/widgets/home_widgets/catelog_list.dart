import 'package:flutter/material.dart';
import 'package:my_catelog_app/screens/detail_home_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catelog.dart';
import 'add_to_cart.dart';
import 'catelog_image.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({super.key});

  @override
  Widget build(BuildContext context) {
    return !context.isMobile ? 
    GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20),
        shrinkWrap: true,
        itemCount: CatelogModels.items!.length,
        itemBuilder: (context, index) {
          final catelog = CatelogModels.items![index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catelog: catelog))),
              child: CatelogItem(catelog: catelog));
        }) : ListView.builder(
        shrinkWrap: true,
        itemCount: CatelogModels.items!.length,
        itemBuilder: (context, index) {
          final catelog = CatelogModels.items![index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catelog: catelog))),
              child: CatelogItem(catelog: catelog));
        });
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({super.key, required this.catelog})
      : assert(catelog != null);
  @override
  Widget build(BuildContext context) {
    var children2 = [
        Hero(
          tag: Key(catelog.id.toString()),
          child: CatelogImage(
            image: catelog.image!,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catelog.name!.text.lg.color(context.accentColor).bold.make(),
            catelog.des!.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catelog.price!}".text.bold.xl.make(),
                AddToCart(catelog: catelog)
              ],
            ).pOnly(right: 8.0)
          ],
        ).p(context.isMobile ? 0 : 16)
        )
      ];
    return VxBox(
        child: context.isMobile ? Row(
       children : children2,
    ) : Column(
        children : children2,
    )
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

