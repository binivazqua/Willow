import 'package:bejoy/components/userData/checkbox.dart';
import 'package:bejoy/components/userData/dropDown.dart';
import 'package:flutter/material.dart';

class perfilABA extends StatefulWidget {
  const perfilABA({super.key});

  @override
  State<perfilABA> createState() => _perfilABAState();
}

class _perfilABAState extends State<perfilABA> {
  String _default1 = '';
  String _default2 = '';
  String _default3 = '';
  String _default4 = '';
  String _default5 = '';

  final List<String> escala_de_identidad = [
    'Nunca / Totalmente en desacuerdo',
    'Pocas veces / En desacuerdo',
    'No lo sé',
    'Algunas veces / De acuerdo',
    'Siempre / Totalmente de acuerdo',
    '',
  ];

  bool? _sintoma1Checked = false;
  bool? _sintoma2Checked = false;
  bool? _sintoma3Checked = false;
  bool? _sintoma4Checked = false;
  bool? _sintoma5Checked = false;
  bool? _sintoma6Checked = false;
  bool? _sintoma7Checked = false;
  bool? _sintoma8Checked = false;

  bool? _conteodecalorias = false;
  bool? _conteomacros = false;
  bool? _porciones = false;
  bool? _sabor = false;
  bool? _textura = false;
  bool? _comidasprevias = false;
  bool? _comidasposteriores = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Text(
                'Responde respecto al nivel en el que te sientas identificada',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text('Soy capaz de identificar cuando tengo hambre'),
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
                  'Cuando como acompañada, siento la necesidad de comer en mayor o menor proporción a mi acompañante.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _default2,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_default2 = p0!},
              ),
              Text(
                  'Constantemente siento la necesidad de moverme. Aun cuando estoy cansada.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _default3,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_default3 = p0!},
              ),
              Text(
                  'Creo o me han dicho que tengo una alta tolerancia al dolor.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _default4,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_default4 = p0!},
              ),
              Text(
                  'Siento la necesidad de planear lo que comeré con anticipación.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _default5,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_default5 = p0!},
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                  'Marca los síntomas que hayas sentido previo a consumir alimentos:'),
              SizedBox(
                height: 10,
              ),
              myCheckbox(
                  label: 'Necesidad de realizar ejercicio o actividad física',
                  isChecked: _sintoma1Checked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _sintoma1Checked = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Taquicardia',
                  isChecked: _sintoma2Checked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _sintoma2Checked = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Mareos o náuseas',
                  isChecked: _sintoma3Checked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _sintoma3Checked = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Necesidad de realizar ejercicio o actividad física',
                  isChecked: _sintoma4Checked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _sintoma4Checked = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Dolor abdominal',
                  isChecked: _sintoma5Checked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _sintoma5Checked = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Sudor en palmas',
                  isChecked: _sintoma6Checked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _sintoma6Checked = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Hormigueo',
                  isChecked: _sintoma7Checked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _sintoma7Checked = newValue;
                    });
                  }),
              SizedBox(
                height: 15,
              ),
              Text(
                  'Cuando estás a punto de consumir algún alimento, o bien, haciéndolo.'),
              Text(
                  '¿Cuáles de los siguientes representan mejor tus pensamientos?'),
              SizedBox(
                height: 10,
              ),
              myCheckbox(
                  label: 'Conteo de calorías',
                  isChecked: _conteodecalorias,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _conteodecalorias = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Conteo de macronutrientes',
                  isChecked: _conteomacros,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _conteomacros = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Porciones',
                  isChecked: _porciones,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _porciones = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Sabor',
                  isChecked: _sabor,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _sabor = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Textura',
                  isChecked: _textura,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _textura = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Comidas previas',
                  isChecked: _comidasprevias,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _comidasprevias = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Comidas posteriores',
                  isChecked: _comidasposteriores,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _comidasposteriores = newValue;
                    });
                  }),
            ],
          ),
        )),
      ),
    );
  }
}
