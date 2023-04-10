import 'package:catelog/Widget/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:catelog/Widget/drawer.dart';
class HomePage extends StatelessWidget{
   HomePage({super.key});
   
final  List<dynamic> data=[{"id":1,"name":"usama","age":33}];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text("Catelog") ,
      ),
      body:const ItemWidget(),
        drawer:  const DrawerWidget()
    );
  }
}