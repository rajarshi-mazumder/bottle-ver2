import 'package:flutter/material.dart';

class GameProfileLeftSection extends StatefulWidget {
  const GameProfileLeftSection({super.key});

  @override
  State<GameProfileLeftSection> createState() => _GameProfileLeftSectionState();
}

class _GameProfileLeftSectionState extends State<GameProfileLeftSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: [Text("Some text"), Text("Some more text")],
        ),
      ),
    );
  }
}
