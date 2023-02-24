import 'package:my_catelog_app/core/store.dart';
import 'package:my_catelog_app/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

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
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id!);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id!);
  }
}