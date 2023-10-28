import 'package:bottle_ver2/screens/tournamentWidgets/tournamentProgressionWidgets/matchDisplayWidget.dart';
import 'package:flutter/material.dart';

import '../../../models/tournamentModels/tournamentModels.dart';
import 'matchInputWidget.dart';
import 'winnerInputWidget.dart';

String? winner;

class TournamentProgressionDisplay extends StatefulWidget {
  TournamentProgressionDisplay({required this.tournament});

  Tournament tournament;

  @override
  _TournamentProgressionDisplayState createState() =>
      _TournamentProgressionDisplayState();
}

class _TournamentProgressionDisplayState
    extends State<TournamentProgressionDisplay> {
  int numberOfTeams = 1; // Change this to set the initial number of teams
  List<List<String>> rounds = [];

  List<Widget> roundWidgets = [];

  @override
  void initState() {
    super.initState();
    numberOfTeams = widget.tournament.teams!.length;

    generateRoundWidgets();
  }

  generateRoundWidgets() {
    int roundIndex = -1;

    widget.tournament.rounds.forEach((round) {
      roundIndex++;
      int matchIndex = -1;

      roundWidgets.add(Container(
        margin: EdgeInsets.only(top: 0),
        child: Column(
          children: List.generate(round.noOfMatches, (index) {
            matchIndex++;
            return MatchDisplayWidget(
              matchIndex: matchIndex,
              roundIndex: roundIndex,
              teamA: round.matches![index].teamA!,
              teamB: round.matches![index].teamB!,
            );
          }),
        ),
      ));
    });
    roundWidgets.add(Container(
      width: 100,
      child: Column(
        children: [
          WinnerInputData(
              teamNames: List.generate(widget.tournament.teams!.length,
                  (index) => widget.tournament.teams![index].name!)),
        ],
      ),
    ));
  }

  void submitMatches() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Row(
                  children: List.generate(roundWidgets.length, (index) {
                return Expanded(child: roundWidgets[index]);
              })),
            ),
          ),
        ],
      ),
    );
  }
}
