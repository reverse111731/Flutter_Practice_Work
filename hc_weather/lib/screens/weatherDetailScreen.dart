import 'package:flutter/material.dart';

import 'package:hc_weather/services/index.dart';

class WeatherDetailScreen extends StatefulWidget {
  String id;
  bool? favorite;

  WeatherDetailScreen({Key? key, required this.id, required this.favorite})
      : super(key: key);

  @override
  _WeatherDetailScreenState createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  late String cityName, condition;
  //bool isToggle = false;
  late double hTemp, lTemp, cTemp;
  late dynamic data;

  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> getWeatherInfo() async {
    Weather weatherModel = Weather();
    //place delay

    var specificWeatherDetail =
        await weatherModel.getSpecificWeatherData(widget.id);

    //print(specificWeatherDetail['name']);

    return specificWeatherDetail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Forecast"),
      ),
      body: FutureBuilder(
        future: getWeatherInfo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text(" ${snapshot.data['name']} "),
                      const SizedBox(
                        width: 150,
                      ),
                      IconButton(
                          icon: Icon(widget.favorite == false ||
                                  widget.favorite == null
                              ? Icons.favorite_border
                              : Icons.favorite),
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              if (widget.favorite == false) {
                                widget.favorite = true;
                              }
                              // else if (widget.favorite == null) {
                              //   widget.favorite = false;
                              // }
                              else {
                                widget.favorite = false;
                              }
                            });

                            Navigator.pop(context, widget.favorite);
                            //print(isToggle);
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        " ${snapshot.data['main']['temp']} \u2103 ",
                        style: TextStyle(fontSize: 50, color: Colors.grey),
                      ),
                      Flexible(
                        child: Text(
                            " ${snapshot.data['weather'][0]['main']} \n ${snapshot.data['main']['temp_max']} \u2103 / ${snapshot.data['main']['temp_min']} \u2103 "),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        },
      ),
    );
  }
}
