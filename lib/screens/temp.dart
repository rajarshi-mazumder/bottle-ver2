import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileLeftSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileRightSection.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentRightSection.dart';
import 'package:bottle_ver2/screens/tournamentsScreen.dart';
import 'package:bottle_ver2/sharedWidgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../sharedWidgets/rightSidebar.dart';
import '../themes/themes.dart';

class Tempppp extends StatefulWidget {
  Tempppp({super.key, this.isSidebarExpanded = false});

  bool isSidebarExpanded;

  @override
  State<Tempppp> createState() => _TemppppState();
}

class _TemppppState extends State<Tempppp> {
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
            top: 20,
            child: GameProfileLeftSection(),
          ),
          Positioned(
            top: 52,
            right: 200,
            child: DefaultTabController(
              length: 2,
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
                    TabBar(tabs: [Icon(Icons.add), Icon(Icons.mouse)]),
                    Container(
                      height: 900,
                      child: TabBarView(children: [
                        GameProfileRightSection(),
                        TournamentRightSection()
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
