import 'package:bejoy/pages/foodlog/components/equivalentTile.dart';
import 'package:flutter/material.dart';

class foodHome extends StatelessWidget {
  const foodHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 50),
              child: Text(
                'Hi, User!',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text('Start adding your equivs!'),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text('Food Equivalents'),
            ),
            /*
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return EquivalentTile();
              },
            ))*/
          ],
        ),
      ),
    );
  }
}
