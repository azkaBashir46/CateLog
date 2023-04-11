// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import 'package:catelog/pages/Model/cart.dart';
import 'package:catelog/pages/Model/item_product.dart';

class MyStore extends VxStore {
  ItemCatalogModel catalog;
  CartModel cart;

  MyStore(
    this.catalog,
    this.cart,
  ) {
    catalog = ItemCatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }

  MyStore copyWith({
    ItemCatalogModel? catalog,
    CartModel? cart,
  }) {
    return MyStore(
      catalog ?? this.catalog,
      cart ?? this.cart,
    );
  }

 
 
  @override
  String toString() => 'MyStore(catalog: $catalog, cart: $cart)';

  @override
  bool operator ==(covariant MyStore other) {
    if (identical(this, other)) return true;
  
    return 
      other.catalog == catalog &&
      other.cart == cart;
  }

  @override
  int get hashCode => catalog.hashCode ^ cart.hashCode;
}
