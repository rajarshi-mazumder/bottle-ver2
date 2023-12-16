import 'package:bottle_ver2/screens/gameProfileWidgets/careerSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileRightSectionWidgets/gameProfileStatSections.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileRightSectionWidgets/valorantSkillsSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/playerCardWidgets/valorantPlayerCardWidgets.dart';
import 'package:bottle_ver2/sharedWidgets/utilityWidgets/customDropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class GameProfileRightSection extends StatefulWidget {
  const GameProfileRightSection({
    super.key,
  });

  @override
  State<GameProfileRightSection> createState() =>
      _GameProfileRightSectionState();
}

class _GameProfileRightSectionState extends State<GameProfileRightSection> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [secondaryColor, bgPrimaryColor])),
        width: MediaQuery
            .of(context)
            .size
            .width * 0.5,

        margin: EdgeInsets.only(bottom: 150),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomDropdown(),
            ),
            Container(
              constraints: BoxConstraints(minHeight: 500),
              child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    children: [
                      GameProfileStatSection(
                        label: "About : ",
                        labelIcon: Icon(Icons.info),
                        contentWidget: Text(
                            """I am Illya, also known as Something. I have been playing Valorant professionally for a long time now, previously with Sengoku Gaming, Japan, and now with Paper Rex, Singapore."""),
                      ),
                      SizedBox(height: 20),
                      GameProfileStatSection(
                          label: "Skills :",
                          labelIcon: Icon(Icons.school),
                          contentWidget: ValorantSkillsSection()),
                      SizedBox(height: 20),
                      GameProfileStatSection(
                          label: "Experience/ Career :",
                          labelIcon: Icon(Icons.corporate_fare),
                          contentWidget: CareerSection()),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
