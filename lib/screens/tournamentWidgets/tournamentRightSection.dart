import 'package:flutter/material.dart';

import '../../themes/themes.dart';
import 'TournamentTile.dart';

class TournamentRightSection extends StatelessWidget {
  const TournamentRightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
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
    );
  }
}
