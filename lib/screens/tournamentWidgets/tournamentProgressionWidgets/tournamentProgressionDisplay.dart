import 'package:bottle_ver2/screens/tournamentWidgets/tournamentProgressionWidgets/matchDisplayWidget.dart';
import 'package:flutter/material.dart';

import '../../../models/tournamentModels/team.dart';
import '../../../models/tournamentModels/tournamentModels.dart';
import '../../../tournamentOperations/tournamentScreenWidgets/nBracketTournamentWidgets/matchInputWidget.dart';
import '../../../tournamentOperations/tournamentScreenWidgets/nBracketTournamentWidgets/winnerInputWidget.dart';

String? winner;

class TournamentProgressionDisplay extends StatefulWidget {
  TournamentProgressionDisplay({required this.tournament});

  Tournament tournament;
  String participantType = "participant";

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
    numberOfTeams = widget.tournament.participants!.length;

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
            print(round.matches![index].participantA.toString());
            return MatchDisplayWidget(
              matchIndex: matchIndex,
              roundIndex: roundIndex,
              participantA: round.matches![index].participantA!,
              participantB: round.matches![index].participantB!,
            );
          }),
        ),
      ));
    });
    roundWidgets.add(WinnerDisplayWidget(
      winner: widget.tournament.winner.toString() ?? '',
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
                return roundWidgets[index];
              })),
            ),
          ),
        ],
      ),
    );
  }
}
