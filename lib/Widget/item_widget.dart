import 'package:catelog/pages/Model/item_product.dart';
import 'package:catelog/pages/home_pagedetail.dart';
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
            child: GridView.builder(
              
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
                ),
              itemCount: itemModel?.length,
              itemBuilder:(BuildContext context, int index) {
             return  InkWell(
              onTap: (){
                 Navigator.push( context,
         MaterialPageRoute(builder: (context) =>  HomeDetailPage(itemModel:itemModel![index])),
  );
              },
               child: Card(
                         
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 7.88,
                 child: GridTile(
                  
                  header:Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration:const BoxDecoration(
                      color: Colors.deepPurple
                    ),
             
                    child: Text(
                      itemModel![index].title,
                      style:const TextStyle(
                        color: Colors.white,
                      ),
                    maxLines:1
                    ),
                  ),
                  
                  footer: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: const BoxDecoration(
                      color: Colors.black
                    ),
                    child: Text(
                    '\$${itemModel![index].price}',
                      // ignore: prefer_const_constructors
                      style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                  child: Hero(
                    tag:itemModel![index].id.toString() ,
                    child: Image.network(itemModel![index].image.toString(),width: 50,)),
                  
                 ),
               ),
             );
                  } ),
          ),
      ),
    );
  }
}