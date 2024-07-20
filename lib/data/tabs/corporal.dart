import 'package:bejoy/components/userData/dropDown.dart';
import 'package:bejoy/components/userData/longTextField.dart';
import 'package:bejoy/components/userData/shortTextField.dart';
import 'package:bejoy/design/colors/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  @override
  void dispose() {
    cosa_al_espejo.dispose();
    cuerpo1.dispose();
    cuerpo2.dispose();
    cuerpo3.dispose();

    no_me_gusta.dispose();
    super.dispose();
  }

  FirebaseFirestore database = FirebaseFirestore.instance;

  Future _addCorporalPerception(User? currentUser) async {
    if (currentUser == null) {
      print('User is not logged in.');
      return;
    }

    var gustos_corporales = [
      cuerpo1.text.trim(),
      cuerpo2.text.trim(),
      cuerpo3.text.trim()
    ];

    print('Periodicidad de vista al espejo: ${periodicidad}');
    print('Primera cosa al espejo: ${cosa_al_espejo.text.trim()}');
    print('Cosas que me gustan de mi cuerpo: ${gustos_corporales.toString()}');
    print('Cosa que no me gusta de mi cuerpo: ${no_me_gusta.text.trim()}');

    try {
      DocumentReference userDocRef =
          database.collection('users').doc(currentUser.uid);

      await userDocRef
          .collection('initial_diagnostic')
          .doc('body_perception')
          .set({
        'periodicidad de vista al espejo': periodicidad,
        'primera cosa que nota al verse al espejo': cosa_al_espejo.text.trim(),
        'cosas que me gustan de mi cuerpo': gustos_corporales.toString(),
        'no me gusta de mi cuerpo': no_me_gusta.text.trim(),
      });

      print('User data sent successfully!');
    } catch (error) {
      print('Hubo un error al mandar la información: $error.');
    }
  }

  Future<void> sendData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await _addCorporalPerception(user);
    } catch (error) {
      print('Encountered an error sending data: $error.');
    }
  }

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
                    dropdownColor: green,
                    textColor: deepTurquoise,
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
                          dwidth: 100,
                          controller: cuerpo1,
                          label: 'cosa 1',
                          filled: true),
                      shortTextField(
                          dwidth: 100,
                          controller: cuerpo2,
                          label: 'cosa 2',
                          filled: true),
                      shortTextField(
                          dwidth: 100,
                          controller: cuerpo3,
                          label: 'cosa 3',
                          filled: true),
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
                    filled: true),
                ElevatedButton(
                  onPressed: sendData,
                  child: Text(
                    'Send data',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(deepTurquoise)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
