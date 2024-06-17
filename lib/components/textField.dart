import 'package:flutter/material.dart';

class textField extends StatelessWidget{
  final String hintDesiredText;
  final controller;
  final obscureText;

  const textField ({
    super.key,
    required this.hintDesiredText,
    required this.controller,
    required this.obscureText,

  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 10.0),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: hintDesiredText,
                hintStyle: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                  fontSize: 13
                ),
                ),
                
            ),
          );
  }

  
  
}