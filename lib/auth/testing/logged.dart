import 'package:bejoy/components/userData/turquoiseButton.dart';
import 'package:bejoy/data/tabs/tabs.dart';
import 'package:bejoy/design/colors/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loggedPage extends StatefulWidget {
  const loggedPage({super.key});

  @override
  State<loggedPage> createState() => _loggedPageState();
}

class _loggedPageState extends State<loggedPage> {
  final user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore database = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: AssetImage('lib/design/logos/willow_tree.png'),
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 50,
              ),
              Text('hi, ${user?.email}!'),
              SizedBox(
                height: 20,
              ),
              Text('We are just about to kickstart your journey!'),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please fill out the following diagnostic test so that our team can discover how to help you throught your process',
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              IntrinsicWidth(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Turquoisebutton(
                      txt: 'Sign out',
                      op: () {
                        FirebaseAuth.instance.signOut();
                      },
                    ),
                    Turquoisebutton(
                      txt: 'Go to test',
                      op: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => userDiagnosticTest()));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
