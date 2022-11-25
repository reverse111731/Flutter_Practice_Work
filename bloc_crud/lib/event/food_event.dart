import 'package:bloc_crud/model/food.dart';

// ! Event that will happen
enum EventType {
  add,
  delete,
}

// ! things that the event will need
class FoodEvent {
  late Food food;
  late int foodIndex;
  late EventType eventType;

  // ! Named constructor for adding food
  FoodEvent.add(Food food) {
    this.eventType = EventType.add;
    this.food = food;
  }

  // ! Named constructor for deleting food
  FoodEvent.delete(int index) {
    this.eventType = EventType.delete;
    this.foodIndex = index;
  }
}
