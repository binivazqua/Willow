import 'package:bejoy/design/colors/palette.dart';
import 'package:flutter/material.dart';

class Meal extends ChangeNotifier {
  // list of equivalents:
  final List _meals = [
    //['name', 'description', 'icon', 'color'],
    [
      "Breakfast",
      "left today",
      "lib/design/images/foodlog/meals/taza_de_cafe.png",
      green
    ],

    [
      "Lunch",
      "left today",
      "lib/design/images/foodlog/meals/sopa.png",
      lightTurquoise
    ],

    [
      "Dinner",
      "left today",
      "lib/design/images/foodlog/meals/escudella.png",
      Colors.purple[400]
    ],

    [
      "Snack",
      "left today",
      "lib/design/images/foodlog/meals/tiempo.png",
      turquoise,
    ],

    [
      "Meal out",
      "left today",
      "lib/design/images/foodlog/meals/terraza.png",
      Colors.purple[200]
    ],
  ];

  List _mealTimeItems = [];

  get mealTimes => _meals;
  get mealTimeItems => _mealTimeItems;

  void addMeal(int index) {
    print('New ${_meals[0]} logged.');
    _mealTimeItems.add(_meals[index]);
    notifyListeners();
  }

  // remove equivalent permanently.
  void removeMeal(int index) {
    print('Meal: ${_meals[0]} removed.');

    _mealTimeItems.remove(_meals[index]);
    notifyListeners();
  }
}
