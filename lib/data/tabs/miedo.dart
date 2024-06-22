import 'package:bejoy/components/userData/dropDown.dart';
import 'package:bejoy/components/userData/shortTextField.dart';
import 'package:flutter/material.dart';

class miedoSintomas extends StatefulWidget {
  const miedoSintomas({super.key});

  @override
  State<miedoSintomas> createState() => _miedoSintomasState();
}

class _miedoSintomasState extends State<miedoSintomas> {
  final TextEditingController _comer1 = TextEditingController();
  final TextEditingController _comer2 = TextEditingController();
  final TextEditingController _comer3 = TextEditingController();

  final TextEditingController _nomerecedora = TextEditingController();
  final TextEditingController _porquenomerecedora = TextEditingController();

  final TextEditingController _alimentomiedo = TextEditingController();
  final TextEditingController _porquemiedoalimento = TextEditingController();

  final List<String> merecedora = ['Sí', 'No', ''];
  String _default1 = '';
  String _default2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
                defaultValue: _default1,
                list: merecedora,
                theme: 'Sí o No',
                width: 310,
                textColor: Colors.purple,
                onChanged: (p0) => {_default1 = p0!},
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
                defaultValue: _default2,
                textColor: Colors.purple,
                list: merecedora,
                theme: 'Sí o No',
                width: 310,
                onChanged: (p0) => {_default2 = p0!},
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
                          filled: true)
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
