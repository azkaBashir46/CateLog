import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
final  int data=88;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text("Catelog") ,
      ),
      body: Center(
          child: Text("Test for $data App"),
        ),
        drawer: const Drawer(),
    );
  }
}