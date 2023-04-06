import 'package:catelog/pages/Model/item_product.dart';
import 'package:catelog/services/item_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ItemWidget extends StatefulWidget {
  
  const ItemWidget({super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}
class _ItemWidgetState extends State<ItemWidget> {
  late List <ItemModel>? itemModel=[];
  bool isLoader=false;
// var dataRespons;
// var dataObject;

  // Future apiCall ()async{
  //   http.Response response;
  //   response=await http.get(Uri.parse("https://fakestoreapi.com/products"));
  //   if(response.statusCode==200){
  //      setState(() {
  //       dataRespons=response.body;
  //      });

  //   }
  //   dataObject=json.decode(dataRespons);
  //   print('response ${dataObject[1]}');
  // }
  getData() async{
   itemModel=await ResponseServices().getProducts();
   print("fff$itemModel");
   if(itemModel!=null){
    setState(() {
      isLoader=true;
    });
   }
   else{
    throw Exception("Error");
   }
   
  }
  @override
  void initState() {
    getData();
  //  apiCall();
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(itemModel?.length);
    return  Card(
      shadowColor: Colors.white12,
      elevation: 10.0,
      child: Visibility(
          visible: isLoader,
        replacement: const Center(
        child: CircularProgressIndicator(),
        ),
          child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListView.builder(
              itemCount: itemModel?.length,
              itemBuilder:(BuildContext context, int index) {
             return  Card(
              
              elevation: 7.88,
               child: ListTile(
                
                leading: Image.network(itemModel![index].image.toString(),width: 50,),
                title:Text(
                  itemModel![index].title,
                maxLines:1
                ),
                trailing: Text(
                '\$${itemModel![index].price}',
                  // ignore: prefer_const_constructors
                  style: TextStyle(color: Colors.deepPurple,fontSize: 16,fontWeight: FontWeight.bold),),
                minVerticalPadding: 30,
                
               ),
             );
                  } ),
          ),
      ),
    );
  }
}