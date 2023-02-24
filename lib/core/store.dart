import 'package:my_catelog_app/models/cart.dart';
import 'package:my_catelog_app/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatelogModels catelog = CatelogModels();
  CartModel cart = CartModel();

  MyStore() {
    cart.catelog = catelog;
  }
}
