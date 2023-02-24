import 'package:my_catelog_app/models/catelog.dart';

class CartModel {
  //catelog field
  late CatelogModels _catelog;

//collection of Id's => store Id of each items
  final List<String> _itemIds = [];

  CatelogModels get catelog => _catelog;

  set catelog(CatelogModels newCatelog) {
    assert(newCatelog != null);
    _catelog = newCatelog;
  }

  List<Item> get items => _itemIds.map((id) => _catelog.getItem(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, currentValue) => total + currentValue.price!);

  //add items
  void add(Item item) {
    _itemIds.add(item.id!);
  }

  //remove items
  void remove(Item item) {
    _itemIds.remove(item.id!);
  }
}
