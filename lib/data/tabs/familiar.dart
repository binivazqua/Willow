import 'package:bejoy/components/userData/dropDown.dart';
import 'package:flutter/material.dart';

class percepcionFamiliar extends StatefulWidget {
  const percepcionFamiliar({super.key});

  @override
  State<percepcionFamiliar> createState() => _percepcionFamiliarState();
}

class _percepcionFamiliarState extends State<percepcionFamiliar> {
  String _default1 = '';
  final List<String> escala_de_identidad = [
    'Totalmente en desacuerdo',
    'En desacuerdo',
    'No se',
    'De acuerdo',
    'Totalmente de acuerdo',
    ''
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Responde respecto al nivel en el que te sientas identificada',
              textAlign: TextAlign.center,
            ),
            dropdownMenu(
              helper: '',
              defaultValue: _default1,
              list: escala_de_identidad,
              theme: 'Escala',
              width: 300,
              textColor: Colors.purple,
              onChanged: (p0) => {_default1 = p0!},
            ),
          ],
        ),
      )),
    );
  }
}
