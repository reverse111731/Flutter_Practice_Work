import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hc_weather/screens/index.dart';
import 'package:hc_weather/services/index.dart';

class loadingScreen extends StatefulWidget {
  @override
  _loadingScreenState createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  String id =
      '1701668,3067696,1835848,1698839'; //1701668,3067696,1835848,1698839,1716192

  void getWeatherList() async {
    Weather weatherModel = Weather();

    var weatherList = await weatherModel.getweatherList(id);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return WeatherListScreen(
          rlist: weatherList,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    getWeatherList();

    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black,
          size: 100.0,
        ),
      ),
    );
  }
}
