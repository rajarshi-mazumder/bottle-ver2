import 'package:flutter/material.dart';

class GameProfileRightSection extends StatefulWidget {
  const GameProfileRightSection({super.key});

  @override
  State<GameProfileRightSection> createState() =>
      _GameProfileRightSectionState();
}

class _GameProfileRightSectionState extends State<GameProfileRightSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(color: Colors.yellow),
        child: Column(
          children: [Text("Some text"), Text("Some more text")],
        ),
      ),
    );
  }
}
