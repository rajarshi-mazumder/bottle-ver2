import 'package:bottle_ver2/sharedWidgets/navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
      ),
    );
  }
}
