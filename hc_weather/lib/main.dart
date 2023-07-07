import 'package:flutter/material.dart';
import 'package:hc_weather/screens/index.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
            //bodyText1: TextStyle(color: Colors.black),
            ),
      ),
      home: loadingScreen(),
    );
  }
}
