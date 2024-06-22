import 'package:flutter/material.dart';

class shortTextField extends StatelessWidget {
  final TextEditingController controller;
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        helper: Text(label),
      );
    } else {
      return InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
      ),
    );
  }
}
