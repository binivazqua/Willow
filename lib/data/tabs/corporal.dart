import 'package:bejoy/components/userData/dropDown.dart';
import 'package:bejoy/components/userData/longTextField.dart';
import 'package:bejoy/components/userData/shortTextField.dart';
import 'package:flutter/material.dart';

class percepcionCorporal extends StatefulWidget {
  const percepcionCorporal({super.key});

  @override
  State<percepcionCorporal> createState() => _percepcionCorporalState();
}

class _percepcionCorporalState extends State<percepcionCorporal> {
  final List<String> periodicidad_espejo = [
    '1 vez',
    '2 veces',
    '3 veces',
    '4 veces',
    '5 +',
    ''
  ];

  final TextEditingController cosa_al_espejo = new TextEditingController();
  final TextEditingController cuerpo1 = new TextEditingController();
  final TextEditingController cuerpo2 = new TextEditingController();
  final TextEditingController cuerpo3 = new TextEditingController();

  final TextEditingController no_me_gusta = new TextEditingController();

  String periodicidad = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('¿Con qué periodicidad te ves al espejo?'),
                SizedBox(
                  height: 15,
                ),
                dropdownMenu(
                    defaultValue: periodicidad,
                    list: periodicidad_espejo,
                    dropdownColor: Colors.white,
                    textColor: Colors.black,
                    theme: 'periodicidad',
                    onChanged: (p0) => {periodicidad = p0!},
                    helper: 'veces al día',
                    width: 200),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Cuando te ves al espejo... ¿Qué es lo primero que notas?',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                longTextField(
                    controller: cosa_al_espejo,
                    label: '',
                    fillColor: Colors.white,
                    filled: true),
                SizedBox(height: 10),
                Text('¿Qué es lo que te gusta de tu cuerpo?'),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shortTextField(
                          controller: cuerpo1, label: 'cosa 1', filled: true),
                      shortTextField(
                          controller: cuerpo2, label: 'cosa 2', filled: true),
                      shortTextField(
                          controller: cuerpo3, label: 'cosa 3', filled: true),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('¿Hay algo que no te gusta de tu cuerpo?'),
                Text('Si es así, escríbelo...'),
                SizedBox(
                  height: 10,
                ),
                longTextField(
                    controller: no_me_gusta,
                    label: '',
                    fillColor: Colors.white,
                    filled: true)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
