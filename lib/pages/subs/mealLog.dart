import 'package:bejoy/design/colors/palette.dart';
import 'package:bejoy/pages/foodlog/components/tiles/mealStack.dart';
import 'package:bejoy/pages/foodlog/components/tiles/mealTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealLogPage extends StatelessWidget {
  MealLogPage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'This is your safe place!',
                style: TextStyle(fontSize: 25),
              ),
              Text('Start logging your meals...'),
              SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                      itemCount: _meals.length,
                      itemBuilder: (context, index) {
                        return MealStack(
                            mealName: _meals[index][0],
                            iconPath: _meals[index][2],
                            color: _meals[index][3],
                            onP: () {});
                      }))
            ],
          ),
        ),
      )),
    );
  }
}
