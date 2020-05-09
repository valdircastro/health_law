import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time_app/models/medicament.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:world_time_app/globals.dart';
import 'package:world_time_app/components/h_app_bar.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final Medicament args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: HAppBar(),
        body: Scrollbar(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 40),
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      '${args.name} - ${args.dosage}',
                      style:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    decoration: BoxDecoration(
                        color: MAIN_COLOR,
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  ),
                ),
                DataRow("Typification", args.typification),
                DataRow("Classification", args.classification),
                DataRow("Localization", args.healthCenter.name),
                DataRow("Adress", args.healthCenter.adress),
                DataRow("Disponibility","${args.count} units"),
                DataRow("Distance","${args.healthCenter.distance}"),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Color(0xFF1bcfb6),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'See on map',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    elevation: 0,
                    onPressed: () {
                      MapsLauncher.launchQuery(args.healthCenter.adress);
                    },
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}

class DataRow extends StatelessWidget {
  final String header;
  final String value;

  DataRow(this.header, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text(
            header,
            style: TextStyle(fontWeight: FontWeight.w600, color: MAIN_COLOR),
          ),
          decoration: BoxDecoration(
              border: Border.all(color: MAIN_COLOR, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF2b2d2d)),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
