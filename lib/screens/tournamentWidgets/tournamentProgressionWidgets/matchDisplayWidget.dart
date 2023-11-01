import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';

import '../../../models/tournamentModels/team.dart';
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TeamDisplayWidget(
                  teamLogo: widget.teamA.teamLogo != null
                      ? widget.teamA.teamLogo!
                      : '',
                  teamName:
                      widget.teamA.name != null ? widget.teamA.name! : ''),
              SizedBox(height: 10),
              Center(
                  child: Text("VS",
                      style: Theme.of(context).textTheme.labelMedium)),
              SizedBox(height: 10),
              TeamDisplayWidget(
                  teamLogo: widget.teamB.teamLogo != null
                      ? widget.teamB.teamLogo!
                      : '',
                  teamName:
                      widget.teamB.name != null ? widget.teamB.name! : ''),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamDisplayWidget extends StatelessWidget {
  TeamDisplayWidget(
      {super.key, required this.teamLogo, required this.teamName});

  String teamLogo;
  String teamName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: bgPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(children: [
        if (teamLogo != '')
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: Image.asset(
                  teamLogo,
                  height: 40,
                  width: 40,
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
            ],
          ),
        SizedBox(width: 20),
        Expanded(
            child: Text(
          teamName != '' ? teamName : "",
          style: Theme.of(context).textTheme.labelMedium,
        ))
      ]),
    );
  }
}

class WinnerDisplayWidget extends StatelessWidget {
  WinnerDisplayWidget(
      {super.key, required this.teamLogo, required this.teamName});

  String teamLogo;
  String teamName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: bgPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          Center(
              child: Text("WINNER",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: primaryColor, fontSize: 16))),
          SizedBox(height: 20),
          Row(children: [
            if (teamLogo != '')
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    child: Image.asset(
                      teamLogo,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ],
              ),
            SizedBox(width: 20),
            Expanded(
                child: Text(
              teamName != '' ? teamName : "",
              style: Theme.of(context).textTheme.labelMedium,
            ))
          ]),
        ],
      ),
    );
  }
}
