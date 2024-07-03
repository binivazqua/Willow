import 'package:bejoy/data/tabs/corporal.dart';
import 'package:bejoy/data/tabs/familiar.dart';
import 'package:bejoy/data/tabs/perfil.dart';
import 'package:bejoy/data/tabs/general.dart';
import 'package:bejoy/data/tabs/miedo.dart';
import 'package:bejoy/data/tabs/profesionalPsic.dart';
import 'package:bejoy/design/colors/palette.dart';
import 'package:flutter/material.dart';

class userDiagnosticTest extends StatefulWidget {
  const userDiagnosticTest({super.key});

  @override
  State<userDiagnosticTest> createState() => _userDiagnosticTestState();
}

class _userDiagnosticTestState extends State<userDiagnosticTest> {
  Color iconColor = Colors.white;
  Color tappedColor = deepTurquoise;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
              title: Text('Initial Diagnostic'),
              backgroundColor: lightTurquoise,
              bottom: TabBar(
                dividerHeight: 3,
                tabAlignment: TabAlignment.center,
                overlayColor: WidgetStatePropertyAll(turquoise),
                dividerColor: turquoise,
                indicatorColor: deepTurquoise,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.health_and_safety_rounded,
                      color: iconColor,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.health_and_safety_rounded,
                      color: iconColor,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.health_and_safety_rounded,
                      color: iconColor,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.health_and_safety_rounded,
                      color: iconColor,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.health_and_safety_rounded,
                      color: iconColor,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.health_and_safety_rounded,
                      color: iconColor,
                    ),
                  ),
                ],
              )),
          body: TabBarView(children: [
            percepcionGeneral(),
            percepcionCorporal(),
            percepcionFamiliar(),
            miedoSintomas(),
            perfilABA(),
            profesionalPsicFis(),
          ]),
        ));
  }
}
