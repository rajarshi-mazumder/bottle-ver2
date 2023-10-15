import 'package:bottle_ver2/screens/tournamentWidgets/TournamentTile.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'tournamentDetailsWidgets/tournamentSectionItemWidgets.dart';

class TournamentDetailsLeftSection extends StatefulWidget {
  TournamentDetailsLeftSection({super.key});

  @override
  State<TournamentDetailsLeftSection> createState() =>
      _TournamentDetailsLeftSectionState();
}

class _TournamentDetailsLeftSectionState
    extends State<TournamentDetailsLeftSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300, maxHeight: 600),
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
              height: 500,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(minHeight: 370),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "VCT Masters Tokyo",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TournamentDetailItemShort(
                                  labelText: "Game",
                                  descriptionText: "Valorant",
                                  labelWidget: Image.asset(
                                    "gameLogos/valorant-logo.webp",
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.cover,
                                  )),
                              TournamentDetailItemShort(
                                labelText: "Format",
                                descriptionText: "Single Elimination",
                                labelWidget: Image.asset(
                                  "customIcons/tournament_format.png",
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                          SectionDivider(),
                          TournamentDetailItemLong(
                              labelText: "No of teams : ",
                              descriptionText: "8",
                              labelWidget: Icon(
                                  CupertinoIcons.person_2_square_stack_fill)),
                          SizedBox(height: 20),
                          TournamentDetailItemLong(
                              labelText: "No of players : ",
                              descriptionText: "12/40",
                              labelWidget: Icon(CupertinoIcons.person_2_fill)),
                          SectionDivider(),
                          TournamentDetailItemLong(
                              labelText: "Prize Pool: ",
                              descriptionText: "\$100000",
                              labelWidget: Icon(
                                  CupertinoIcons.money_dollar_circle_fill)),
                          SizedBox(height: 20),
                          TournamentDetailItemLong(
                              labelText: "Spots Left: ",
                              descriptionText: "28/40",
                              labelWidget: Icon(CupertinoIcons.tickets_fill)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TournamentSectionButton(
                            buttonText: "Apply ",
                            onPressed: () {},
                          ),
                          SizedBox(height: 10),
                          TournamentSectionButton(
                            buttonText: "Shop ",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}