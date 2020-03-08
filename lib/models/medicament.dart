import 'package:world_time_app/models/healthCenter.dart';

class Medicament {
  String name;
  String typification;
  String classification;
  String dosage;
  int count;
  HealthCenter healthCenter;

  Medicament(this.name, this.typification, this.classification, this.dosage, this.count, this.healthCenter);
}

