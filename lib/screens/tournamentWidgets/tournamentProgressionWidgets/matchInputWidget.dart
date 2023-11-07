import 'package:bottle_ver2/models/tournamentModels/team.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentProgressionWidgets/tournamentProgressionInput.dart';
import 'package:bottle_ver2/tournamentOperations/createTournament.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../themes/themes.dart';

class MatchInputWidget extends StatefulWidget {
  MatchInputWidget(
      {Key? key,
      required this.bracketIndex,
      required this.matchIndex,
      required this.roundIndex,
      required this.teamNames,
      required this.roundMatchesData,
      required this.isMatchDecided,
      this.particpantA = null,
      this.particpantB = null});

  final int roundIndex;
  final int bracketIndex;
  final int matchIndex;
  final List<String> teamNames;
  List<List<Map<String, dynamic>>> roundMatchesData;
  bool isMatchDecided;
  Participant? particpantA;
  Participant? particpantB;

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
    selectedTeamA = widget.particpantA != null
        ? widget.particpantA!.name!
        : widget.teamNames.last;
    selectedTeamB = widget.particpantB != null
        ? widget.particpantB!.name!
        : widget.teamNames.last;
  }

  @override
  Widget build(BuildContext context) {
    TournamentDataProvider tournamentDataProvider =
        context.watch<TournamentDataProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: BoxConstraints(minHeight: 50),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TeamInputWidget(
                  selectedTeam: selectedTeamA,
                  teamNames: widget.teamNames,
                  bracketIndex: widget.bracketIndex,
                  roundIndex: widget.roundIndex,
                  matchIndex: widget.matchIndex,
                  participantA_B: "participantA",
                  roundMatchesData: widget.roundMatchesData,
                ),
                if (selectedTeamA != '')
                  Radio<String>(
                    value: selectedTeamA,
                    groupValue: winner,
                    onChanged: (value) {
                      setState(() {
                        winner = value!;
                        widget.roundMatchesData[widget.roundIndex]
                            [widget.matchIndex]['winner'] = value;
                        print(winner);
                        tournamentDataProvider.tournamentData["brackets"]
                                [widget.bracketIndex - 1]["rounds"] =
                            widget.roundMatchesData;
                      });
                    },
                  ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(left: 80, top: 5, bottom: 5),
                child: Text(
                  'VS',
                  style: customTheme.textTheme.labelMedium,
                )),
            Row(
              children: [
                TeamInputWidget(
                  selectedTeam: selectedTeamB,
                  teamNames: widget.teamNames,
                  bracketIndex: widget.bracketIndex,
                  roundIndex: widget.roundIndex,
                  matchIndex: widget.matchIndex,
                  participantA_B: "participantB",
                  roundMatchesData: widget.roundMatchesData,
                ),
                if (selectedTeamB != '')
                  Radio<String>(
                    value: selectedTeamB,
                    groupValue: winner,
                    onChanged: (value) {
                      setState(() {
                        winner = value!;
                        widget.roundMatchesData[widget.roundIndex]
                            [widget.matchIndex]['winner'] = value;
                        print(winner);
                        tournamentDataProvider.tournamentData["brackets"]
                                [widget.bracketIndex - 1]["rounds"] =
                            widget.roundMatchesData;
                      });
                    },
                  ),
              ],
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
      required this.bracketIndex,
      required this.selectedTeam,
      required this.teamNames,
      required this.roundIndex,
      required this.matchIndex,
      required this.participantA_B,
      required this.roundMatchesData});

  String selectedTeam;
  List<String> teamNames;
  int bracketIndex;
  int roundIndex;
  int matchIndex;
  String participantA_B;
  List<List<Map<String, dynamic>>> roundMatchesData;

  @override
  State<TeamInputWidget> createState() => _TeamInputWidgetState();
}

class _TeamInputWidgetState extends State<TeamInputWidget> {
  @override
  Widget build(BuildContext context) {
    TournamentDataProvider tournamentDataProvider =
        context.watch<TournamentDataProvider>();
    widget.roundMatchesData[widget.roundIndex][widget.matchIndex]
        [widget.participantA_B] = {
      "${widget.participantA_B}": {"name": widget.selectedTeam}
    };
    return Row(
      children: [
        Container(
          height: 50,
          width: 180,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          // child: DropdownButton<String>(
          //   isExpanded: true,
          //   value: widget.selectedTeam,
          //   items: widget.teamNames.map((team) {
          //     return DropdownMenuItem<String>(
          //       value: team,
          //       child: Text(
          //         team,
          //       ),
          //     );
          //   }).toList(),
          //   onChanged: (value) {
          //     setState(() {
          //       print(value);
          //       widget.selectedTeam = value!;
          //       widget.roundMatchesData[widget.roundIndex][widget.matchIndex]
          //           [widget.teamA_B] = {
          //         "${widget.teamA_B}": {"name": value}
          //       };
          //     });
          //   },
          //   underline: Container(),
          //   // Remove the underline
          // ),
          child: Text(widget.selectedTeam),
        ),
      ],
    );
  }
}
