import 'package:bejoy/design/colors/palette.dart';
import 'package:flutter/material.dart';

class longTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Color? fillColor;
  final bool filled;

  const longTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.fillColor,
      required this.filled});

  InputDecoration _textFieldStyle() {
    if (filled == true) {
      return InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: deepTurquoise,
              width: 2,
            )),
        label: Text('...'),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        helper: Text(label),
      );
    } else {
      return InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        helper: Text('helper'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: TextField(
        controller: controller,
        decoration: _textFieldStyle(),
      ),
    );
  }
}
