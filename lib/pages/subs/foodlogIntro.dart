import 'package:bejoy/components/userData/turquoiseButton.dart';
import 'package:bejoy/pages/subs/foodlogHome.dart';
import 'package:bejoy/pages/subs/mealLog.dart';
import 'package:flutter/material.dart';

class foodlogPage extends StatelessWidget {
  const foodlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200, bottom: 50),
            child: Image(
                width: 200,
                image: AssetImage(
                    'lib/design/images/foodlog/lista-de-quehaceres.png')),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Text(
                    'Welcome to your diary food log!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Here you will track your food equivalents in order to nurture your body in a structured and chill way.')
                ],
              )),
          SizedBox(
            height: 80,
          ),
          Turquoisebutton(
            txt: 'Go to log',
            op: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MealLogPage()));
            },
          ),
        ],
      ),
    );
  }
}
