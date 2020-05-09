import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/models/medicament.dart';
import 'package:world_time_app/models/healthCenter.dart';
import 'package:world_time_app/data/fortalezaData.dart';
import 'package:world_time_app/globals.dart';
import 'package:world_time_app/components/h_app_bar.dart';

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
      filteredData = [];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: HAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: false,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
              ),
              decoration: InputDecoration(
                hintText: "Search medicine",
                hintStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white60
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(36.0)),
                ),
                filled: true,
                fillColor: MAIN_COLOR,
                contentPadding: EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0, right: 20.0),
                suffixIcon: IconButton(
                  color: Colors.white,
                  iconSize: 40,
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("Search medicine!");
                  },
                )
              ),
              onChanged: (string) {
                setState(() {
                  filteredData = string != "" ? data.where((d) => (
                      d.name.toLowerCase().contains(string.toLowerCase()))).toList() : [];
                });
              },
            ),
            Expanded(
              child: Scrollbar(

                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredData.length,
                  itemBuilder: (BuildContext context, index){
                    return GestureDetector(
                      onTap: () {
                        print(data[index].name + ' foi clicado');
                        Navigator.pushNamed(context, '/details', arguments: data[index]);
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Card(
                          margin: EdgeInsets.all(0),
                          elevation: 0,
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: MAIN_COLOR,
                              width: 2.0,
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
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
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54
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
                                    fontWeight: FontWeight.w600,
                                    color: MAIN_COLOR
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
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
