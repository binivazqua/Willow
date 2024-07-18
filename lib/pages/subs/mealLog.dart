import 'package:bejoy/pages/foodlog/components/models/mealLogModel.dart';
import 'package:bejoy/pages/foodlog/components/tiles/mealTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealLogPage extends StatelessWidget {
  const MealLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'This is your safe place!',
                style: TextStyle(fontSize: 25),
              ),
              Text('Start logging your meals...'),
              SizedBox(height: 20),
              Expanded(child: Consumer<Meal>(
                builder: (context, value, child) {
                  return ListView.builder(
                      itemCount: value.mealTimes.length,
                      itemBuilder: (context, index) {
                        return MealTile(
                            mealName: value.mealTimes[index][0],
                            iconPath: value.mealTimes[index][1],
                            color: value.mealTimes[index][2],
                            onP: () {});
                      });
                },
              ))
            ],
          ),
        ),
      )),
    );
  }
}
