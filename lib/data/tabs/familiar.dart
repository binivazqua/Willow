import 'package:bejoy/components/userData/dropDown.dart';
import 'package:bejoy/components/userData/longTextField.dart';
import 'package:bejoy/components/userData/shortTextField.dart';
import 'package:flutter/material.dart';

class percepcionFamiliar extends StatefulWidget {
  const percepcionFamiliar({super.key});

  @override
  State<percepcionFamiliar> createState() => _percepcionFamiliarState();
}

class _percepcionFamiliarState extends State<percepcionFamiliar> {
  final TextEditingController _confianza = new TextEditingController();
  final TextEditingController _yosoyparamifamilia = new TextEditingController();

  String _default1 = '';
  String _default2 = '';

  final List<String> escala_de_identidad = [
    'Totalmente en desacuerdo',
    'En desacuerdo',
    'No lo sé',
    'De acuerdo',
    'Totalmente de acuerdo',
    '',
  ];

  final List<String> fuentes_de_apoyo = [
    'Mamá',
    'Papá',
    'Hermano o hermana',
    'Otro miembro de mi familia',
    'Profesional de salud',
    'Otro',
    '',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child: Column(
            children: [
              Text(
                'Responde respecto al nivel en el que te sientas identificada',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text('Me siento apoyada por mi familia durante mi recuperación.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _default1,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_default1 = p0!},
              ),
              Text(
                  'Durante mi recuperación, me he sentido juzgada por algún miembro de mi familia.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _default1,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_default1 = p0!},
              ),
              Text('Me siento incomprendida por algún miembro de mi familia.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _default1,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_default1 = p0!},
              ),
              Text('Me siento cómoda hablando sobre mi TCA con mi familia.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _default1,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_default1 = p0!},
              ),
              Text(
                  'Durante mi proceso, cuando siento que no puedo más, acudo con: '),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _default2,
                list: fuentes_de_apoyo,
                theme: 'Apoyo',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_default2 = p0!},
              ),
              Text(
                  '¿Cuál es la razón principal por la que te sientes en confianza con esa persona?'),
              SizedBox(
                height: 10,
              ),
              longTextField(
                  controller: _confianza,
                  label: '',
                  fillColor: Colors.white,
                  filled: true),
              Text(
                'Completa:',
                textAlign: TextAlign.center,
              ),
              Text('Para mi familia, yo soy...'),
              SizedBox(height: 10),
              longTextField(
                controller: _yosoyparamifamilia,
                label: '',
                filled: true,
                fillColor: Colors.white,
              )
            ],
          ),
        ),
      )),
    );
  }
}
