import 'package:flutter/material.dart';
import 'package:world_time_app/globals.dart';
import 'package:world_time_app/components/h_app_bar.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: MAIN_COLOR
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Help Center',
          style: TextStyle(
            color: MAIN_COLOR
          ),
        )
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeathTopicCard("I can't find my medicine in search"),
              HeathTopicCard("My medication appears in search but is unavailable"),
              HeathTopicCard("I can't move to get the medicine."),
            ],
          ),
        ),
      ),
    );
  }
}

class HeathTopicCard extends StatelessWidget {

  final String topic;

  HeathTopicCard(this.topic);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Text(
          topic,
          style: TextStyle(
              fontSize: 20.0
          ),
        ),
      ),
    );
  }
}

