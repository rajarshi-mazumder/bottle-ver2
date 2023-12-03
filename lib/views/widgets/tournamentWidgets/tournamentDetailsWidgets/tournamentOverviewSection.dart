// import 'package:bottle_ver2/screens/gameProfileWidgets/careerSection.dart';
// import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileRightSectionWidgets/gameProfileStatSections.dart';
// import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileRightSectionWidgets/valorantSkillsSection.dart';
// import 'package:bottle_ver2/screens/gameProfileWidgets/playerCardWidgets/valorantPlayerCardWidgets.dart';
// import 'package:bottle_ver2/screens/tournamentWidgets/tournamentDetailsWidgets/tournamentIndividualSection.dart';
// import 'package:bottle_ver2/screens/tournamentWidgets/tournamentDetailsWidgets/tournamentSectionItemWidgets.dart';
// import 'package:bottle_ver2/sharedWidgets/utilityWidgets/customDropdown.dart';
// import 'package:bottle_ver2/views/screens/tournamentWidgets/tournamentDetailsWidgets/tournamentIndividualSection.dart';
// import 'package:bottle_ver2/views/screens/tournamentWidgets/tournamentDetailsWidgets/tournamentSectionItemWidgets.dart';
import 'package:bottle_ver2/views/widgets/tournamentWidgets/tournamentDetailsWidgets/tournamentIndividualSection.dart';
import 'package:bottle_ver2/views/widgets/tournamentWidgets/tournamentDetailsWidgets/tournamentSectionItemWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

// import '../../../themes/themes.dart';

class TournamentOverviewSection extends StatefulWidget {
  const TournamentOverviewSection({
    super.key,
  });

  @override
  State<TournamentOverviewSection> createState() =>
      _TournamentOverviewSectionState();
}

class _TournamentOverviewSectionState extends State<TournamentOverviewSection> {
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
                      TournamentIndividualSection(
                          label: "Details :",
                          labelIcon: Icon(Icons.insert_chart),
                          contentWidget: Container(
                            constraints: BoxConstraints(minHeight: 120),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TournamentDetailItemShort(
                                      labelText: "Game",
                                      descriptionText: "Valorant",
                                      labelWidget: Image.asset(
                                        "gameLogos/valorant-logo.webp",
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                      textFontSize: 16,
                                    ),
                                    TournamentDetailItemShort(
                                      labelText: "Format",
                                      descriptionText: "Single Elimination",
                                      labelWidget: Image.asset(
                                        "customIcons/tournament_format.png",
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      textFontSize: 16,
                                    ),
                                    TournamentDetailItemShort(
                                      labelText: "No of teams",
                                      descriptionText: "8",
                                      labelWidget: Icon(
                                        CupertinoIcons
                                            .person_2_square_stack_fill,
                                        size: 40,
                                      ),
                                      textFontSize: 16,
                                    ),
                                    TournamentDetailItemShort(
                                      labelText: "Team Size",
                                      descriptionText: "5 v 5",
                                      labelWidget: Icon(
                                        Icons.group_work,
                                        size: 40,
                                      ),
                                      textFontSize: 16,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: TournamentDetailItemShort(
                                        labelText: "Prize Pool",
                                        descriptionText: "\$100000",
                                        labelWidget: Icon(
                                          Icons.monetization_on,
                                          size: 40,
                                        ),
                                        textFontSize: 16,
                                      ),
                                    ),
                                    TournamentDetailItemShort(
                                      labelText: "Region",
                                      descriptionText: "Global",
                                      labelWidget: Icon(
                                        CupertinoIcons.globe,
                                        size: 40,
                                      ),
                                      textFontSize: 16,
                                    ),
                                    TournamentDetailItemShort(
                                      labelText: "Schedule",
                                      descriptionText:
                                          "23rd Oct - 3rd Nov 2023",
                                      labelWidget: Icon(
                                        CupertinoIcons.calendar,
                                        size: 40,
                                      ),
                                      textFontSize: 16,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
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
                      SizedBox(height: 30),
                      TournamentIndividualSection(
                        label: "About : ",
                        labelIcon: Icon(Icons.info_rounded),
                        contentWidget: Text(
                          """VCT Masters is the coveted trophy that determines who the best Valorant team in the world is ! Winner also gets a reserved slot at VCT Champions later this year! 8 Low Seed teams, Each group has 4 teams. All matches are Bo3. Top 2 teams from each group advance to the Playoffs. Three best-placed EMEA teams qualify to Champions '23""",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
