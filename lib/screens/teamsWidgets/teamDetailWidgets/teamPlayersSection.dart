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
        width: MediaQuery.of(context).size.width * 0.5,
        constraints: BoxConstraints(minHeight: 900),
        margin: EdgeInsets.only(bottom: 150),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              constraints: BoxConstraints(minHeight: 500),
              child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(minHeight: 200),
                        decoration: BoxDecoration(
                            color: bgSecondaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            ClipRRect(
                                child: Image.asset(
                                  "playerImgs/optic/yay.jpg",
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            SizedBox(width: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 75,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Name: Yay"),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 75,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Most played roles :"),
                                          SizedBox(width: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ValorantRole(
                                                iconUrl:
                                                    "https://static.wikia.nocookie.net/valorant/images/f/fd/DuelistClassSymbol.png",
                                                iconTitle: "Duelist",
                                                value: 0,
                                                radius: 40,
                                                showLabel: false,
                                                showProgressBar: false,
                                              ),
                                              SizedBox(width: 20),
                                              ValorantRole(
                                                iconUrl:
                                                    "https://static.wikia.nocookie.net/valorant/images/4/43/SentinelClassSymbol.png",
                                                iconTitle: "Sentinel",
                                                value: 0,
                                                radius: 40,
                                                showLabel: false,
                                                showProgressBar: false,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 75,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Region: NA"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text("Most played agents :"),
                                              SizedBox(width: 10),
                                              Row(
                                                children: [
                                                  ValorantAgents(
                                                    agentImgUrl:
                                                        "https://cdn.mobalytics.gg/assets/valorant/images/agents/icons/jett.png",
                                                    iconTitle: "Duelist",
                                                    value: 0,
                                                    radius: 40,
                                                    showLabel: false,
                                                  ),
                                                  SizedBox(width: 20),
                                                  ValorantAgents(
                                                    agentImgUrl:
                                                        "https://static.wikia.nocookie.net/valorant/images/0/09/Chamber_icon.png",
                                                    iconTitle: "Duelist",
                                                    value: 0,
                                                    radius: 40,
                                                    showLabel: false,
                                                  ),
                                                  SizedBox(width: 20),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      TournamentIndividualSection(
                          label: "Partners :",
                          labelIcon: Icon(Icons.support_rounded),
                          contentWidget: Container(
                            constraints: BoxConstraints(minHeight: 50),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TournamentSponsor(
                                      descriptionText: "Riot Games",
                                      labelWidget: Image.asset(
                                        "orgPics/riot_games.png",
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      textFontSize: 16,
                                    ),
                                    TournamentSponsor(
                                      descriptionText: "Monster",
                                      labelWidget: Image.asset(
                                        "companyLogos/monster.png",
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      textFontSize: 16,
                                    ),
                                    TournamentSponsor(
                                      descriptionText: "Secret Lab",
                                      labelWidget: Image.asset(
                                        "companyLogos/SecretLab_Logo.png",
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      textFontSize: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
