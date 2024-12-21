import 'package:bejoy/pages/foodlog/components/models/user.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  MyUser user = MyUser(n: "Panchita", g: "female");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [Text(user.name), Text(user.gender)],
      ),
    ));
  }
}
