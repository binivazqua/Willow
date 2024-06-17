import 'package:flutter/material.dart';

class logoTile extends StatelessWidget {
  final String imagePath;

  const logoTile ({
    super.key,
    required this.imagePath,
  });
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(5),
      
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(
          color:Colors.yellow,
        ),
        borderRadius: BorderRadius.circular(10),
      
      ),
      child: Image.asset(imagePath,
        height: 50,
        color: Colors.orange[300],
      ),
         

    );
  }
}