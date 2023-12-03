// import 'package:bottle_ver2/screens/tournamentWidgets/tournamentRightSection.dart';
import 'package:bottle_ver2/themes/platformSpecificOperations/platformCheck.dart';
// import 'package:bottle_ver2/views/screens/tournamentWidgets/tournamentRightSection.dart';
import 'package:flutter/material.dart';
import 'package:bottle_ver2/themes/themes.dart';
// import 'package:bottle_ver2/sharedWidgets/rightSidebar.dart';
// import 'package:bottle_ver2/sharedWidgets/sidebar.dart';

// import '../themes/customTabBarThemes.dart';
// import '../themes/spacing.dart';
import '../../themes/customTabBarThemes.dart';
import '../../themes/spacing.dart';
import '../widgets/sharedWidgets/rightSidebar.dart';
import '../widgets/sharedWidgets/sidebar.dart';
import '../widgets/tournamentWidgets/tournamentRightSection.dart';
import 'gameProfileWidgets/gameProfileLeftSection.dart';
import 'gameProfileWidgets/gameProfileRightSection.dart';

class GameProfileWebScreen extends StatefulWidget {
  GameProfileWebScreen({super.key, this.isSidebarExpanded = false});

  bool isSidebarExpanded;

  @override
  State<GameProfileWebScreen> createState() => _GameProfileWebScreenState();
}

class _GameProfileWebScreenState extends State<GameProfileWebScreen> {
  @override
  Widget build(BuildContext context) {
    CustomSpacing customSpacing = CustomSpacing(context: context);
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
            left: customSpacing.leftSidePosition,
            top: 0,
            child: GameProfileLeftSection(),
          ),
          Positioned(
            top: 52,
            right: customSpacing.rightSidePosition,
            child: DefaultTabController(
              length: 3,
              child: Container(
                width: customSpacing.rightSideWidth,
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
                                Text("Game Profiles"),
                                Text("Tournaments"),
                                Text("Posts")
                              ])),
                    ),
                    Container(
                      height: 900,
                      child: TabBarView(children: [
                        GameProfileRightSection(),
                        TournamentRightSection(allBordersRounded: false),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Text("No posts"),
                            ))
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
