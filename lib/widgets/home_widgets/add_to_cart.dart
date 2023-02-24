import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catelog.dart';

class AddToCart extends StatefulWidget {
  final Item catelog;

  const AddToCart({super.key, required this.catelog});
  @override
  State<AddToCart> createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items?.contains(widget.catelog) ?? false;
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catelog = CatelogModels();
            _cart.catelog = _catelog;
            _cart.add(widget.catelog);
            setState(() {});
          }
        },
        child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}