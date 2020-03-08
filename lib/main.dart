import 'package:flutter/material.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/login.dart';
import 'package:world_time_app/pages/questions.dart';
import 'package:world_time_app/pages/search.dart';
import 'package:world_time_app/pages/map.dart';
import 'package:world_time_app/pages/details.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Mon'),
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/search': (context) => Search(),
      '/map': (context) => Map(),
      '/login' : (context) => Login(),
      '/details' : (context) => Details(),
      '/questions': (context) => Questions()
    }
));

