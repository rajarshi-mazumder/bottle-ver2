import 'package:flutter/material.dart';

import '../../../themes/themes.dart';
import '../playerCardWidgets/valorantPlayerCardWidgets.dart';

class ValorantSkillsSection extends StatelessWidget {
  ValorantSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        constraints: BoxConstraints(minHeight: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValorantRole(
                  iconUrl:
                      "https://static.wikia.nocookie.net/valorant/images/f/fd/DuelistClassSymbol.png",
                  iconTitle: "Duelist",
                  value: 0.5,
                  radius: 80,
                ),
                ValorantRole(
                  iconUrl:
                      "https://static.wikia.nocookie.net/valorant/images/7/77/InitiatorClassSymbol.png",
                  iconTitle: "Initiator",
                  value: 0.9,
                  radius: 80,
                ),
                ValorantRole(
                  iconUrl:
                      "https://static.wikia.nocookie.net/valorant/images/0/04/ControllerClassSymbol.png",
                  iconTitle: "Controller",
                  value: 0.4,
                  radius: 80,
                ),
                ValorantRole(
                  iconUrl:
                      "https://static.wikia.nocookie.net/valorant/images/4/43/SentinelClassSymbol.png",
                  iconTitle: "Sentinel",
                  value: 0.3,
                  radius: 80,
                ),
              ],
            ),
            SectionDivider(),
            Row(
              children: [
                Icon(Icons.headphones),
                SizedBox(width: 10),
                Text("Communication Level : ")
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                Positioned(
                  top: 2.5,
                  left: 2.5,
                  child: Container(
                    height: 5,
                    width: MediaQuery.of(context).size.width *
                        0.4 *
                        0.99 *
                        0.6, // 0.6 is the value
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
              ],
            ),
            SectionDivider(),
            Row(
              children: [
                Icon(Icons.sticky_note_2_sharp),
                SizedBox(width: 10),
                Text("Additional info : ")
              ],
            ),
            SizedBox(height: 20),
            Text(
                "I can play both duelist and initiator at a very high level. My favorite agents are Reyna, Jett and Breach")
          ],
        ),
      ),
    );
  }
}

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Column(
        children: [
          SizedBox(height: 20),
          Divider(
            height: 1,
            color: bgTertiaryColor,
            indent: 10,
            endIndent: 10,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
