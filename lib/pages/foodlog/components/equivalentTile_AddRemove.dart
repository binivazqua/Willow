import 'package:bejoy/components/textField.dart';
import 'package:flutter/material.dart';

class EquivalentTileAddRemove extends StatelessWidget {
  final String equivName;
  final String description;
  final String iconPath;
  final Color color;
  final TextEditingController times;
  void Function()? onP;
  void Function()? onPR;

  EquivalentTileAddRemove({
    super.key,
    required this.equivName,
    required this.description,
    required this.iconPath,
    required this.color,
    required this.onP,
    required this.onPR,
    required this.times,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      padding: const EdgeInsets.all(12),

      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Image(
              image: AssetImage(iconPath),
              height: 60,
            ),

            Text(
              equivName,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            Text(
              description,
              style: TextStyle(
                fontSize: 10,
              ),
            ),

            /*
            ElevatedButton(
              onPressed: onP,
              child: Text(
                'Add',
                style: TextStyle(fontSize: 10),
              ),
              style: ButtonStyle(overlayColor: WidgetStatePropertyAll(color)),
            ),
            */
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
            )
          ],
        ),
      ),
    );
  }
}
