import 'package:bottle_ver2/tournamentOperations/createTournament.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tournamentModels/round.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/matchInputWidget.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/winnerInputWidget.dart';

class BracketRounds extends StatefulWidget {
  final Map<String, dynamic> bracket;
  final List<List<Map<String, dynamic>>> roundMatchesData;

  BracketRounds({
    required this.bracket,
    required this.roundMatchesData,
  });

  @override
  State<BracketRounds> createState() => _BracketRoundsState();
}

class _BracketRoundsState extends State<BracketRounds> {
  List<Widget> roundWidgets = [];

  generateBracketRoundWidgets() {
    int roundIndex = -1;

    widget.bracket["rounds"].forEach((round) {
      roundIndex++;
      int matchIndex = -1;
      widget.roundMatchesData.add([]);
      roundWidgets.add(Container(
        margin: EdgeInsets.only(top: 0),
        child: Column(
          children: List.generate(round["noOfMatches"], (index) {
            matchIndex++;

            bool isMatchDecided = false;
            if (round["matches"]?[index]["participantA"] != null &&
                round["matches"]?[index]["participantB"] != null)
              isMatchDecided = true;

            return MatchInputWidget(
              matchIndex: matchIndex,
              roundIndex: roundIndex,
              bracketIndex: widget.bracket["bracketIndex"],
              isMatchDecided: isMatchDecided,
              participantA: round["matches"][index]["participantA"] != null
                  ? round["matches"][index]["participantA"].toString()
                  : "",
              participantB: round["matches"][index]["participantB"] != null
                  ? round["matches"][index]["participantB"].toString()
                  : "",
            );
          }),
        ),
      ));
      ;
    });
    roundWidgets.add(Container(
      width: 100,
      child: Column(
        children: [
          WinnerInputData(
            bracketIndex: 1,
          ),
        ],
      ),
    ));
  }

  createEmptyBracketInProvider(
      {required TournamentDataProvider tournamentDataProvider}) {
    if (tournamentDataProvider.tournamentData["brackets"].length <
        tournamentDataProvider.bracketCount) {
      tournamentDataProvider.tournamentData["brackets"].add({
        "bracketIndex": widget.bracket["bracketIndex"],
        "rounds": widget.roundMatchesData,
        "winner": null
      });
    }
  }

  @override
  void initState() {
    super.initState();

    generateBracketRoundWidgets();
  }

  @override
  Widget build(BuildContext context) {
    TournamentDataProvider tournamentDataProvider =
        context.watch<TournamentDataProvider>();
    createEmptyBracketInProvider(
        tournamentDataProvider: tournamentDataProvider);

    if (roundWidgets.isNotEmpty) {
      return Row(
        children: roundWidgets,
      );
    } else {
      return Container(
        height: 300,
        width: 200,
        color: Colors.blue,
      );
    }
  }
}
