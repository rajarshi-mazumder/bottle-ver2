import 'package:bottle_ver2/screens/gameProfileWidgets/careerSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileRightSectionWidgets/gameProfileStatSections.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileRightSectionWidgets/valorantSkillsSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/playerCardWidgets/valorantPlayerCardWidgets.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentDetailsWidgets/tournamentIndividualSection.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentDetailsWidgets/tournamentSectionItemWidgets.dart';
import 'package:bottle_ver2/sharedWidgets/utilityWidgets/customDropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../themes/themes.dart';

class TeamPlayersSection extends StatefulWidget {
  const TeamPlayersSection({
    super.key,
  });

  @override
  State<TeamPlayersSection> createState() => _TeamPlayersSectionState();
}

class _TeamPlayersSectionState extends State<TeamPlayersSection> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [secondaryColor, bgPrimaryColor])),
          width: MediaQuery.of(context).size.width * 0.6,
          margin: EdgeInsets.only(bottom: 150),
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return PlayerDisplayWidget(
                    agentImgUrl: index % 2 == 0
                        ? "valoImages/valoAgentBodyImgs/resized/chamber.jpg"
                        : "valoImages/valoAgentBodyImgs/resized/jett.webp",
                  );
                }),
              ),
            ],
          )),
    );
  }
}

class PlayerDisplayWidget extends StatelessWidget {
  PlayerDisplayWidget({super.key, required this.agentImgUrl});

  String agentImgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: bgSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      width: 250,
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
              agentImgUrl,
              width: 250,
              height: 296,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 1),
                      Color.fromRGBO(0, 0, 0, 0)
                    ])),
          ),
        ),
        Positioned(
          bottom: 100,
          child: Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 1)
                  ]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 100,
            width: 250,
            padding: EdgeInsets.only(bottom: 4, left: 4, right: 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 1),
                    Color.fromRGBO(0, 0, 0, 0.7)
                  ]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
          ),
        ),
        Positioned(
            top: 250,
            child: Container(
              constraints: BoxConstraints(minHeight: 50),
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Yay",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            )), // Player name
      ]),
    );
  }
}
