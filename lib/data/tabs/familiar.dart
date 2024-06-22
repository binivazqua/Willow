import 'package:flutter/material.dart';

class percepcionFamiliar extends StatefulWidget {
  const percepcionFamiliar({super.key});

  @override
  State<percepcionFamiliar> createState() => _percepcionFamiliarState();
}

class _percepcionFamiliarState extends State<percepcionFamiliar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Center(
        child: Text('Percepción Familiar'),
      ),
    );
  }
}
