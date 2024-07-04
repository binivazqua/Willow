import 'package:bejoy/components/userData/dropDown.dart';
import 'package:bejoy/components/userData/shortTextField.dart';
import 'package:bejoy/components/userData/turquoiseButton.dart';
import 'package:bejoy/design/colors/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class miedoSintomas extends StatefulWidget {
  const miedoSintomas({super.key});

  @override
  State<miedoSintomas> createState() => _miedoSintomasState();
}

class _miedoSintomasState extends State<miedoSintomas> {
  TextEditingController _comer1 = TextEditingController();
  TextEditingController _comer2 = TextEditingController();
  TextEditingController _comer3 = TextEditingController();

  TextEditingController _nomerecedora = TextEditingController();
  TextEditingController _porquenomerecedora = TextEditingController();

  TextEditingController _alimentomiedo = TextEditingController();
  TextEditingController _porquemiedoalimento = TextEditingController();

  @override
  void dispose() {
    _comer1.dispose();
    _comer2.dispose();
    _comer3.dispose();
    _nomerecedora.dispose();
    _porquenomerecedora.dispose();
    _alimentomiedo.dispose();
    _porquemiedoalimento.dispose();

    super.dispose();
  }

  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<void> _saveData(User? currentUser) async {
    if (currentUser == null) {
      print('User not found. Please login.');
      return;
    }

    var conceptos = [
      _comer1.text.trim(),
      _comer2.text.trim(),
      _comer3.text.trim()
    ];

    print('Primeros tres conceptos asociados con comer:$conceptos');
    print('Se siente no merecedora de algún alimento: $_sionomerecedora');
    print(
        'Alimento del cual se siente no merecedora: ${_nomerecedora.text.trim()}');
    print(
        'Razón de la cual se siente no merecedora: ${_porquenomerecedora.text.trim()}');
    print('Le tiene miedo a algun alimento: $_sionomiedo');
    print(
        'Alimento del cual no se siente merecedora: ${_alimentomiedo.text.trim()}');
    print('Razón: ${_porquemiedoalimento.text.trim()}');

    try {
      DocumentReference userDocRef =
          database.collection('users').doc(currentUser.uid);

      // Add data to the 'general perception' subcollection
      await userDocRef
          .collection('initial_diagnostic')
          .doc('fear_description')
          .set({
        'Primeros tres conceptos asociados con comer;': conceptos,
        'Se siente no merecedora de algún alimento:': _sionomerecedora,
        'Alimento del cual se siente no merecedora:': _nomerecedora.text.trim(),
        'Razón:': _porquenomerecedora.text.trim(),
        'Le tiene miedo a algun alimento:': _sionomiedo,
        'Alimento del cual no se siente merecedora:':
            _alimentomiedo.text.trim(),
        'Razón': _porquemiedoalimento.text.trim(),
      });
      print('Info sent to database.');
    } catch (error) {
      print('There was an error sending data: $error');
    }
  }

  Future<void> sendData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await _saveData(user);
    } catch (error) {
      print('Encountered an error sending data: $error.');
    }
  }

  final List<String> merecedora = ['Sí', 'No', ''];
  String _sionomerecedora = '';
  String _sionomiedo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
          child: Column(
            children: [
              Text('Enlista los primeros 3 conceptos que asocies con "comer":'),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  shortTextField(
                      controller: _comer1, label: 'concepto', filled: true),
                  shortTextField(
                      controller: _comer2, label: 'concepto', filled: true),
                  shortTextField(
                      controller: _comer3, label: 'concepto', filled: true),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text('¿Hay algún alimento del cual no te sientes merecedora?'),
              SizedBox(
                height: 10,
              ),
              dropdownMenu(
                helper: '',
                defaultValue: _sionomerecedora,
                list: merecedora,
                theme: 'Sí o No',
                width: 310,
                textColor: deepTurquoise,
                onChanged: (p0) => {_sionomerecedora = p0!},
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('¿Cuál es?'),
                      SizedBox(height: 10),
                      shortTextField(
                          controller: _nomerecedora, label: '', filled: true)
                    ],
                  ),
                  Column(
                    children: [
                      Text('¿Por qué crees que es esto?'),
                      SizedBox(height: 10),
                      shortTextField(
                          controller: _porquenomerecedora,
                          label: '',
                          filled: true)
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text('¿Hay algún alimento al que le tengas miedo?'),
              SizedBox(height: 10),
              dropdownMenu(
                helper: '',
                defaultValue: _sionomiedo,
                textColor: deepTurquoise,
                list: merecedora,
                theme: 'Sí o No',
                width: 310,
                onChanged: (p0) => {_sionomiedo = p0!},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('¿Cuál es?'),
                      SizedBox(height: 10),
                      shortTextField(
                          controller: _alimentomiedo, label: '', filled: true)
                    ],
                  ),
                  Column(
                    children: [
                      Text('¿Por qué crees que es esto?'),
                      SizedBox(height: 10),
                      shortTextField(
                          controller: _porquemiedoalimento,
                          label: '',
                          filled: true),
                    ],
                  ),
                ],
              ),
              Turquoisebutton(txt: 'Save')
            ],
          ),
        ),
      ),
    ));
  }
}
