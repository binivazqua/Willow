import 'dart:ffi';

import 'package:bejoy/components/userData/longTextField.dart';
import 'package:bejoy/components/userData/shortTextField.dart';
import 'package:bejoy/design/colors/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class percepcionGeneral extends StatefulWidget {
  const percepcionGeneral({super.key});

  @override
  State<percepcionGeneral> createState() => _percepcionGeneralState();
}

class _percepcionGeneralState extends State<percepcionGeneral> {
  TextEditingController atribute1 = new TextEditingController();
  TextEditingController atribute2 = new TextEditingController();
  TextEditingController atribute3 = new TextEditingController();
  TextEditingController mejor_rasgo = new TextEditingController();
  TextEditingController comer_es = new TextEditingController();
  TextEditingController comer_se_siente = new TextEditingController();
  TextEditingController comer_comoda = new TextEditingController();
  TextEditingController cambiar_algo = new TextEditingController();

  @override
  void dispose() {
    atribute1.dispose();
    atribute2.dispose();
    atribute3.dispose();
    mejor_rasgo.dispose();
    comer_es.dispose();
    comer_se_siente.dispose();
    comer_comoda.dispose();

    super.dispose();
  }

  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<void> _sendAtributos(User? currentUser) async {
    if (currentUser == null) {
      print('User is not logged in.');
      return;
    }

    var atributos = [
      atribute1.text.trim(),
      atribute2.text.trim(),
      atribute3.text.trim(),
    ];

    print('atributos: ${atributos.toString()}');
    print('mejor rasgo: ${mejor_rasgo.text}');
    print('comer es: ${comer_es.text}');
    print('comer se siente: ${comer_se_siente.text}');
    print('para comer comoda necesito: ${comer_comoda.text}');
    print('si pudiera cambiar algo de mi, sería: ${cambiar_algo.text}');

    try {
      // Reference the user's document
      DocumentReference userDocRef =
          database.collection('users').doc(currentUser.uid);

      // Add data to the 'general perception' subcollection
      await userDocRef
          .collection('initial_diagnostic')
          .doc('general_perception')
          .set({
        'atributos': atributos,
        'rasgo mas preciado': mejor_rasgo.text.trim(),
        'comer es': comer_es.text.trim(),
        'comer se siente': comer_se_siente.text.trim(),
        'para comer comoda necesito': comer_comoda.text.trim(),
        'si pudiera cambiar algo de mi, sería': cambiar_algo.text.trim(),
      });

      print('User data sent.');
    } catch (error) {
      print('Error sending data: $error.');
    }
  }

  Future<void> sendDataCholo() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await _sendAtributos(user);
    } catch (error) {
      print('Encountered an error sending data: $error.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text('Enlista 3 atributos que mejor te describan: '),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    shortTextField(
                      filled: true,
                      controller: atribute1,
                      label: '',
                      fillColor: Colors.purple[100],
                    ),
                    shortTextField(
                      controller: atribute2,
                      label: '',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    shortTextField(
                      filled: true,
                      controller: atribute3,
                      label: '',
                      fillColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text('¿Cuál es el rasgo que más aprecias de ti?'),
                SizedBox(height: 10),
                longTextField(
                    controller: mejor_rasgo,
                    label: '',
                    fillColor: Colors.white,
                    filled: true),
                Text('Completa:'),
                SizedBox(height: 5),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('Comer es...'),
                        SizedBox(
                          height: 15,
                        ),
                        shortTextField(
                            controller: comer_es,
                            label: '',
                            fillColor: Colors.white,
                            filled: true)
                      ],
                    ),
                    Column(
                      children: [
                        Text('Comer se siente...'),
                        SizedBox(
                          height: 15,
                        ),
                        shortTextField(
                            controller: comer_se_siente,
                            label: '',
                            filled: true)
                      ],
                    )
                  ],
                ),
                Text(
                  'Para que yo me sienta cómoda al comer, necesito...',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                longTextField(
                    controller: comer_comoda,
                    label: '',
                    fillColor: Colors.white,
                    filled: true),
                Text(
                  'Si pudieras cambiar algo de ti... ¿Qué sería?',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                longTextField(
                    controller: cambiar_algo,
                    label: '',
                    fillColor: Colors.white,
                    filled: true),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(deepTurquoise)),
                    onPressed: sendDataCholo,
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
