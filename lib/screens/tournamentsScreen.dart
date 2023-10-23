import 'package:bottle_ver2/screens/tournamentWidgets/TournamentTile.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentLeftSection.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentRightSection.dart';
import 'package:flutter/material.dart';
import 'package:bottle_ver2/themes/themes.dart';
import '../sharedWidgets/rightSidebar.dart';
import '../sharedWidgets/sidebar.dart';
import 'gameProfileWidgets/gameProfileLeftSection.dart';

class TournamentsScreen extends StatefulWidget {
  TournamentsScreen({super.key, this.isSidebarExpanded = false});

  bool isSidebarExpanded;

  @override
  State<TournamentsScreen> createState() => _TournamentsScreenState();
}

class _TournamentsScreenState extends State<TournamentsScreen> {
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
            left: MediaQuery.of(context).size.width * 0.1,
            top: 60,
            child: TournamentLeftSection(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200, top: 60),
            child: TournamentRightSection(),
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
