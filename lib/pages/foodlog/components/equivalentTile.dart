import 'package:flutter/material.dart';

class EquivalentTile extends StatelessWidget {
  final String equivName;
  final String description;
  final String iconPath;
  final Color color;
  void Function()? onP;
  EquivalentTile({
    super.key,
    required this.equivName,
    required this.description,
    required this.iconPath,
    required this.color,
    required this.onP,
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

            ElevatedButton(
              onPressed: onP,
              child: Text(
                'Add',
                style: TextStyle(fontSize: 10),
              ),
              style: ButtonStyle(overlayColor: WidgetStatePropertyAll(color)),
            )
          ],
        ),
      ),
    );
  }
}
