import 'package:flutter/material.dart';

import 'tournamentProgressionInput.dart';

class WinnerInputData extends StatefulWidget {
  WinnerInputData({super.key, required this.teamNames});

  final List<String> teamNames;

  @override
  State<WinnerInputData> createState() => _WinnerInputDataState();
}

class _WinnerInputDataState extends State<WinnerInputData> {
  String winnerTeam = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.teamNames.add("");
    winnerTeam = widget.teamNames.last;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.green,
      child: DropdownButton<String>(
        value: winnerTeam,
        items: widget.teamNames.map((team) {
          return DropdownMenuItem<String>(
            value: team,
            child: Text(team),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            winnerTeam = value!;
            winner = winnerTeam;
          });
        },
      ),
    );
  }
}
