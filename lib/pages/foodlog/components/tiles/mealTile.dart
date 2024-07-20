import 'package:bejoy/components/textField.dart';
import 'package:flutter/material.dart';

class MealTile extends StatelessWidget {
  final String mealName;
  //final String description;
  final String iconPath;
  final Color color;
  //final TextEditingController times;
  void Function()? onP;
  //void Function()? onPR;

  MealTile({
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
      padding: const EdgeInsets.all(8),

      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            /*
            Image(
              image: AssetImage(iconPath),
              height: 60,
            ),
            */

            Text(
              mealName,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),

            ElevatedButton(
              onPressed: onP,
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 10,
                  color: color,
                ),
              ),
              style: ButtonStyle(overlayColor: WidgetStatePropertyAll(color)),
            ),

            /*
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: onPR,
                  icon: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                    highlightColor: Colors.black,
                    focusColor: Colors.blue,
                    onPressed: onP,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
              ],
            )*/
          ],
        ),
      ),
    );
  }
}
