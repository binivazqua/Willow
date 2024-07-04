import 'package:bejoy/design/colors/palette.dart';
import 'package:flutter/material.dart';

class myCheckbox extends StatefulWidget {
  final Function(bool?)? onChanged;
  final bool? isChecked;
  final String label;
  const myCheckbox(
      {super.key,
      required this.isChecked,
      required this.label,
      this.onChanged});

  @override
  State<myCheckbox> createState() => _myCheckboxState();
}

class _myCheckboxState extends State<myCheckbox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: deepTurquoise,
      value: widget.isChecked,
      onChanged: widget.onChanged,
      checkColor: Colors.white,
      title: Text(
        widget.label,
        style: TextStyle(fontSize: 13),
        textAlign: TextAlign.left,
      ),
    );
  }
}
