import 'package:hc_weather/services/index.dart';

const apikey = '79606421b40eac4780d23b69202b4a56';
const baseUrl = 'http://api.openweathermap.org/data/2.5/group';
const baseUrl2 = 'http://api.openweathermap.org/data/2.5/weather';
const celcius = '&units=metric';

class Weather {
  Future<List<dynamic>> getweatherList(String id) async {
    Network network = Network('$baseUrl?id=$id&appid=$apikey$celcius');

//$openMapUrl?id=$weatherID1&appid=$apikey&$celcius

    var weatherData = await network.getData();

//print(weatherData['list']);

    return weatherData['list'];
  }

  Future<dynamic> getSpecificWeatherData(String id) async {
    Network network = Network('$baseUrl2?id=$id&appid=$apikey$celcius');

    var specificWeatherData = await network.getData();

    return specificWeatherData;
  }

  int getColor(dynamic rTemp) {
    int temp = rTemp.toInt();

    if (temp <= 0) {
//return "1976D2"; //0xFF1976D2

      return 0xFF1976D2;
    } else if (0 > temp || temp <= 15) {
//return '26C6DA'; //0xFF26C6DA

      return 0xFF26C6DA;
    } else if (15 > temp || temp <= 30) {
//return '66BB6A'; //0xFF66BB6A

      return 0xFF66BB6A;
    } else if (temp > 30) {
//return 'FF7043'; //0xFFFF7043

      return 0xFFFF7043;
    } else {
      return 0xFFFFFFFF;
    }
  }
}
