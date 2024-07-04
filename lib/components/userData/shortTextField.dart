import 'package:bejoy/design/colors/palette.dart';
import 'package:flutter/material.dart';

class shortTextField extends StatelessWidget {
  TextEditingController controller;
  final String label;
  Color? fillColor;
  final bool filled;

  shortTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.fillColor,
      required this.filled});

  InputDecoration _textFieldStyle() {
    if (filled == true) {
      return InputDecoration(
        label: Text('...'),
        filled: true,
        fillColor: Colors.white,
        focusColor: deepTurquoise,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: deepTurquoise,
              width: 2,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: lightTurquoise,
              width: 1,
            )),
        helper: Text(
          label,
          style: TextStyle(color: deepTurquoise),
        ),
      );
    } else {
      return InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: lightTurquoise,
              width: 1,
            )),
        helper: Text('helper'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: TextField(
        decoration: _textFieldStyle(),
        controller: controller,
        cursorColor: deepTurquoise,
      ),
    );
  }
}
