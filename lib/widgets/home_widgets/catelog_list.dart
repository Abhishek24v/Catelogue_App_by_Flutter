import 'package:flutter/material.dart';
import 'package:my_catelog_app/models/cart.dart';
import 'package:my_catelog_app/screens/detail_home_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catelog.dart';
import '../themes.dart';
import 'catelog_image.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    return VxBox(
        child: Row(
      children: [
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
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class AddToCart extends StatefulWidget {
  final Item catelog;

  const AddToCart({super.key, required this.catelog});
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        onPressed: () {
          isAdded = isAdded.toggle();
          final _catelog = CatelogModels();
          final _cart = CartModel();
          _cart.catelog = _catelog;
          _cart.add(widget.catelog);
          setState(() {});
        },
        child: isAdded ? Icon(Icons.done) : "+".text.make());
  }
}
