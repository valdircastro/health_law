import 'package:flutter/material.dart';
import 'package:flutter_search_panel/search_item.dart';
import 'package:world_time_app/models/medicament.dart';
import 'package:world_time_app/models/healthCenter.dart';
import 'package:world_time_app/data/fortalezaData.dart';
import 'package:search_widget/search_widget.dart';
import 'package:flutter_search_panel/flutter_search_panel.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  var data = fortaleza;
  List<Medicament> filteredData = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      filteredData = data;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1bcfb6),
        title: Text('Pesquisa de medicamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (string) {
                  setState(() {
                    filteredData = data.where((d) => (
                    d.name.toLowerCase().contains(string.toLowerCase()))).toList();
                  });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                hintText: "Pesquise aqui seu medicamento"
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: filteredData.length,
                itemBuilder: (BuildContext context, index){
                  return GestureDetector(
                    onTap: () {
                      print(data[index].name + ' foi clicado');
                      Navigator.pushNamed(context, '/details', arguments: data[index]);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  filteredData[index].name + " " + filteredData[index].dosage,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1bcfb6),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(filteredData[index].healthCenter.name),
                                SizedBox(height: 8),
                                Text('${filteredData[index].count} unidades')
                              ],
                            ),
                            Text(
                              '${filteredData[index].healthCenter.distance} Km',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.pushNamed(context, '/questions');
        },
        child: Icon(Icons.help),
        backgroundColor: Color(0xFF1bcfb6),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, this.focusNode);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
      ),
    );
  }
}
