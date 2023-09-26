import 'package:bottle_ver2/sharedWidgets/utilityWidgets/customDropdown.dart';
import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class GameProfileRightSection extends StatefulWidget {
  const GameProfileRightSection({super.key});

  @override
  State<GameProfileRightSection> createState() =>
      _GameProfileRightSectionState();
}

class _GameProfileRightSectionState extends State<GameProfileRightSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [secondaryColor, bgPrimaryColor])),
            width: 800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomDropdown(),
                ),
                Container(
                  height: 1200,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
