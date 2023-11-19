import 'package:bottle_ver2/screens/tournamentWidgets/tournamentRightSection.dart';
import 'package:bottle_ver2/themes/platformSpecificOperations/platformCheck.dart';
import 'package:flutter/material.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:bottle_ver2/sharedWidgets/rightSidebar.dart';
import 'package:bottle_ver2/sharedWidgets/sidebar.dart';

import '../themes/customTabBarThemes.dart';
import '../themes/spacing.dart';
import 'gameProfileWidgets/gameProfileLeftSection.dart';
import 'gameProfileWidgets/gameProfileRightSection.dart';

class GameProfileMobileScreen extends StatefulWidget {
  GameProfileMobileScreen({super.key, this.isSidebarExpanded = false});

  bool isSidebarExpanded;

  @override
  State<GameProfileMobileScreen> createState() =>
      _GameProfileMobileScreenState();
}

class _GameProfileMobileScreenState extends State<GameProfileMobileScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    CustomSpacing customSpacing = CustomSpacing(context: context);
    return Container(
      height: 900,
      child: TabBarView(controller: tabController, children: [
        GameProfileRightSection(),
        TournamentRightSection(allBordersRounded: false),
        Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text("No posts"),
            ))
      ]),
    );
  }
}