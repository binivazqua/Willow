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

  get equivalents => _equivalents;
}
