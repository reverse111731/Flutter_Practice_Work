// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bloc_crud/bloc/food_bloc.dart';
import 'package:bloc_crud/event/food_event.dart';
import 'package:bloc_crud/model/food.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodBloc, List<Food>>(
      buildWhen: (previous, current) {
        return true;
      },
      listenWhen: (previous, current) {
        if (current.length > previous.length) {
          return true;
        }
        return false;
      },
      listener: (context, foodList) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Added!"),
          ),
        );
      },
      builder: (context, foodList) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          itemCount: foodList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(foodList[index].name.toString()),
                onTap: () => BlocProvider.of<FoodBloc>(context)
                    .add(FoodEvent.delete(index)),
              ),
            );
          },
        );
      },
    );
  }
}
