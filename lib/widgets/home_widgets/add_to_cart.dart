import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catelog.dart';

class AddToCart extends StatelessWidget {
  final Item catelog;

 AddToCart({super.key, required this.catelog});

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items?.contains(catelog) ?? false;
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
            _cart.add(catelog);
          }
        },
        child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}