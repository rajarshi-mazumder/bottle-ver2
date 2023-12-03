// import 'package:bottle_ver2/screens/teamsWidgets/teamDetailWidgets/teamPlayersSection.dart';
// import 'package:bottle_ver2/screens/teamsWidgets/teamDetailsLeftSection.dart';
// import 'package:bottle_ver2/screens/tournamentWidgets/teamsWidgets/teamsListScreen.dart';
// import 'package:bottle_ver2/screens/tournamentWidgets/tournamentDetailsLeftSection.dart';
// import 'package:bottle_ver2/screens/tournamentWidgets/tournamentDetailsWidgets/tournamentOverviewSection.dart';
// import 'package:bottle_ver2/screens/tournamentWidgets/tournamentProgressionWidgets/tournamentProgressionInput.dart';
// import 'package:bottle_ver2/screens/tournamentWidgets/tournamentRightSection.dart';
import 'package:bottle_ver2/temp.dart';
import 'package:bottle_ver2/themes/spacing.dart';
import 'package:bottle_ver2/views/screens/teamsWidgets/teamDetailWidgets/teamPlayersSection.dart';
import 'package:bottle_ver2/views/screens/teamsWidgets/teamDetailsLeftSection.dart';
// import 'package:bottle_ver2/views/screens/tournamentWidgets/teamsWidgets/teamsListScreen.dart';
import 'package:flutter/material.dart';
import 'package:bottle_ver2/themes/themes.dart';
// import 'package:bottle_ver2/sharedWidgets/rightSidebar.dart';
// import 'package:bottle_ver2/sharedWidgets/sidebar.dart';
import 'package:flutter/rendering.dart';

// import '../themes/customTabBarThemes.dart';
import '../../themes/customTabBarThemes.dart';
import '../widgets/sharedWidgets/rightSidebar.dart';
import '../widgets/sharedWidgets/sidebar.dart';
import '../widgets/tournamentWidgets/teamsWidgets/teamsListScreen.dart';
import 'gameProfileWidgets/gameProfileLeftSection.dart';
import 'gameProfileWidgets/gameProfileRightSection.dart';

class TeamDetailsScreen extends StatefulWidget {
  TeamDetailsScreen({super.key, this.isSidebarExpanded = false});

  bool isSidebarExpanded;

  @override
  State<TeamDetailsScreen> createState() => _TeamDetailsScreenState();
}

class _TeamDetailsScreenState extends State<TeamDetailsScreen> {
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
            top: 50,
            child: TeamDetailsLeftSection(),
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
                                Text("Players"),
                                Text("Teams"),
                                Text("Coaches"),
                              ])),
                    ),
                    Container(
                      height: 900,
                      child: TabBarView(children: [
                        TeamPlayersSection(),
                        TeamsListScreen(allBordersRounded: false),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Text("No posts"),
                            )),
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
