import 'package:bejoy/auth/loginPage.dart';
import 'package:bejoy/auth/testing/logged.dart';
import 'package:bejoy/pages/foodlog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authVerif extends StatelessWidget {
  const authVerif({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('User signed in!');
            //return loggedPage();
            return foodlogPage();
          } else {
            print('User not signed in!');
            return loginPagee();
          }
        },
      ),
    );
  }
}
