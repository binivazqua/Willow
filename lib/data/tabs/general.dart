import 'package:flutter/material.dart';

class percepcionGeneral extends StatefulWidget {
  const percepcionGeneral({super.key});

  @override
  State<percepcionGeneral> createState() => _percepcionGeneralState();
}

class _percepcionGeneralState extends State<percepcionGeneral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Text('Percepción general'),
      ),
    );
  }
}
