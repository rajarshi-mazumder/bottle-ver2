import 'package:bottle_ver2/themes/themes.dart';
import 'package:bottle_ver2/themes/playerCardWidgets/valorantRoles.dart';
import 'package:flutter/material.dart';

class GameProfileLeftSection extends StatefulWidget {
  GameProfileLeftSection(
      {super.key, this.cardLengthType = "long", this.cardWidth = 300});

  double cardWidth = 300;
  String cardLengthType;

  @override
  State<GameProfileLeftSection> createState() => _GameProfileLeftSectionState();
}

class _GameProfileLeftSectionState extends State<GameProfileLeftSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
          // color: Colors.blue,
          ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 300,
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Image.asset(
                      '/Reyna-1.png',
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [secondaryColor, bgPrimaryColor]),
                      ),
                      height: widget.cardLengthType == "long" ? 400 : 70,
                      width: 300,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 30,
                            child: Column(
                              children: [
                                Container(
                                  width: widget.cardWidth,
                                  height: 120,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ValorantRole(
                                        iconUrl:
                                            "https://static.wikia.nocookie.net/valorant/images/f/fd/DuelistClassSymbol.png",
                                        iconTitle: "Duelist",
                                        value: 0.5,
                                      ),
                                      ValorantRole(
                                        iconUrl:
                                            "https://static.wikia.nocookie.net/valorant/images/7/77/InitiatorClassSymbol.png",
                                        iconTitle: "Initiator",
                                        value: 0.9,
                                      ),
                                      ValorantRole(
                                        iconUrl:
                                            "https://static.wikia.nocookie.net/valorant/images/0/04/ControllerClassSymbol.png",
                                        iconTitle: "Controller",
                                        value: 0.4,
                                      ),
                                    ],
                                  ),
                                ),
                                PlayerCardStatItem(
                                  cardWidth: widget.cardWidth,
                                  rowItems: [
                                    Text("Peak Rank"),
                                    Image.asset(
                                      "/valoRanks/immortallLogo.webp",
                                      height: 40,
                                      width: 40,
                                    )
                                  ],
                                ),
                                PlayerCardStatItem(
                                    cardWidth: widget.cardWidth,
                                    rowItems: [
                                      Text("Region"),
                                      Text("Tokyo, Japan")
                                    ]),
                                PlayerCardStatItem(
                                    cardWidth: widget.cardWidth,
                                    rowItems: [
                                      Expanded(child: Text("Availability: ")),
                                      Expanded(
                                          child: Text(
                                        "[Mon-Tue, 10:30 PM - 12:30 AM]",
                                        style: TextStyle(fontSize: 12),
                                      ))
                                    ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  top: 160,
                  child: Container(
                      width: widget.cardWidth,
                      child: Center(
                          child: Text(
                        "TenZ",
                        style: TextStyle(fontSize: 25),
                      )))),
            ],
          ),
        ),
      ),
    );
  }
}
