import 'package:bottle_ver2/screens/tournamentWidgets/TournamentTile.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentLeftSection.dart';
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
            left: MediaQuery.of(context).size.width * 0.17,
            top: 60,
            child: TournamentLeftSection(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(top: 60, right: 200),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [secondaryColor, bgPrimaryColor])),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: ListView.builder(
                      itemCount: tournaments.length,
                      itemBuilder: (context, index) {
                        return TournamentTile(
                          date: tournaments[index]['date'],
                          title: tournaments[index]['title'],
                          organizer: tournaments[index]['organizer'],
                          tournamentType: tournaments[index]['tournamentType'],
                          status: tournaments[index]['status'],
                          statusColor: tournaments[index]['statusColor'],
                        );
                      },
                    ),
                  ),
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
