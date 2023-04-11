import 'package:catelog/core/store.dart';
import 'package:catelog/pages/Model/item_product.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog field
  late ItemCatalogModel _catalog;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  ItemCatalogModel get catalog => _catalog;

  set catalog(ItemCatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<ItemModel> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final ItemModel item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final ItemModel item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
