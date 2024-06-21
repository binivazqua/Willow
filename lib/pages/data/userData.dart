import 'package:bejoy/components/textField.dart';
import 'package:bejoy/pages/data/tabs/tabs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class userData extends StatefulWidget {
  const userData({super.key});

  @override
  State<userData> createState() => _userDataState();
}

class _userDataState extends State<userData> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _diagnostic = TextEditingController();
  final TextEditingController _color = TextEditingController();

  Future addUserDetails() async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'first name': _name.text.trim(),
        'last name': _lastname.text.trim(),
        'age': _age.text.trim(),
        'color': _gender.text.trim(),
        'gender': _color.text.trim(),
      });
      print('User data has been sent successfully!');
    } catch (error) {
      print('Error creating user: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Fill in some data!'),
              SizedBox(height: 20),
              textField(
                  hintDesiredText: 'first name',
                  controller: _name,
                  obscureText: false),
              textField(
                  hintDesiredText: 'lastname',
                  controller: _lastname,
                  obscureText: false),
              textField(
                  hintDesiredText: 'age', controller: _age, obscureText: false),
              textField(
                  hintDesiredText: 'gender',
                  controller: _gender,
                  obscureText: false),
              textField(
                  hintDesiredText: 'diagnostic',
                  controller: _diagnostic,
                  obscureText: false),
              textField(
                  hintDesiredText: 'favorite color',
                  controller: _color,
                  obscureText: false),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: addUserDetails,
                    child: Text(
                      'Send Data',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.deepPurple)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => userDiagnosticTest()));
                    },
                    child: Text(
                      'Go!',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.deepPurple)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
