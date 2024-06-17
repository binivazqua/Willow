
/*
import 'package:bejoy/components/logoTile.dart';
import 'package:bejoy/components/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterin/models/colorConstants.dart';
import 'package:flutterin/pages/subs/registerPage.dart';

class loginPagee extends StatefulWidget {
  const loginPagee({super.key});

  @override
  State<loginPagee> createState() => _loginPageeState();
}

class _loginPageeState extends State<loginPagee> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signInUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void _dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          // in Scaffold 'child' changes to 'body'.
          // ALIGN ITEMS -> CSS

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(0),
                child: Image(
                  image: AssetImage('lib/images/bee.png'),
                  width: 100,
                )),

            Text(
              'Bejoy',
              style: TextStyle(fontFamily: 'Kosugi', fontSize: 40),
            ),

            SizedBox(
              height: 20,
            ),

            const Text('Hello again!',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist',
                )),
            const Text('Login to Continue',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist',
                )),
            textField(
              hintDesiredText: 'Email',
              controller: _emailController,
              obscureText: false,
            ),
            textField(
              hintDesiredText: 'Password',
              controller: _passwordController,
              obscureText: true,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => registerPage()));
              },
              child: const Text(
                'New to Bejoy? Register!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Urbanist',
                ),
              ),
            ),

            //myButton(),

            ElevatedButton(
              onPressed: signInUser,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => colorConstants.yellowish)),
              child: const Text(
                'Go!',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),

            const Text(
              'or ontinue with',
              style: TextStyle(
                fontSize: 12,
                height: 3,
                fontFamily: 'Urbanist',
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logoTile(imagePath: 'lib/images/google.png'),
                SizedBox(width: 20.0),
                logoTile(imagePath: 'lib/images/apple.png')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/