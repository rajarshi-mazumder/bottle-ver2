import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileLeftSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileRightSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileTopSection.dart';
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
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                GameProfileTopSection(),
                Container(
                  width: 900,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 200, top: 70),
                              child: GameProfileRightSection()),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(top: 120, left: 350, child: GameProfileLeftSection()),
        ],
      ),
    );
  }
}
