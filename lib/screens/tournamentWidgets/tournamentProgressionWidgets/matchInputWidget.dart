import 'package:bottle_ver2/screens/tournamentWidgets/tournamentProgressionWidgets/tournamentProgressionInput.dart';
import 'package:flutter/material.dart';

import '../../../themes/themes.dart';

class MatchInputWidget extends StatefulWidget {
  MatchInputWidget(
      {Key? key,
      required this.matchIndex,
      required this.roundIndex,
      required this.teamNames,
      required this.roundMatchesData});

  final int roundIndex;
  final int matchIndex;
  final List<String> teamNames;
  List<List<Map<String, dynamic>>> roundMatchesData;

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: BoxConstraints(minHeight: 50),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TeamInputWidget(
              selectedTeam: selectedTeamA,
              teamNames: widget.teamNames,
              roundIndex: widget.roundIndex,
              matchIndex: widget.matchIndex,
              teamA_B: "teamA",
              roundMatchesData: widget.roundMatchesData,
            ),
            Container(
                margin: EdgeInsets.only(left: 80, top: 5, bottom: 5),
                child: Text(
                  'VS',
                  style: customTheme.textTheme.labelMedium,
                )),
            TeamInputWidget(
              selectedTeam: selectedTeamB,
              teamNames: widget.teamNames,
              roundIndex: widget.roundIndex,
              matchIndex: widget.matchIndex,
              teamA_B: "teamB",
              roundMatchesData: widget.roundMatchesData,
            ),
          ],
        ),
      ),
    );
  }
}

class TeamInputWidget extends StatefulWidget {
  TeamInputWidget(
      {super.key,
      required this.selectedTeam,
      required this.teamNames,
      required this.roundIndex,
      required this.matchIndex,
      required this.teamA_B,
      required this.roundMatchesData});

  String selectedTeam;
  List<String> teamNames;
  int roundIndex;
  int matchIndex;
  String teamA_B;
  List<List<Map<String, dynamic>>> roundMatchesData;

  @override
  State<TeamInputWidget> createState() => _TeamInputWidgetState();
}

class _TeamInputWidgetState extends State<TeamInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 180,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: bgPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: DropdownButton<String>(
            isExpanded: true,
            value: widget.selectedTeam,
            items: widget.teamNames.map((team) {
              return DropdownMenuItem<String>(
                value: team,
                child: Text(
                  team,
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                print(value);
                widget.selectedTeam = value!;
                widget.roundMatchesData[widget.roundIndex][widget.matchIndex]
                    [widget.teamA_B] = value;
              });
            },
            underline: Container(),
            // Remove the underline
          ),
        ),
        if (widget.selectedTeam != '')
          Radio<String>(
            value: widget.selectedTeam,
            groupValue: winner,
            onChanged: (value) {
              setState(() {
                winner = value!;
                roundMatchesListData[widget.roundIndex][widget.matchIndex]
                    ['winner'] = value;
              });
            },
          ),
      ],
    );
  }
}
