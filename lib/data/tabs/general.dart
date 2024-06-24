import 'package:bejoy/components/userData/longTextField.dart';
import 'package:bejoy/components/userData/shortTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future _sendAtributos() async {
    print('atributo 1: ${atribute1.text}');
    print('atributo 2: ${atribute2.text}');
    print('atributo 3: ${atribute3.text}');
    print('mejor rasgo: ${mejor_rasgo.text}');
    print('comer es: ${comer_es.text}');
    print('comer se siente: ${comer_se_siente.text}');
    print('comer comoda: ${comer_comoda.text}');

    try {
      await database.collection('initial_diagnostic').add({
        'atributo 1': atribute1.text.trim(),
        'atributo 2': atribute2.text.trim(),
        'atributo 3': atribute3.text.trim(),
        'mejor rasgo': mejor_rasgo.text.trim(),
        'comer es': comer_es.text.trim(),
        'comer se siente': comer_se_siente.text.trim(),
        'comer comoda': comer_comoda.text.trim(),
      });
      print('User data sent.');
    } catch (error) {
      print('Error sending data: $error.');
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
                    label: 'hh',
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
                          fillColor: Colors.white,
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
                  controller: comer_comoda,
                  label: '',
                  fillColor: Colors.white,
                  filled: true),
              ElevatedButton(
                  onPressed: _sendAtributos, child: Text('Send atributos'))
            ],
          ),
        ),
      )),
    );
  }
}
