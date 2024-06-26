import 'package:bejoy/components/userData/checkbox.dart';
import 'package:bejoy/components/userData/dropDown.dart';
import 'package:bejoy/components/userData/longTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class perfilABA extends StatefulWidget {
  const perfilABA({super.key});

  @override
  State<perfilABA> createState() => _perfilABAState();
}

class _perfilABAState extends State<perfilABA> {
  String _identificarhambre = '';
  String _comeracompanada = '';
  String _necesidaddemovimiento = '';
  String _toleranciaaldolor = '';
  String _necesidaddeplanear = '';

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

  late double _frectaquicardia;
  late double _frecmareo;
  late double _frecdolorabdominal;
  late double _frecbano;
  late double _frecmovcorporal;

  bool? _compmovcorporal = false;
  bool? _compejercicio = false;
  bool? _compsaltarcomidas = false;
  bool? _comprestriccion = false;
  bool? _compactividad = false;
  bool? _compaislamiento = false;

  TextEditingController _sentirdespuescomp = new TextEditingController();
  TextEditingController _regla1desafiar = new TextEditingController();
  TextEditingController _regla2desafiar = new TextEditingController();
  TextEditingController _regla3desafiar = new TextEditingController();

  OverlayPortalController popupController = new OverlayPortalController();

  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<void> _saveData(User? currentUser) async {
    if (currentUser == null) {
      print('User not found. Please login.');
      return;
    }

    Map<String, bool?> sintomas = {
      'necesidad de ejercicio': _sintoma1Checked,
      'taquicardia': _sintoma2Checked,
      'mareos': _sintoma3Checked,
      'dolor abdominal': _sintoma5Checked,
      'sudor en palmas': _sintoma6Checked,
      'hormigueo': _sintoma7Checked,
    };

    Map<String, bool?> tipos_de_pensamiento = {
      'conteo de calorías': _conteodecalorias,
      'conteo de macros': _conteomacros,
      'conteo de porciones': _porciones,
      'sabor': _sabor,
      'textura': _textura,
      'comidas previas': _comidasprevias,
      'comidas posteriores': _comidasposteriores,
    };

    Map<String, bool?> actitudes_compensatorias = {
      'movimiento corporal': _compmovcorporal,
      'ejercicio exhaustivo': _compejercicio,
      'saltar comidas': _compsaltarcomidas,
      'restringir alimentos': _comprestriccion,
      'privacion': _compactividad,
      'aislamiento': _compaislamiento,
    };

    Map<String, double> frecuencias_de_sintomas = {
      'taquicardia': _frectaquicardia,
      'mareos': _frecmareo,
      'dolor abdominal': _frecdolorabdominal,
      'necesidad de ir al baño': _frecbano,
      'necesidad de movimiento': _frecmovcorporal,
    };

    var reglas_a_desafiar = [
      _regla1desafiar.text.trim(),
      _regla2desafiar.text.trim(),
      _regla3desafiar.text.trim()
    ];

    print('Identifica cuando tiene hambre: $_identificarhambre');
    print('Necesidad de comer en distinta proporción: $_comeracompanada');
    print('Necesidad de movimiento: $_necesidaddemovimiento');
    print('Alta tolerancia al dolor: $_toleranciaaldolor');
    print('Necesidad de planear comidas: $_necesidaddeplanear');
    print('Síntomas: $_necesidaddeplanear');
    print('Síntomas previos: $sintomas');
    print('Tipos de pensamiento: $tipos_de_pensamiento');
    print('Frecuencia de taquicardia: $_frectaquicardia');
    print('Frecuencia de mareos: $_frecmareo');
    print('Frecuencia de dolor abdominal: $_frecdolorabdominal');
    print('Frecuencia de necesidad de ir al baño: $_frecbano');
    print('Frecuencia de necesidad de movimiento: $_frecmovcorporal');
    print('Actitudes compensatorias: $actitudes_compensatorias');
    print('Reglas a desafiar: ${reglas_a_desafiar}');

    try {
      DocumentReference userDocRef =
          database.collection('users').doc(currentUser.uid);

      await userDocRef
          .collection('initial_diagnostic')
          .doc('anorexia_profile')
          .set({
        'Identifica cuando tiene hambre:': _identificarhambre,
        'Necesidad de comer en distinta proporción:': _comeracompanada,
        'Necesidad de movimiento:': _necesidaddemovimiento,
        'Alta tolerancia al dolor:': _toleranciaaldolor,
        'Necesidad de planear comidas:': _necesidaddeplanear,
        'Síntomas previos a comidas:': sintomas,
        'Pensamientos al comer:': tipos_de_pensamiento,
        'Frecuencia de síntomas:': frecuencias_de_sintomas,
        'Actitudes compensatorias': actitudes_compensatorias,
        'Reglas a desafiar:': reglas_a_desafiar,
      });
      print('Info sent to database.');
    } catch (error) {
      print('There was an error sending data: $error');
      return;
    }
  }

  Future<void> _sendData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await _saveData(user);
    } catch (error) {
      print('Encountered an error sending data: $error.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            children: [
              Text(
                'Responde respecto al nivel en el que te sientas identificada.',
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
                defaultValue: _identificarhambre,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_identificarhambre = p0!},
              ),
              Text(
                  'Cuando como acompañada, siento la necesidad de comer en mayor o menor proporción a mi acompañante.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _comeracompanada,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_comeracompanada = p0!},
              ),
              Text(
                  'Constantemente siento la necesidad de moverme. Aun cuando estoy cansada.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _necesidaddemovimiento,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_necesidaddemovimiento = p0!},
              ),
              Text(
                  'Creo o me han dicho que tengo una alta tolerancia al dolor.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _toleranciaaldolor,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_toleranciaaldolor = p0!},
              ),
              Text(
                  'Siento la necesidad de planear lo que comeré con anticipación.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _necesidaddeplanear,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_necesidaddeplanear = p0!},
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
              SizedBox(
                height: 15,
              ),
              Text('Califica segun el nivel de frecuencia: '),
              SizedBox(
                height: 15,
              ),
              Text('Taquicardia'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.purple[100],
                      ),
                  onRatingUpdate: (rating) =>
                      {_frectaquicardia = rating, print(_frectaquicardia)}),
              SizedBox(
                height: 15,
              ),
              Text('Mareo o nauseas'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.purple[100],
                      ),
                  onRatingUpdate: (rating) =>
                      {_frecmareo = rating, print(_frecmareo)}),
              SizedBox(
                height: 15,
              ),
              Text('Dolor abdominal'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.purple[100],
                      ),
                  onRatingUpdate: (rating) => {
                        _frecdolorabdominal = rating,
                        print(_frecdolorabdominal)
                      }),
              SizedBox(
                height: 15,
              ),
              Text('Necesidad de ir al baño'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.purple[100],
                      ),
                  onRatingUpdate: (rating) =>
                      {_frecbano = rating, print(_frecbano)}),
              SizedBox(
                height: 15,
              ),
              Text('Necesidad de movimiento corporal'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.purple[100],
                      ),
                  onRatingUpdate: (rating) =>
                      {_frecmovcorporal = rating, print(_frecmovcorporal)}),
              SizedBox(
                height: 15,
              ),
              Text(
                  '¿Cuáles de las siguientes actitudes compensatorias has experimentado?'),
              SizedBox(
                height: 15,
              ),
              myCheckbox(
                  label: 'Movimiento corporal',
                  isChecked: _compmovcorporal,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _compmovcorporal = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Ejercicio exhaustivo',
                  isChecked: _compejercicio,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _compejercicio = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Saltar tiempos de comida',
                  isChecked: _compsaltarcomidas,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _compsaltarcomidas = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Restringir algún alimento o grupo de alimentos',
                  isChecked: _comprestriccion,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _comprestriccion = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Privarme de alguna actividad recreativa',
                  isChecked: _compactividad,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _compactividad = newValue;
                    });
                  }),
              myCheckbox(
                  label: 'Aislarme',
                  isChecked: _compaislamiento,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _compaislamiento = newValue;
                    });
                  }),
              SizedBox(
                height: 15,
              ),
              /*
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.purple)),
                  onPressed: popupController.toggle,
                  child: OverlayPortal(
                      controller: popupController,
                      overlayChildBuilder: (BuildContext context) {
                        return Positioned(
                            top: 100,
                            right: 100,
                            child: ColoredBox(
                              color: Colors.purple,
                              child: Text('Fuck it'),
                            ));
                      })),
              SizedBox(
                height: 10,
              ),

              */
              Text('¿Qué reglas creadas por tu TCA quisieras desafiar?'),
              SizedBox(
                height: 15,
              ),
              longTextField(
                  controller: _regla1desafiar,
                  label: 'regla 1',
                  fillColor: Colors.white,
                  filled: true),
              SizedBox(height: 10),
              longTextField(
                  controller: _regla2desafiar,
                  label: 'regla 2',
                  fillColor: Colors.white,
                  filled: true),
              SizedBox(height: 10),
              longTextField(
                  controller: _regla3desafiar,
                  label: 'regla 3',
                  fillColor: Colors.white,
                  filled: true),
              ElevatedButton(onPressed: _sendData, child: Text('Send'))
            ],
          ),
        )),
      ),
    );
  }
}
