import 'package:bottle_ver2/themes/themes.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/playerCardWidgets/valorantPlayerCardWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                      height: widget.cardLengthType == "long" ? 430 : 70,
                      width: 300,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 80,
                            width: widget.cardWidth,
                            child: Column(
                              children: [
                                Container(
                                  width: widget.cardWidth,
                                  height: 40,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              "Follow",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: bgSecondaryColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              "Message",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: bgSecondaryColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_sharp,
                                            size: 15,
                                          ),
                                          SizedBox(width: 10),
                                          Text("Region"),
                                        ],
                                      ),
                                      Text("Tokyo, Japan")
                                    ]),
                                PlayerCardStatItem(
                                    cardWidth: widget.cardWidth,
                                    rowItems: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.clock,
                                              size: 15,
                                            ),
                                            SizedBox(width: 10),
                                            Text("Availability"),
                                          ],
                                        ),
                                      ),
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
                  top: 120,
                  width: widget.cardWidth,
                  child: Container(
                      width: widget.cardWidth,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              PlayerCardProfilePic(
                                  profilePicUrl:
                                      "/profilePics/Something-prx.webp"),
                              Container(
                                height: 80,
                                width: 80,
                                child: RotationTransition(
                                  turns: AlwaysStoppedAnimation(305 / 360),
                                  child: const CircularProgressIndicator(
                                    color: bgTertiaryColor,
                                    strokeWidth: 2,
                                    value: 1,
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                child: RotationTransition(
                                  turns: AlwaysStoppedAnimation(305 / 360),
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 5,
                                    value: 0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Something",
                                style: TextStyle(fontSize: 25),
                              ),
                              Image.asset(
                                "/valoRanks/immortallLogo.png",
                                height: 40,
                                width: 40,
                              )
                            ],
                          ),
                        ],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
