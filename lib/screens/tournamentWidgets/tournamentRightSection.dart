import 'dart:convert';

import 'package:bottle_ver2/themes/spacing.dart';
import 'package:flutter/material.dart';

import '../../models/tournamentModels/player.dart';
import '../../models/tournamentModels/team.dart';
import '../../models/tournamentModels/tournamentModels.dart';
import '../../themes/themes.dart';
import '../../tournamentFlow/views/createTournament_nBracket.dart';
import '../../tournamentFlow/views/tournamentContainer.dart';
import 'TournamentTile.dart';

class TournamentRightSection extends StatefulWidget {
  TournamentRightSection({super.key, this.allBordersRounded = true});


  bool allBordersRounded;

  @override
  State<TournamentRightSection> createState() => _TournamentRightSectionState();
}

class _TournamentRightSectionState extends State<TournamentRightSection> {
  @override
  void initState() {
    super.initState();

    List<String> playersList1 = participants1.map((e) => e.name ?? '').toList();

    List<String> teamsList1 = teams.map((e) => e.name ?? '').toList();
    List<String> teamsList2 = teams2.map((e) => e.name ?? '').toList();
  }

  @override
  Widget build(BuildContext context) {
    CustomSpacing customSpacing = CustomSpacing(context: context);
    return Align(
      alignment: Alignment.centerRight,
      child: ClipRRect(
        borderRadius: widget.allBordersRounded
            ? BorderRadius.all(Radius.circular(20))
            : BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [secondaryColor, bgPrimaryColor])),
          width: customSpacing.getRightSectionWidth(context: context),
          height: 900,
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
                  onTap: () {

                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
