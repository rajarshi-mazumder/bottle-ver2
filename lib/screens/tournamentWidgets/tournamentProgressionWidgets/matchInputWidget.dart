import 'package:bottle_ver2/screens/tournamentWidgets/tournamentProgressionWidgets/tournamentProgressionInput.dart';
import 'package:flutter/material.dart';

class MatchInputWidget extends StatefulWidget {
  MatchInputWidget({
    Key? key,
    required this.matchIndex,
    required this.roundIndex,
    required this.teamNames,
  });

  final int roundIndex;
  final int matchIndex;
  final List<String> teamNames;

  @override
  State<MatchInputWidget> createState() => _MatchInputWidgetState();
}

class _MatchInputWidgetState extends State<MatchInputWidget> {
  String selectedTeamA = '';
  String selectedTeamB = '';
  String winner = '';

  @override
  void initState() {
    super.initState();
    widget.teamNames.add('');
    selectedTeamA = widget.teamNames.last;
    selectedTeamB = widget.teamNames.last;
  }

  @override
  Widget build(BuildContext context) {
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
                child: Row(
                  children: [
                    DropdownButton<String>(
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
                              ['teamA'] = value;
                        });
                      },
                    ),
                    Radio<String>(
                      value: selectedTeamA,
                      groupValue: winner,
                      onChanged: (value) {
                        setState(() {
                          winner = value!;
                          print(winner);
                          roundMatchesData[widget.roundIndex][widget.matchIndex]
                              ['winner'] = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Text('VS'),
              Container(
                color: Colors.red,
                child: Row(
                  children: [
                    DropdownButton<String>(
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
                              ['teamB'] = value;
                        });
                      },
                    ),
                    Radio<String>(
                      value: selectedTeamB,
                      groupValue: winner,
                      onChanged: (value) {
                        setState(() {
                          winner = value!;
                          roundMatchesData[widget.roundIndex][widget.matchIndex]
                              ['winner'] = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
