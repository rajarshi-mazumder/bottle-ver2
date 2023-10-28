import 'package:flutter/material.dart';

import '../../../models/tournamentModels/tournamentModels.dart';
import 'tournamentProgressionInput.dart';

class MatchDisplayWidget extends StatefulWidget {
  MatchDisplayWidget(
      {super.key,
      required this.matchIndex,
      required this.roundIndex,
      required this.teamA,
      required this.teamB // Add a parameter for team names
      });

  final int roundIndex;
  final int matchIndex;

  Team teamA;
  Team teamB;

  @override
  State<MatchDisplayWidget> createState() => _MatchDisplayWidgetState();
}

class _MatchDisplayWidgetState extends State<MatchDisplayWidget> {
  // Track selected team B
  @override
  void initState() {
    super.initState();
    if (widget.teamA.name == null)
      widget.teamA = Team(name: "default", teamLogo: "orgPics/riot_games.png");
    if (widget.teamB.name == null)
      widget.teamB = Team(name: "default", teamLogo: "orgPics/riot_games.png");
  }

  @override
  Widget build(BuildContext context) {
    if (widget.roundIndex == 0) {
      print("Match addedddddddd ${widget.matchIndex}");
    }
    return Container(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints(minHeight: 50),
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.teamA != null)
                Container(
                  color: Colors.blue,
                  height: 30,
                  width: 100,
                  child: Row(children: [
                    Text(widget.teamA.name!),
                    Image.asset(
                      widget.teamA.teamLogo!,
                    )
                  ]),
                ),
              Text("VS"),
              if (widget.teamB != null)
                Container(
                  color: Colors.red,
                  height: 30,
                  width: 100,
                  child: Row(children: [
                    Text(widget.teamB.name!),
                    Image.asset(
                      widget.teamB.teamLogo!,
                    )
                  ]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
