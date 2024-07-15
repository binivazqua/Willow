import 'package:flutter/material.dart';

class EquivalentTile extends StatelessWidget {
  final String equivName;
  final String description;
  final String iconPath;
  final Color color;
  const EquivalentTile(
      {super.key,
      required this.equivName,
      required this.description,
      required this.iconPath,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // image
          Image(
            image: AssetImage(iconPath),
            height: 60,
          )
        ],
      ),
    );
  }
}
