import 'package:bejoy/components/userData/checkbox.dart';
import 'package:bejoy/components/userData/longTextField.dart';
import 'package:bejoy/components/userData/rating.dart';
import 'package:bejoy/components/userData/shortTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class profesionalPsicFis extends StatefulWidget {
  const profesionalPsicFis({super.key});

  @override
  State<profesionalPsicFis> createState() => _profesionalPsicFisState();
}

List<String> _estadoNutricional = [
  'Sobrepeso',
  'Saludable',
  'Insuficiente',
  'Desnutrición'
];

class _profesionalPsicFisState extends State<profesionalPsicFis> {
  final TextEditingController _diagnostico = new TextEditingController();

  bool? _adicionalTOC = false;
  bool? _adicionalAG = false;
  bool? _adicionalAS = false;
  bool? _adicionalDEP = false;

  bool? _realimentacion = false;
  bool? _terapiagestal = false;
  bool? _terapiacogcond = false;
  bool? _terapiacogoanalitica = false;
  bool? _terapiafamiliar = false;
  bool? _internamiento = false;
  bool? _interhospitalaria = false;

  late double _miedocomida;
  late double _hiperactividad;

  late double _familiares;
  late double _sociales;
  late double _trauma;
  late double _culturasdedieta;

  late double _mindfullness;
  late double _respiraciones;
  late double _terapiaCOG;
  late double _terapiaGESTAL;

  final TextEditingController _razonesprospectoNR = new TextEditingController();
  final TextEditingController _pesoactual = new TextEditingController();

  String currentOption = _estadoNutricional[0];

  bool? _anemia = false;
  bool? _amenorrea = false;
  bool? _descalcificacion = false;
  bool? _bradicardia = false;
  bool? _hipotension = false;

  final TextEditingController _medicacion = new TextEditingController();

  List<String> _duraciontratamiento = [
    '1-2 meses',
    '3-6 meses',
    '6 meses - 1 año',
    '2 años',
    '3 años o más'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Center(
          child: Column(
            children: [
              Text('Sección para el profesional.'),
              SizedBox(
                height: 15,
              ),
              Text('Diagnóstico de anorexia (tipo):'),
              SizedBox(
                height: 10,
              ),
              longTextField(
                  controller: _diagnostico,
                  label: '',
                  fillColor: Colors.white,
                  filled: true),
              Text('Diagnósticos adicionales:'),
              SizedBox(
                height: 10,
              ),
              myCheckbox(
                isChecked: _adicionalTOC,
                label: 'Trastorno Obsesivo Compulsivo',
                onChanged: (bool? newValue) {
                  setState(() {
                    _adicionalTOC = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _adicionalAG,
                label: 'Ansiedad generalizada',
                onChanged: (bool? newValue) {
                  setState(() {
                    _adicionalAG = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _adicionalAS,
                label: 'Ansiedad social',
                onChanged: (bool? newValue) {
                  setState(() {
                    _adicionalAS = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _adicionalDEP,
                label: 'Depresión',
                onChanged: (bool? newValue) {
                  setState(() {
                    _adicionalDEP = newValue;
                  });
                },
              ),
              Text('Tipo(s) de tratamiento llevado(s) hasta el momento:'),
              SizedBox(
                height: 10,
              ),
              myCheckbox(
                isChecked: _realimentacion,
                label: 'Realimentación',
                onChanged: (bool? newValue) {
                  setState(() {
                    _realimentacion = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _terapiacogcond,
                label: 'Terapia Cognitivo Conductual',
                onChanged: (bool? newValue) {
                  setState(() {
                    _terapiacogcond = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _terapiacogoanalitica,
                label: 'Terapia Cognitiva Analítica',
                onChanged: (bool? newValue) {
                  setState(() {
                    _terapiacogoanalitica = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _terapiagestal,
                label: 'Terapia Gestal',
                onChanged: (bool? newValue) {
                  setState(() {
                    _terapiagestal = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _terapiafamiliar,
                label: 'Terapia Familiar',
                onChanged: (bool? newValue) {
                  setState(() {
                    _terapiafamiliar = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _interhospitalaria,
                label: 'Intervención hospitalaria',
                onChanged: (bool? newValue) {
                  setState(() {
                    _interhospitalaria = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _internamiento,
                label: 'Internamiento',
                onChanged: (bool? newValue) {
                  setState(() {
                    _internamiento = newValue;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                  'Si pudiera calificar el nivel de miedo a la comida del paciente en una escala, ¿qué calificación le daría?'),
              SizedBox(
                height: 10,
              ),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.purple[100],
                        size: 10,
                      ),
                  onRatingUpdate: (rating) =>
                      {_miedocomida = rating, print(_miedocomida)}),
              SizedBox(height: 15),
              Text('Nivel de ansiedad y/o hiperactividad del paciente:'),
              SizedBox(
                height: 10,
              ),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.purple[100],
                        size: 10,
                      ),
                  onRatingUpdate: (rating) =>
                      {_hiperactividad = rating, print(_hiperactividad)}),
              SizedBox(height: 15),
              Text(
                  '¿Cuáles, puede decirse, son los principales catalizadores del TCA del paciente?'),
              SizedBox(
                height: 15,
              ),
              Text('Familiar'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.help_sharp,
                        color: Colors.purple[100],
                        size: 10,
                      ),
                  onRatingUpdate: (rating) =>
                      {_familiares = rating, print(_familiares)}),
              SizedBox(height: 10),
              SizedBox(
                height: 15,
              ),
              Text('Social'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.help_sharp,
                        color: Colors.purple[100],
                        size: 10,
                      ),
                  onRatingUpdate: (rating) =>
                      {_sociales = rating, print(_sociales)}),
              SizedBox(height: 10),
              Text('Trauma'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.help_sharp,
                        color: Colors.purple[100],
                        size: 10,
                      ),
                  onRatingUpdate: (rating) =>
                      {_trauma = rating, print(_trauma)}),
              SizedBox(height: 10),
              Text('Culturas de dieta'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.help_sharp,
                        color: Colors.purple[100],
                        size: 10,
                      ),
                  onRatingUpdate: (rating) =>
                      {_culturasdedieta = rating, print(_culturasdedieta)}),
              SizedBox(height: 15),
              Text(
                  'De las siguientes técnicas comunes para controlar la ABA, determine el nivel de efectividad de cada una de ellas en ele paciente: '),
              SizedBox(height: 10),
              Text('Mindfullness'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.purple[100],
                        size: 10,
                      ),
                  onRatingUpdate: (rating) =>
                      {_mindfullness = rating, print(_mindfullness)}),
              SizedBox(height: 15),
              Text('Respiraciones'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.purple[100],
                        size: 10,
                      ),
                  onRatingUpdate: (rating) =>
                      {_respiraciones = rating, print(_respiraciones)}),
              SizedBox(height: 15),
              Text('Terapia Cognitivo Conductual'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.purple[100],
                        size: 10,
                      ),
                  onRatingUpdate: (rating) =>
                      {_terapiaCOG = rating, print(_terapiaCOG)}),
              SizedBox(height: 15),
              Text('Terapia Gestal'),
              RatingBar.builder(
                  tapOnlyMode: true,
                  glow: false,
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.purple[100],
                        size: 10,
                      ),
                  onRatingUpdate: (rating) =>
                      {_terapiaGESTAL = rating, print(_terapiaGESTAL)}),
              SizedBox(height: 15),
              Text(
                  '¿Por qué considera que el paciente es un buen prospecto para poner a prueba las técnicas de neural rewiring? '),
              SizedBox(
                height: 10,
              ),
              longTextField(
                  controller: _razonesprospectoNR,
                  label: '',
                  fillColor: Colors.white,
                  filled: true),
              SizedBox(height: 15),
              Text('Evaluación física'),
              SizedBox(
                height: 15,
              ),
              Text('Peso actual:'),
              SizedBox(height: 10),
              shortTextField(
                  controller: _pesoactual, label: 'kg', filled: true),
              SizedBox(height: 15),
              Text('De acuerdo a su BMI, el paciente está en estado...'),
              ListTile(
                title: Text(_estadoNutricional.first),
                leading: Radio(
                    value: _estadoNutricional.first,
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              ),
              ListTile(
                title: Text(_estadoNutricional[1]),
                leading: Radio(
                    value: _estadoNutricional[1],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              ),
              ListTile(
                title: Text(_estadoNutricional[2]),
                leading: Radio(
                    value: _estadoNutricional[2],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              ),
              ListTile(
                title: Text(_estadoNutricional[3]),
                leading: Radio(
                    value: _estadoNutricional[3],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Otros diagnósticos clínicos asociados con el TCA:'),
              myCheckbox(
                isChecked: _anemia,
                label: 'Anemia',
                onChanged: (bool? newValue) {
                  setState(() {
                    _anemia = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _amenorrea,
                label: 'Amenorrea',
                onChanged: (bool? newValue) {
                  setState(() {
                    _amenorrea = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _descalcificacion,
                label: 'Descalcificación ósea',
                onChanged: (bool? newValue) {
                  setState(() {
                    _descalcificacion = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _bradicardia,
                label: 'Bradicardia',
                onChanged: (bool? newValue) {
                  setState(() {
                    _bradicardia = newValue;
                  });
                },
              ),
              myCheckbox(
                isChecked: _hipotension,
                label: 'Hipotensión',
                onChanged: (bool? newValue) {
                  setState(() {
                    _hipotension = newValue;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text('¿Está recibiendo medicación de algún tipo?'),
              SizedBox(
                height: 10,
              ),
              longTextField(
                  controller: _medicacion,
                  label: '',
                  fillColor: Colors.white,
                  filled: true),
              SizedBox(
                height: 15,
              ),
              Text('Tiempo en rehabilitación psicológica'),
              SizedBox(height: 10),
              ListTile(
                title: Text(_duraciontratamiento[1]),
                leading: Radio(
                    value: _duraciontratamiento[1],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              ),
              ListTile(
                title: Text(_duraciontratamiento[2]),
                leading: Radio(
                    value: _duraciontratamiento[2],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              ),
              ListTile(
                title: Text(_duraciontratamiento[3]),
                leading: Radio(
                    value: _duraciontratamiento[3],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              ),
              ListTile(
                title: Text(_duraciontratamiento[4]),
                leading: Radio(
                    value: _duraciontratamiento[4],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Tiempo en rehabilitación alimentaria'),
              SizedBox(height: 10),
              ListTile(
                title: Text(_duraciontratamiento[1]),
                leading: Radio(
                    value: _duraciontratamiento[1],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              ),
              ListTile(
                title: Text(_duraciontratamiento[2]),
                leading: Radio(
                    value: _duraciontratamiento[2],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              ),
              ListTile(
                title: Text(_duraciontratamiento[3]),
                leading: Radio(
                    value: _duraciontratamiento[3],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              ),
              ListTile(
                title: Text(_duraciontratamiento[4]),
                leading: Radio(
                    value: _duraciontratamiento[4],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
