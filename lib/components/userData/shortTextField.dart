import 'package:bejoy/design/colors/palette.dart';
import 'package:flutter/material.dart';

class shortTextField extends StatelessWidget {
  TextEditingController controller;
  final String label;
  Color? fillColor;
  final bool filled;
  final double dwidth;
  Color? focusColor;

  shortTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.fillColor,
      required this.filled,
      required this.dwidth});

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
            borderRadius: BorderRadius.all(Radius.circular(20)),
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
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                color: deepTurquoise,
                width: 2,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                color: turquoise,
                width: 5,
              )),
          hintText: '       ${label}',
          hintStyle: TextStyle(
            fontSize: 12,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dwidth,
      child: TextField(
        decoration: _textFieldStyle(),
        controller: controller,
        cursorColor: deepTurquoise,
      ),
    );
  }
}
