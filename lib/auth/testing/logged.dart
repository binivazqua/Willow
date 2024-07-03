import 'package:bejoy/data/tabs/tabs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loggedPage extends StatefulWidget {
  const loggedPage({super.key});

  @override
  State<loggedPage> createState() => _loggedPageState();
}

class _loggedPageState extends State<loggedPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('signed in as ${user?.email}'),
              MaterialButton(
                  color: Colors.purple,
                  child: Text('Sign Out'),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  }),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => userDiagnosticTest()));
                },
                color: Colors.purple,
                child: Text('Go to data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
