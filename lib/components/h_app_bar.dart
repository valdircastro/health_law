import 'package:flutter/material.dart';
import 'package:world_time_app/globals.dart';

class HAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: MAIN_COLOR, //change your color here
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      title: Image.asset('assets/app_bar.png', fit: BoxFit.cover, height: 35.0),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/login');
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

//PreferredSize(
//preferredSize: Size.fromHeight(100.0),
//child: AppBar(
//automaticallyImplyLeading: false,
//backgroundColor: Colors.white,
//elevation: 0.0,
////          centerTitle: true,
//flexibleSpace: Center(child: Image.asset('assets/app_bar.png', fit: BoxFit.cover, height: 50.0,)),
//),
//);