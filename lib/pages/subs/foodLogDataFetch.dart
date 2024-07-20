import 'package:bejoy/components/textField.dart';
import 'package:bejoy/components/userData/shortTextField.dart';
import 'package:flutter/material.dart';

class Foodlogdatafetch extends StatefulWidget {
  const Foodlogdatafetch({super.key});

  @override
  State<Foodlogdatafetch> createState() => _FoodlogdatafetchState();
}

class _FoodlogdatafetchState extends State<Foodlogdatafetch> {
  final TextEditingController oa_equivs_controller =
      new TextEditingController();
  final TextEditingController cereales_equivs_controller =
      new TextEditingController();
  final TextEditingController frutas_equivs_controller =
      new TextEditingController();
  final TextEditingController verduras_equivs_controller =
      new TextEditingController();
  final TextEditingController lacteos_equivs_controller =
      new TextEditingController();
  final TextEditingController leguminosas_equivs_controller =
      new TextEditingController();

  final TextEditingController grasas_equivs_controller =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Text(
                'What does your body need?',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Origen animal:'),
              SizedBox(
                height: 10,
              ),
              shortTextField(
                label: 'equivalents',
                controller: oa_equivs_controller,
                filled: false,
                dwidth: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Cereales:'),
              SizedBox(
                height: 10,
              ),
              shortTextField(
                label: 'equivalents',
                controller: cereales_equivs_controller,
                filled: false,
                dwidth: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Frutas:'),
              SizedBox(
                height: 10,
              ),
              shortTextField(
                label: 'equivalents',
                controller: frutas_equivs_controller,
                filled: false,
                dwidth: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Verduras:'),
              SizedBox(
                height: 10,
              ),
              shortTextField(
                label: 'equivalents',
                controller: verduras_equivs_controller,
                filled: false,
                dwidth: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Lacteos:'),
              SizedBox(
                height: 10,
              ),
              shortTextField(
                label: 'equivalents',
                controller: lacteos_equivs_controller,
                filled: false,
                dwidth: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Grasas:'),
              SizedBox(
                height: 10,
              ),
              shortTextField(
                label: 'equivalents',
                controller: grasas_equivs_controller,
                filled: false,
                dwidth: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Leguminosas'),
              SizedBox(
                height: 10,
              ),
              shortTextField(
                label: 'Leguminosas',
                controller: leguminosas_equivs_controller,
                filled: false,
                dwidth: 150,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
