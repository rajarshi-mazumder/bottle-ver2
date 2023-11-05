import 'package:flutter/material.dart';

import '../models/tournamentModels/round.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/matchInputWidget.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/winnerInputWidget.dart';

List<Widget> roundWidgets = [];

class BracketRounds extends StatefulWidget {
  BracketRounds({super.key, required this.bracket});

  Map<String, dynamic> bracket;
  List<List<Map<String, dynamic>>> roundMatchesData = [];

  @override
  State<BracketRounds> createState() => _BracketRoundsState();
}

class _BracketRoundsState extends State<BracketRounds> {
  generateBracketRoundWidgets() {
    int roundIndex = -1;

    widget.bracket["rounds"].forEach((Round round) {
      roundIndex++;
      int matchIndex = -1;
      // widget.roundMatchesData.add([]);
      roundWidgets.add(Container(
        margin: EdgeInsets.only(top: 0),
        child: Column(
          children: List.generate(round.noOfMatches, (index) {
            matchIndex++;
            TextEditingController teamAController = TextEditingController();
            TextEditingController teamBController = TextEditingController();
            // print(
            //     "HOUSSSSSSEE ${round.matches?[index].participantA},, ${round.matches?[index].participantB}");

            widget.roundMatchesData[roundIndex].add({
              "round": roundIndex,
              "teamA": round.matches?[index].participantA != null
                  ? round.matches![index].participantA!.name
                  : teamAController.text,
              "teamB": round.matches?[index].participantB != null
                  ? round.matches![index].participantB!.name
                  : teamBController.text,
            });
            // return Container();
            return MatchInputWidget(
              matchIndex: matchIndex,
              roundIndex: roundIndex,
              teamNames: List.generate(widget.bracket["participants"].length,
                  (index) => widget.bracket["participants"]![index].name!),
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
              teamNames: List.generate(widget.bracket["participants"]!.length,
                  (index) => widget.bracket["participants"]![index].name!)),
        ],
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    roundWidgets = [];
    widget.roundMatchesData =
        List.generate(widget.bracket["rounds"].length, (index) {
      return List.generate(widget.bracket["rounds"][index].noOfMatches,
          (index) {
        return {"teamA": null, "teamB": null};
      });
    });

    generateBracketRoundWidgets();
    // print(widget.roundWidgets);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(roundWidgets.length, (index) {
        return roundWidgets[index];
      }),
    );
  }
}
