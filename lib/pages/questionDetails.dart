import 'package:flutter/material.dart';
import 'package:world_time_app/globals.dart';
import 'package:world_time_app/components/h_app_bar.dart';

class QuestionDetails extends StatefulWidget {
  @override
  _QuestionDetailsState createState() => _QuestionDetailsState();
}

class _QuestionDetailsState extends State<QuestionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(),
    );
  }
}
