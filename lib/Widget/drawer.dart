import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
          backgroundColor: Colors.deepPurple,
          child:  ListView(
            children: const [
               UserAccountsDrawerHeader(
                 accountName:  Text("Azka"), 
                 accountEmail:  Text("azkabashir90@gmail.com"),
                 currentAccountPicture:CircleAvatar(
                    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_VUm5lYPrphAIKX8khCohf4dPidYEWXJHRw&usqp=CAU")
                   // Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_VUm5lYPrphAIKX8khCohf4dPidYEWXJHRw&usqp=CAU")
                   ) 
                 ),
                ListTile(
                  leading: Icon(CupertinoIcons.home,color: Colors.white),
                  title: Text("Home",style: TextStyle(color:  Colors.white)),
                ),
                 ListTile(
                  leading: Icon(CupertinoIcons.profile_circled,color: Colors.white),

                  title: Text("Profile",style: TextStyle(color:  Colors.white),),
                ),
                 ListTile(
                  leading: Icon(CupertinoIcons.exclamationmark_bubble_fill,color: Colors.white),

                  title: Text("Email me",style: TextStyle(color:  Colors.white)),

                )
            ],
          ),

        );
  }
}