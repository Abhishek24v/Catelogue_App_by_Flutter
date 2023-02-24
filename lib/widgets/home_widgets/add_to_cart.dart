import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_catelog_app/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catelog.dart';

class AddToCart extends StatelessWidget {
  final Item catelog;

  AddToCart({super.key, required this.catelog});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    
    bool isInCart = _cart.items?.contains(catelog) ?? false;
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        onPressed: () {
          if (!isInCart) {
            AddMutation(catelog);
          }
        },
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
