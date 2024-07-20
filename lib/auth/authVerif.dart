import 'package:bejoy/auth/loginPage.dart';
import 'package:bejoy/auth/testing/logged.dart';
import 'package:bejoy/pages/foodlog/components/models/equivalentModel.dart';
import 'package:bejoy/pages/foodlog/components/tiles/equivalentTile.dart';
import 'package:bejoy/pages/subs/foodlogHome.dart';
import 'package:bejoy/pages/subs/foodlogIntro.dart';
import 'package:bejoy/pages/subs/mealLog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            //return foodlogPage();
            return ChangeNotifierProvider(
              create: (context) => Equivalent(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: foodlogPage(),
              ),
            );
          } else {
            print('User not signed in!');
            return loginPagee();
          }
        },
      ),
    );
  }
}
