import 'package:flutter/material.dart';

import '../../../themes/themes.dart';
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
          DropdownButton<String>(
            isExpanded: true,
            underline: Container(),
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
        ],
      ),
    );
  }
}
