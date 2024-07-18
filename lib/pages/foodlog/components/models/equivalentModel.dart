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

  // Subarrays:
  List _origenAnimal = [];
  int oa = 0;
  List _frutas = [];
  int f = 0;
  List _verduras = [];
  int v = 0;
  List _lacteos = [];
  int l = 0;
  List _grasas = [];
  int g = 0;
  List _cereales = [];
  int c = 0;

  // add equivalent only once

  void addUp(int index) {
    print('New equivalent of type: ${_equivalents[index][0]} added');
    if (_equivalents[index][0] == 'Origen animal') {
      oa++;
    } else if (_equivalents[index][0] == 'Frutas') {
      f++;
    } else if (_equivalents[index][0] == 'Verduras') {
      v++;
    } else if (_equivalents[index][0] == 'Lácteos') {
      l++;
    } else if (_equivalents[index][0] == 'Cereales') {
      c++;
    } else if (_equivalents[index][0] == 'Grasas') {
      g++;
    }
    notifyListeners();
  }

  void substractDown(int index) {
    print('New equivalent of type: ${_equivalents[index][0]} added');
    if (_equivalents[index][0] == 'Origen animal') {
      oa--;
    } else if (_equivalents[index][0] == 'Frutas') {
      f--;
    } else if (_equivalents[index][0] == 'Verduras') {
      v--;
    } else if (_equivalents[index][0] == 'Lácteos') {
      l--;
    } else if (_equivalents[index][0] == 'Cereales') {
      c--;
    } else if (_equivalents[index][0] == 'Grasas') {
      g--;
    }
    notifyListeners();
  }

  void addEquiv(int index) {
    addUp(index);
    print(' Cereales: ${c}');
    print('Verduras: ${v}');
    print('Frutas: ${f}');
    print('Lacteos: ${l}');
    print('Grasas: ${g}');
    print('Origen animal: ${oa}');

    _mealItems.add(_equivalents[index]);
    notifyListeners();
  }

  // remove equivalent permanently.
  void removeEquiv(int index) {
    substractDown(index);
    print(' Cereales: ${c}');
    print('Verduras: ${v}');
    print('Frutas: ${f}');
    print('Lacteos: ${l}');
    print('Grasas: ${g}');
    print('Origen animal: ${oa}');

    _mealItems.remove(_equivalents[index]);
    notifyListeners();
  }

  Map<String, int> getEquivalentCounts() {
    return {
      'Origen animal': oa,
      'Frutas': f,
      'Verduras': v,
      'Lácteos': l,
      'Cereales': c,
      'Grasas': g,
    };
  }

  // Create and print the map of equivalents and their counts
  void printEquivalentCounts() {
    Map<String, int> counts = {
      'Origen animal': oa,
      'Frutas': f,
      'Verduras': v,
      'Lácteos': l,
      'Cereales': c,
      'Grasas': g,
    };

    counts.forEach((key, value) {
      print('The count of "$key" is $value.');
    });
  }
}
