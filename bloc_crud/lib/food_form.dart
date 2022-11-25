// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bloc_crud/bloc/food_bloc.dart';
import 'package:bloc_crud/event/food_event.dart';
import 'package:bloc_crud/model/food.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// local import
import 'package:bloc_crud/food_list_screen.dart';
import 'package:bloc_crud/food_list.dart';

class FoodForm extends StatefulWidget {
  @override
  _FoodFormState createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  late String _foodname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd7deff),
      appBar: AppBar(title: Text('Bloc Coding Food Form')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(36),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bloc Tutorial',
                style: TextStyle(fontSize: 42),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Food'),
                style: TextStyle(fontSize: 22),
                onChanged: (text) {
                  setState(() {
                    _foodname = text;
                  });
                },
              ),
              FoodList(),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'button1',
            child: Icon(Icons.save),
            // ! Onpress will add a Food event (Type add) on a BlocProvider
            onPressed: () => BlocProvider.of<FoodBloc>(context).add(
              FoodEvent.add(
                Food(_foodname),
              ),
            ),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'button2',
            child: Icon(Icons.navigate_next),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FoodListScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
