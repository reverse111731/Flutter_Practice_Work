import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_crud/event/food_event.dart';
import 'package:bloc_crud/model/food.dart';
import 'dart:async';
import 'dart:core';

import 'package:flutter_bloc/flutter_bloc.dart';

// class FoodBloc extends Bloc<FoodEvent, List<Food>> {
//   FoodBloc(List<Food> initialState) : super(initialState);

//   Stream addingFood(FoodEvent foodEvent) => emit(
//      List<Food> newState = List.from(state);
//       if (event.food != null) {
//           newState.add(event.food);
//         }
//         yield newState;
//         break;
//   );
//   Stream removingFood(FoodEvent foodEvent) => emit(state);

// }

class FoodBloc extends Bloc<FoodEvent, List<Food>> {
  FoodBloc(List<Food> initialState) : super(initialState);

  @override
  List<Food> get initialState => <Food>[];

  @override
  Stream<List<Food>> mapEventToState(FoodEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        List<Food> newState = List.from(state);
        if (event.food != null) {
          newState.add(event.food);
        }
        yield newState;
        break;
      case EventType.delete:
        List<Food> newState = List.from(state);
        newState.removeAt(event.foodIndex);
        yield newState;
        break;
      default:
        throw Exception('Event not found $event');
    }
  }
}
