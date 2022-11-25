// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_crud/food_list.dart';

//local import
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc coding Food List')),
      body: FoodList(),
    );
  }
}
