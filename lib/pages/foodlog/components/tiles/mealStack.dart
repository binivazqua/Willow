import 'package:bejoy/components/textField.dart';
import 'package:bejoy/pages/foodlog/components/tiles/mealTile.dart';
import 'package:flutter/material.dart';

class MealStack extends StatelessWidget {
  final String mealName;
  //final String description;
  final String iconPath;
  final Color color;
  //final TextEditingController times;
  void Function()? onP;
  //void Function()? onPR;

  MealStack({
    super.key,
    required this.mealName,
    //required this.description,
    required this.iconPath,
    required this.color,
    required this.onP,
    //required this.onPR,
    //required this.times,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      padding: const EdgeInsets.all(12),

      child: Stack(
        children: [
          MealTile(
              mealName: mealName, iconPath: iconPath, color: color, onP: onP),
          Positioned(
            child: Image(image: AssetImage(iconPath)),
            bottom: 6,
          ),
        ],
      ),
    );
  }
}
