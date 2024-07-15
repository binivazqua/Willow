import 'package:bejoy/pages/foodlog/components/equivalentModel.dart';
import 'package:bejoy/pages/foodlog/components/equivalentTile.dart';
import 'package:bejoy/pages/foodlog/mealPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class foodHome extends StatelessWidget {
  const foodHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add_circle_rounded,
            color: Colors.white,
          ),
          onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return mealPage();
              }))),
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
            Expanded(child: Consumer<Equivalent>(
              builder: (context, value, child) {
                return GridView.builder(
                    itemCount: value.equivalents.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return EquivalentTile(
                          onP: () {},
                          equivName: value.equivalents[index][0],
                          description: value.equivalents[index][1],
                          iconPath: value.equivalents[index][2],
                          color: value.equivalents[index][3]);
                    });
              },
            ))
          ],
        ),
      ),
    );
  }
}
