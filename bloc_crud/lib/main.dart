// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bloc_crud/bloc/food_bloc.dart';
import 'package:bloc_crud/bloc/food_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//local import
import 'package:bloc_crud/food_form.dart';

void main() {
  // BlocOverrides.runZoned(
  //   () {
  //     // Use cubits...
  //   },
  //   blocObserver: FoodBlocObserver(),
  // );
  runApp(const MyApp());
}

// void main() {
//   BlocSupervisor.delegate = FoodBlocDelegate();
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodBloc>(
      create: (context) => FoodBloc([]),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Bloc coding",
        home: FoodForm(),
      ),
    );
  }
}
