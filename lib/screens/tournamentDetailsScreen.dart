import 'package:bottle_ver2/screens/tournamentWidgets/tournamentDetailsLeftSection.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentDetailsWidgets/tournamentOverviewSection.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentDetailsWidgets/tournamentProgressionDisplay.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentRightSection.dart';
import 'package:bottle_ver2/temp.dart';
import 'package:flutter/material.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:bottle_ver2/sharedWidgets/rightSidebar.dart';
import 'package:bottle_ver2/sharedWidgets/sidebar.dart';
import 'package:flutter/rendering.dart';

import '../themes/customTabBarThemes.dart';
import 'gameProfileWidgets/gameProfileLeftSection.dart';
import 'gameProfileWidgets/gameProfileRightSection.dart';

class TournamentDetailsScreen extends StatefulWidget {
  TournamentDetailsScreen({super.key, this.isSidebarExpanded = false});

  bool isSidebarExpanded;

  @override
  State<TournamentDetailsScreen> createState() =>
      _TournamentDetailsScreenState();
}

class _TournamentDetailsScreenState extends State<TournamentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [bgPrimaryColor, bgSecondaryColor],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * 0.17,
            top: 50,
            child: TournamentDetailsLeftSection(),
          ),
          Positioned(
            top: 52,
            right: 200,
            child: DefaultTabController(
              length: 4,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [bgPrimaryColor, bgSecondaryColor],
                  ),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Container(
                          height: 60,
                          decoration: BoxDecoration(color: secondaryColor),
                          child: TabBar(
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey,
                              indicator: CustomTabIndicator(),
                              // indicatorSize: TabBarIndicatorSize.label,
                              tabs: [
                                Text("Overview"),
                                Text("Teams"),
                                Text("Players"),
                                Text("Matches")
                              ])),
                    ),
                    Container(
                      height: 900,
                      child: TabBarView(children: [
                        TournamentOverviewSection(),
                        TournamentRightSection(allBordersRounded: false),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Text("No posts"),
                            )),
                        Stack(children: [
                          ClipRect(child: TournamentProgressionDisplay()),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Tournament Progression"),
                                          content: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child:
                                                  TournamentProgressionDisplay()),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Close'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(Icons.fullscreen)),
                          )
                        ]),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            child: Sidebar(isExpanded: widget.isSidebarExpanded),
          ),
          Positioned(
            top: 50,
            right: 0,
            child: RightSidebar(isExpanded: widget.isSidebarExpanded),
          ),
        ],
      ),
    );
  }
}

class TournamentDisplayFullScreen extends StatelessWidget {
  TournamentDisplayFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TournamentProgressionDisplay();
  }
}
