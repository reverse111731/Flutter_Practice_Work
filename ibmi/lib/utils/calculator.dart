import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';

double calculateBMI(int height, int weight) {
  return 703 * (weight / pow(height, 2));
}

//This is a mock test data from the internet or some other source
Future<double> calculateBMIAsync(Dio dio) async {
  //replace jsonKeeper
  var result = await dio.get('https://jsonkeeper.com');
  var data = result.data;
  var bmi = calculateBMI(
    data['Sergio Ramos'][0],
    data['Sergio Ramos'][1],
  );
  return bmi;
}
