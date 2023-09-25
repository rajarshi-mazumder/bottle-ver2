import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileLeftSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileRightSection.dart';
import 'package:flutter/material.dart';

class GameProfileScreen extends StatefulWidget {
  const GameProfileScreen({super.key});

  @override
  State<GameProfileScreen> createState() => _GameProfileScreenState();
}

class _GameProfileScreenState extends State<GameProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GameProfileLeftSection(),
          SizedBox(width: 40),
          GameProfileRightSection()
        ],
      ),
    );
  }
}
