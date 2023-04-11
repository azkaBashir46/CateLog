import 'package:catelog/Widget/themes.dart';
import 'package:catelog/pages/cart_page.dart';
import 'package:catelog/pages/home_page.dart';
import 'package:catelog/pages/login_page.dart';
import 'package:flutter/material.dart';  
  
void main() => runApp(const MyApp());    
class MyApp extends StatelessWidget { 
  const MyApp({Key? key}) : super(key: key);
final int data=88;
  // This widget is the root of your application.  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: HomePage(),
      theme: MyTheme.lightTheme(context),
      themeMode: ThemeMode.system,
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: '/login',
      routes: 
        {
        "/login":(context)=>const LoginPage(),
        "/home":(context)=> HomePage(),
        "/cart":(context) => CartPage()
        }
      
       
      );
  }  
}  