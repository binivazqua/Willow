import 'package:bejoy/data/tabs/familiar.dart';
import 'package:bejoy/data/tabs/fisica.dart';
import 'package:bejoy/data/tabs/general.dart';
import 'package:bejoy/data/tabs/miedo.dart';
import 'package:bejoy/data/tabs/profesionalPsic.dart';
import 'package:flutter/material.dart';

class userDiagnosticTest extends StatefulWidget {
  const userDiagnosticTest({super.key});

  @override
  State<userDiagnosticTest> createState() => _userDiagnosticTestState();
}

class _userDiagnosticTestState extends State<userDiagnosticTest> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
              title: Text('Initial Diagnostic'),
              backgroundColor: Colors.purple[200],
              bottom: TabBar(
                dividerHeight: 3,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.health_and_safety_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.health_and_safety_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.health_and_safety_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.health_and_safety_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.health_and_safety_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
          body: TabBarView(children: [
            percepcionGeneral(),
            percepcionFamiliar(),
            profesionalPsic(),
            percepcionFisica(),
            miedoSintomas(),
          ]),
        ));
  }
}
