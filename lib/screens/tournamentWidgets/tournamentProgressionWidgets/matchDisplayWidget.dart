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

  final Team teamA;
  final Team teamB;

  @override
  State<MatchDisplayWidget> createState() => _MatchDisplayWidgetState();
}

class _MatchDisplayWidgetState extends State<MatchDisplayWidget> {
  // Track selected team B
  @override
  void initState() {
    super.initState();
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
              Container(
                color: Colors.blue,
                child: Row(children: [
                  Text(widget.teamA.name!),
                  // Image.asset(
                  //   widget.teamA.teamLogo!,
                  // )
                ]),
              ),
              Text("VS"),
              Container(
                color: Colors.red,
                child: Row(children: [
                  Text(widget.teamB.name!),
                  // Image.asset(
                  //   widget.teamB.teamLogo!,
                  // )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
