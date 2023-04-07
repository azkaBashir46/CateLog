import 'package:catelog/pages/Model/item_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeDetailPage extends StatelessWidget {
  final ItemModel itemModel;

  const HomeDetailPage({super.key, required this.itemModel});
  

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        leading:InkWell(
          onTap: (){
           Navigator.pop(context);
          },
          child: const Icon(CupertinoIcons.back)
          ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(children: [
            Image.network("${itemModel.image}",
            fit:BoxFit.cover,
            width: 300,
            height: 300,),
          ]),
        ),
        
      ),
    );
  }
}