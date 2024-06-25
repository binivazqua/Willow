import 'package:bejoy/components/userData/dropDown.dart';
import 'package:bejoy/components/userData/longTextField.dart';
import 'package:bejoy/components/userData/shortTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class percepcionFamiliar extends StatefulWidget {
  const percepcionFamiliar({super.key});

  @override
  State<percepcionFamiliar> createState() => _percepcionFamiliarState();
}

class _percepcionFamiliarState extends State<percepcionFamiliar> {
  TextEditingController _confianza = new TextEditingController();
  TextEditingController _yosoyparamifamilia = new TextEditingController();

  @override
  void dispose() {
    _confianza.dispose();
    _yosoyparamifamilia.dispose();
    super.dispose();
  }

  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<void> _saveResponses(User? currentUser) async {
    if (currentUser == null) {
      print('No user was found. Log in.');
      return;
    }

    // Debugging purposes:
    print('Apoyo familiar: ${_apoyofamiliar}');
    print('Me he sentido juzgada: ${_juiciofamiliar}');
    print('Me he sentido incomprendida: ${_incomprensionfamiliar}');
    print('Me siento cómoda hablando sobre mi TCA: ${_comodidadhablando}');
    print('Cuando no puedo más, acudo con: ${_apoyoprincipal}');
    print('Razón de confianza: ${_confianza.text.trim()}');
    print('Yo soy para mi familia: ${_yosoyparamifamilia.text.trim()}');

    try {
      DocumentReference userDocRef =
          database.collection('users').doc(currentUser?.uid);

      // Add data to the 'general perception' subcollection
      await userDocRef
          .collection('initial_diagnostic')
          .doc('familiar_perception')
          .set({
        'Apoyo familiar': _apoyofamiliar,
        'Me he sentido juzgada': _juiciofamiliar,
        'Me he sentido incomprendida': _incomprensionfamiliar,
        'Me siento cómoda hablando sobre mi TCA': _comodidadhablando,
        'Cuando no puedo más, acudo con': _apoyoprincipal,
        'Razón de confianza': _confianza.text.trim(),
        'Yo soy para mi familia': _yosoyparamifamilia.text.trim(),
      });
      print('Info sent to database.');
    } catch (error) {
      print('There was an error sending data: $error');
    }
  }

  Future<void> sendData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await _saveResponses(user);
    } catch (error) {
      print('Encountered an error sending data: $error.');
    }
  }

  String _apoyofamiliar = '';
  String _juiciofamiliar = '';
  String _incomprensionfamiliar = '';
  String _comodidadhablando = '';
  String _apoyoprincipal = '';

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
                defaultValue: _apoyofamiliar,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_apoyofamiliar = p0!},
              ),
              Text(
                  'Durante mi recuperación, me he sentido juzgada por algún miembro de mi familia.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _juiciofamiliar,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_juiciofamiliar = p0!},
              ),
              Text('Me siento incomprendida por algún miembro de mi familia.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _incomprensionfamiliar,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_incomprensionfamiliar = p0!},
              ),
              Text('Me siento cómoda hablando sobre mi TCA con mi familia.'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _comodidadhablando,
                list: escala_de_identidad,
                theme: 'Escala',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_comodidadhablando = p0!},
              ),
              Text(
                  'Durante mi proceso, cuando siento que no puedo más, acudo con: '),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _apoyoprincipal,
                list: fuentes_de_apoyo,
                theme: 'Apoyo',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_apoyoprincipal = p0!},
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
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: sendData, child: Text('Send')),
            ],
          ),
        ),
      )),
    );
  }
}
