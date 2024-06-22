import 'package:flutter/material.dart';

class profesionalPsic extends StatefulWidget {
  const profesionalPsic({super.key});

  @override
  State<profesionalPsic> createState() => _profesionalPsicState();
}

class _profesionalPsicState extends State<profesionalPsic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: Center(
        child: Text('Percepción profesional'),
      ),
    );
  }
}
