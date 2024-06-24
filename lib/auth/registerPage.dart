import 'package:bejoy/auth/loginPage.dart';
import 'package:bejoy/components/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  // text controllers:
  TextEditingController _name = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmedpassword = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _lastname.dispose();
    _email.dispose();
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  // SEND DATA METHOD:
  Future addUserDetails(User? user) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'first name': _name.text.trim(),
        'last name': _lastname.text.trim(),
        'nickname': _username.text.trim(),
        'email': _email.text.trim(),
        'password': _confirmedpassword.text.trim(),
      });
      print('User data has been sent successfully!');
    } catch (error) {
      print('Error creating user: $error');
    }
  }

  // SIGN UP METHOD
  Future signUp() async {
    if (passwordConfirmed()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(),
          password: _password.text.trim(),
        );

        // IF SUCCESSFUL, THEN SEND USER DATA:
        User? newUser = userCredential.user;

        print('User data has been saved!');
        String username = _username.text.toString();
        String new_message = 'Congratulations $username!';

        setState(() {
          _message = new_message;
          account = 'Your acount has been created successfully';
        });

        try {
          addUserDetails(newUser);
        } catch (error) {
          print('Error sending user data: $error');
        }
      } catch (error) {
        print('Error creating user: $error');
      }
    } else {
      String _error_message =
          'Your password does not match. Please try again, ${_username.text.trim()}';

      setState(() {
        _message = _error_message;
      });
      print('Passwords do not match.');
    }
  }

  bool passwordConfirmed() {
    if (_password.text.trim() == _confirmedpassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  String _message = '';
  String account = '';

  @override
  Widget build(BuildContext context) {
    void registerRetro() {
      String username = _username.text.toString();
      String new_message = 'Congratulations $username!';

      setState(() {
        _message = new_message;
        account = 'Your acount has been created successfully';
      });
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿Nuevo aquí?',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Solo hacen falta un par de datos',
                  softWrap: true,
                ),
                Text('para empezar a fluir...'),
                SizedBox(
                  height: 20,
                ),
                textField(
                    hintDesiredText: 'Primer nombre',
                    controller: _name,
                    obscureText: false),
                textField(
                    hintDesiredText: 'Apellido',
                    controller: _lastname,
                    obscureText: false),
                textField(
                    hintDesiredText: 'Me gusta que me llamen...',
                    controller: _username,
                    obscureText: false),
                textField(
                    hintDesiredText: 'Email',
                    controller: _email,
                    obscureText: false),
                textField(
                    hintDesiredText: 'Contraseña',
                    controller: _password,
                    obscureText: false),
                textField(
                    hintDesiredText: 'Confirma tu contraseña',
                    controller: _confirmedpassword,
                    obscureText: false),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: signUp,
                      child: Text(
                        'Register me!',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: WidgetStateColor.resolveWith(
                        (states) => Color.fromARGB(150, 205, 51, 255),
                      )),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginPagee()));
                        },
                        child: const Text('Go to login!')),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    '$_message. $account',
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
