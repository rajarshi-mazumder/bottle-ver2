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
import '../playerWidgets/playerDisplayWidget.dart';

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
      child: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [secondaryColor, bgPrimaryColor])),
            width: MediaQuery.of(context).size.width * 0.6,
            margin: EdgeInsets.only(bottom: 150),
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GridView.builder(
                    itemCount: players.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PlayerDisplayWidget(
                          agentImgUrl:
                              "valoImages/valoAgentBodyImgs/resized/${players[index].mainAgent}.png",
                          isMVP: index == 0 ? true : false,
                          name: players[index].name!);
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
