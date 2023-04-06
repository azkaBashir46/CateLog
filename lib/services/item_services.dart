import 'package:catelog/pages/Model/item_product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ResponseServices{
  Future<List<ItemModel>?> getProducts () async {
    List<ItemModel>? itemProductList=[];
        print('kkskds');

    var client=http.Client();
    var url=Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response=await client.get(url);
    if(response.statusCode==200){
      var jsont=jsonDecode(response.body);
      // itemProductList.add(jsont);
      // print(itemProductList);
     itemProductList=List.from(jsont).map((item) => ItemModel.fromMap(item)).toList();


      // var jsont=json.decode(response.body);
      // for(var val in jsont){

      //   itemProductList.add(jsont[jsont.indexOf(val)]);
      // }
      //   print('kkskds$itemProductList');
      
    
  // for( Map<String, dynamic> val in jsont){
  //     itemProductList.add(ItemModel.fromJson(val));
  // }
    // print(itemProductList[0]?.userId);

      // var jsont=response.body;
      // print(jsont);
      return itemProductList;
    
      
    }

  }
}

