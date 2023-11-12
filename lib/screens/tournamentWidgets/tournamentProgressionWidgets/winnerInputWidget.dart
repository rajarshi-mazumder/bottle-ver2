import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../themes/themes.dart';
import '../../../tournamentOperations/createTournament.dart';
import 'tournamentProgressionInput.dart';

class WinnerInputData extends StatefulWidget {
  WinnerInputData(
      {super.key,
      required this.bracketIndex,
      this.winnerType = "bracketWinner"});

  int bracketIndex;
  String winnerType;

  @override
  State<WinnerInputData> createState() => _WinnerInputDataState();
}

class _WinnerInputDataState extends State<WinnerInputData> {
  String winnerTeam = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TournamentDataProvider tournamentDataProvider =
        context.watch<TournamentDataProvider>();
    setState(() {
      if (widget.winnerType == "bracketWinner") {
        try {
          winnerTeam = tournamentDataProvider.tournamentData["brackets"]
                  [widget.bracketIndex]["winner"]["name"]
              .toString();
        } catch (e) {
          winnerTeam = "";
        }
      } else if (widget.winnerType == "postBracketWinner") {
        try {
          winnerTeam = tournamentDataProvider
              .tournamentData["postBracketRounds"]["winner"]["name"]
              .toString();
        } catch (e) {
          winnerTeam = "";
        }
      }
    });

    return Container(
      height: 100,
      width: 200,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: bgPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text("Winner",
              style: customTheme.textTheme.labelMedium
                  ?.copyWith(color: Colors.red)),
          Text(
            winnerTeam,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
