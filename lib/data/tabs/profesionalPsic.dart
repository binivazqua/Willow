import 'package:flutter/material.dart';

class profesionalPsicFis extends StatefulWidget {
  const profesionalPsicFis({super.key});

  @override
  State<profesionalPsicFis> createState() => _profesionalPsicFisState();
}

class _profesionalPsicFisState extends State<profesionalPsicFis> {
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
