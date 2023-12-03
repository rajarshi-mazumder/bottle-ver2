// import 'package:bottle_ver2/screens/tournamentWidgets/tournamentRightSection.dart';
import 'package:bottle_ver2/themes/platformSpecificOperations/platformCheck.dart';
// import 'package:bottle_ver2/views/screens/tournamentWidgets/tournamentRightSection.dart';
import 'package:flutter/material.dart';
import 'package:bottle_ver2/themes/themes.dart';
// import 'package:bottle_ver2/sharedWidgets/rightSidebar.dart';
// import 'package:bottle_ver2/sharedWidgets/sidebar.dart';

import '../../themes/spacing.dart';
// import '../themes/customTabBarThemes.dart';
// import '../themes/spacing.dart';
import '../widgets/tournamentWidgets/tournamentRightSection.dart';
import 'gameProfileWidgets/gameProfileLeftSection.dart';
import 'gameProfileWidgets/gameProfileRightSection.dart';

class GameProfileMobileScreen extends StatefulWidget {
  GameProfileMobileScreen(
      {super.key, this.isSidebarExpanded = false, required this.tabController});

  TabController tabController;
  bool isSidebarExpanded;

  @override
  State<GameProfileMobileScreen> createState() =>
      _GameProfileMobileScreenState();
}

class _GameProfileMobileScreenState extends State<GameProfileMobileScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomSpacing customSpacing = CustomSpacing(context: context);
    return Container(
      height: 900,
      child: TabBarView(controller: widget.tabController, children: [
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
