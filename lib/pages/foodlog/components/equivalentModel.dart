import 'package:flutter/material.dart';

class Equivalent extends ChangeNotifier {
  // list of equivalents:
  final List _equivalents = [
    //['name', 'description', 'icon', 'color'],
    [
      "Origen animal",
      "left today",
      "lib/design/images/foodlog/carne.png",
      Colors.orange[200]
    ],

    [
      "Frutas",
      "left today",
      "lib/design/images/foodlog/acai.png",
      Colors.pink[200]
    ],

    [
      "Verduras",
      "left today",
      "lib/design/images/foodlog/zanahoria.png",
      Colors.green[200]
    ],

    [
      "Lácteos",
      "left today",
      "lib/design/images/foodlog/leche.png",
      Colors.blue[200]
    ],

    [
      "Cereales",
      "left today",
      "lib/design/images/foodlog/pan-de-molde.png",
      Colors.yellow[200]
    ],

    [
      "Grasas",
      "left today",
      "lib/design/images/foodlog/almendras-sin-igual.png",
      Colors.purple[200]
    ],
  ];

  List _mealItems = [];

  get equivalents => _equivalents;
  get mealItems => _mealItems;

  void addEquiv(int index) {
    _mealItems.add(_equivalents[index]);
    notifyListeners();
  }

  void removeEquiv(int index) {
    _mealItems.removeAt(index);
    notifyListeners();
  }

  double calculateeachEquiv(String itemToCount) {
    double total = 0;

    for (String item in _mealItems) {
      if (item == itemToCount) {
        total++;
      }
    }
    return total;
  }

  Map<dynamic, int> countEquivs(List mealEquivs) {
    Map<dynamic, int> frequencies = {};

    for (var equiv in mealEquivs) {
      if (frequencies.containsKey(equiv)) {
        frequencies[equiv] = frequencies[equiv]! + 1;
      } else {
        frequencies[equiv] = 1;
      }
    }

    return frequencies;
  }
}
