import 'dart:convert';
import 'dart:io';

import 'package:analytics/models/ny_gender_stats.dart';
import 'package:analytics/models/ny_inpatient.dart';
import 'package:analytics/models/ny_race_stats.dart';
import 'package:analytics/models/ny_service_stats.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;


class DataSets with ChangeNotifier {

  bool loading = false;
  bool loading_complete = false;

  List<NY_Inpatient> ny_inpatient_data = [];
  NY_Gender_Stats ny_gender_stats = NY_Gender_Stats([]);
  NY_Race_Stats ny_race_stats = NY_Race_Stats([]);
  NY_Service_Stats ny_service_stats = NY_Service_Stats([]);

  Map<String, String> paths = {
    "NY_Inpatient_Data": 'data/1-NY-Inpatient-Discharges.csv',
  };

  fetch() async {
    loading = true;
    notifyListeners();
    await http.get(Uri.parse('https://r1kdtas447.execute-api.us-west-2.amazonaws.com/prod/'));

    ny_inpatient_data = await _load_ny_data(paths["NY_Inpatient_Data"]);

    ny_gender_stats = NY_Gender_Stats(ny_inpatient_data);
    ny_race_stats = NY_Race_Stats(ny_inpatient_data);
    ny_service_stats = NY_Service_Stats(ny_inpatient_data);
    loading_complete = true;
    loading = false;
    notifyListeners();
  }

}

Future<List<NY_Inpatient>> _load_ny_data(String? path) async {
  List<NY_Inpatient> data = [];
  final input = File('data/1-NY-Inpatient-Discharges.csv').openRead();
  Stream<List<dynamic>> lines = input.transform(utf8.decoder).transform(const CsvToListConverter());
  await for (var line in lines) {
    data.add(
      NY_Inpatient(
        service_area: line[0].toString(),
        age_group: line[5].toString(),
        gender: line[7].toString(),
        race: line[8].toString(),
        ethnicty: line[9].toString(),
        ailment_code: line[14].toString(),
        type_of_admission: line[19].toString(),
        treatment_description: line[21].toString(),
        treatment_category: line[26].toString(),
        payment_type: line[27].toString(),
        payment_description: line[28].toString(),
        total_charges: line[32].toString(),
        total_cost: line[33].toString(),
      ),
    );
  }
  return Future.value(data);
}

