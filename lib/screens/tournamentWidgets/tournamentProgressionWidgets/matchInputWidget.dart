import 'package:flutter/material.dart';

import '../tournamentDetailsWidgets/tournamentProgressionDisplay.dart';

class MatchInputWidget extends StatefulWidget {
  MatchInputWidget({
    super.key,
    required this.matchIndex,
    required this.roundIndex,
    required this.teamNames, // Add a parameter for team names
  });

  final int roundIndex;
  final int matchIndex;
  final List<String> teamNames; // List of team names

  @override
  State<MatchInputWidget> createState() => _MatchInputWidgetState();
}

class _MatchInputWidgetState extends State<MatchInputWidget> {
  String selectedTeamA = ''; // Track selected team A
  String selectedTeamB = ''; // Track selected team B
  @override
  void initState() {
    super.initState();
    widget.teamNames.add("");
    selectedTeamA = widget.teamNames.last;
    selectedTeamB = widget.teamNames.last;
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
                child: DropdownButton<String>(
                  value: selectedTeamA,
                  items: widget.teamNames.map((team) {
                    return DropdownMenuItem<String>(
                      value: team,
                      child: Text(team),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTeamA = value!;
                      roundMatchesData[widget.roundIndex][widget.matchIndex]
                          ["teamA"] = value;
                      roundMatchesData[widget.roundIndex][widget.matchIndex]
                          ["teamB"] = selectedTeamB;
                    });
                  },
                ),
              ),
              Text("VS"),
              Container(
                color: Colors.red,
                child: DropdownButton<String>(
                  value: selectedTeamB,
                  items: widget.teamNames.map((team) {
                    return DropdownMenuItem<String>(
                      value: team,
                      child: Text(team),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTeamB = value!;
                      roundMatchesData[widget.roundIndex][widget.matchIndex]
                          ["teamA"] = selectedTeamA;
                      roundMatchesData[widget.roundIndex][widget.matchIndex]
                          ["teamB"] = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
