// import 'package:bottle_ver2/screens/teamsWidgets/teamDetailWidgets/teamSectionItemWidgets.dart';
// import 'package:bottle_ver2/screens/tournamentWidgets/TournamentTile.dart';
import 'package:bottle_ver2/themes/spacing.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:bottle_ver2/views/screens/teamsWidgets/teamDetailWidgets/teamSectionItemWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:material_symbols_icons/symbols.dart';

// import '../tournamentWidgets/tournamentDetailsWidgets/tournamentSectionItemWidgets.dart';

class TeamDetailsLeftSection extends StatefulWidget {
  TeamDetailsLeftSection({super.key});

  @override
  State<TeamDetailsLeftSection> createState() => _TeamDetailsLeftSectionState();
}

class _TeamDetailsLeftSectionState extends State<TeamDetailsLeftSection> {
  @override
  Widget build(BuildContext context) {
    CustomSpacing customSpacing = CustomSpacing(context: context);
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: customSpacing.leftSideWidth, maxHeight: 600),
        child: SingleChildScrollView(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [secondaryColor, bgPrimaryColor]),
              ),
              constraints: BoxConstraints(minHeight: 200),
              // height: 500,
              width: customSpacing.leftSideWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(minHeight: 200),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  "orgPics/optic.jpeg",
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Optic Gaming",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TeamDetailItemShort(
                                  labelText: "Game",
                                  descriptionWidget: Text("Valorant"),
                                  labelWidget: Image.asset(
                                    "gameLogos/valorant-logo.webp",
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.cover,
                                  )),
                              TeamDetailItemShort(
                                labelText: "Region",
                                descriptionWidget: Image.asset(
                                  "flags/us.png",
                                  height: 15,
                                ),
                                labelWidget: Icon(CupertinoIcons.globe),
                              )
                            ],
                          ),
                          SectionDivider(),
                          TeamDetailItemLong(
                              labelText: "Players: ",
                              descriptionText: "6",
                              labelWidget: Icon(
                                  CupertinoIcons.person_2_square_stack_fill)),
                          SizedBox(height: 20),
                          TeamDetailItemLong(
                              labelText: "Coach: ",
                              descriptionText: "Chet Singh",
                              labelWidget: Icon(CupertinoIcons.person_2_fill)),
                          SectionDivider(),
                        ],
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 20),
                  //     child: Column(
                  //       children: [
                  //         TournamentSectionButton(
                  //           buttonText: "Apply ",
                  //           onPressed: () {},
                  //         ),
                  //         SizedBox(height: 10),
                  //         TournamentSectionButton(
                  //           buttonText: "Shop ",
                  //           onPressed: () {},
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
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
            indent: 5,
            endIndent: 5,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
