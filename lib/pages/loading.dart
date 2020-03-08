import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1bcfb6),
      body: Center(
//        child: SpinKitFadingCube(
//          color: Colors.white,
//          size: 50.0,
//        )
        child: Image(image: AssetImage('assets/hlneg.png')),
      )
    );
  }
}

