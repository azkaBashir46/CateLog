import 'package:catelog/pages/Model/item_product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ResponseServices{
  Future<List<ItemModel>?> getProducts () async {
    List<ItemModel>? itemProductList=[];
    var client=http.Client();
    var url=Uri.parse('https://fakestoreapi.com/products');
    var response=await client.get(url);
    if(response.statusCode==200){
      var jsont=jsonDecode(response.body);
     itemProductList=List.from(jsont).map((item) => ItemModel.fromMap(item)).toList();
      return itemProductList;
    }

  }
}

