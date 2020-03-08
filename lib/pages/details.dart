import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time_app/models/medicament.dart';
import 'package:maps_launcher/maps_launcher.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {

    final Medicament args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1bcfb6),
        title: Text('Detalhes'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new DataRow('Nome', args.name),
            new DataRow('Tipo', args.typification),
            new DataRow('Classificação', args.classification),
            new DataRow('Quantidade em estoque', '${args.count} unidades'),
            SizedBox(height: 24),
            new DataRow('Encontrado em', args.healthCenter.name),
            new DataRow('Localizado em', args.healthCenter.adress),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 24),
                  RaisedButton(
                    color: Color(0xFF1bcfb6),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Ver localização',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                    ),
                    elevation: 0,
                    onPressed: () {
                      MapsLauncher.launchQuery(args.healthCenter.adress);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
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
        Text(
          header,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1bcfb6)
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF2b2d2d)
          ),
        ),
      ],
    );
  }
}

