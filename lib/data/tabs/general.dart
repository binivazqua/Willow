import 'package:bejoy/components/userData/longTextField.dart';
import 'package:bejoy/components/userData/shortTextField.dart';
import 'package:flutter/material.dart';

class percepcionGeneral extends StatefulWidget {
  const percepcionGeneral({super.key});

  @override
  State<percepcionGeneral> createState() => _percepcionGeneralState();
}

class _percepcionGeneralState extends State<percepcionGeneral> {
  final TextEditingController atribute1 = new TextEditingController();
  final TextEditingController atribute2 = new TextEditingController();
  final TextEditingController atribute3 = new TextEditingController();
  final TextEditingController mejor_rasgo = new TextEditingController();
  final TextEditingController comer_es = new TextEditingController();
  final TextEditingController comer_se_siente = new TextEditingController();
  final TextEditingController comer_comoda = new TextEditingController();

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
            ],
          ),
        ),
      )),
    );
  }
}
