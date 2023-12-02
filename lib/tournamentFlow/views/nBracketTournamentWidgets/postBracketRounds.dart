import 'package:bottle_ver2/tournamentFlow/views/nBracketTournamentWidgets/postBracketMatchInput.dart';
import 'package:bottle_ver2/tournamentFlow/views/createTournament_nBracket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tournamentModels/round.dart';
import '../../controllers/providers/nBracketTournamentDataProvider.dart';
import 'matchInputWidget.dart';
import 'winnerInputWidget.dart';

class PostBracketRounds extends StatefulWidget {
  Map rounds;

  PostBracketRounds({
    required this.rounds,
  });

  @override
  State<PostBracketRounds> createState() => _PostBracketRoundsState();
}

class _PostBracketRoundsState extends State<PostBracketRounds> {
  List<Widget> roundWidgets = [];

  generateBracketRoundWidgets() {
    int roundIndex = -1;

    widget.rounds["rounds"].forEach((round) {
      roundIndex++;
      int matchIndex = -1;

      roundWidgets.add(Container(
        margin: EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(round["noOfMatches"], (index) {
            matchIndex++;

            bool isMatchDecided = false;
            if (round["matches"]?[index]["participantA"] != null &&
                round["matches"]?[index]["participantB"] != null)
              isMatchDecided = true;

            return PostBracketMatchInput(
              matchIndex: matchIndex,
              roundIndex: roundIndex,
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
      child: WinnerInputData(
        bracketIndex: 0,
        winnerType: "postBracketWinner",
      ),
    ));
  }

  createEmptyBracketInProvider(
      {required nBracketTournamentDataProvider tournamentDataProvider}) {
    if (tournamentDataProvider.tournamentData["brackets"].length <
        tournamentDataProvider.bracketCount) {
      tournamentDataProvider.tournamentData["brackets"].add({
        // "bracketIndex": widget.bracket["bracketIndex"],
        // "rounds": widget.roundMatchesData,
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
    nBracketTournamentDataProvider tournamentDataProvider =
        context.watch<nBracketTournamentDataProvider>();

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
