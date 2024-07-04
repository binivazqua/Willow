import 'package:bejoy/design/colors/palette.dart';
import 'package:flutter/material.dart';

class Turquoisebutton extends StatelessWidget {
  final String txt;
  final void Function()? op;
  const Turquoisebutton({super.key, this.op, required this.txt});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:
            ButtonStyle(backgroundColor: WidgetStatePropertyAll(deepTurquoise)),
        onPressed: op,
        child: Text(
          txt,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}
