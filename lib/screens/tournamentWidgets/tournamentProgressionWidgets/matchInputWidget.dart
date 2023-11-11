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
      required this.roundMatchesData,
      required this.isMatchDecided,
      this.participantA = null,
      this.participantB = null});

  final int roundIndex;
  final int bracketIndex;
  final int matchIndex;
  List<List<Map<String, dynamic>>> roundMatchesData;
  bool isMatchDecided;
  Mappable? participantA;
  Mappable? participantB;

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

    selectedTeamA =
        widget.participantA != null ? widget.participantA!.name! : '';
    selectedTeamB =
        widget.participantB != null ? widget.participantB!.name! : '';
  }

  int calculateNextRoundMatchIndex() {
    int nextRoundMatchIndex = 0;
    if (widget.matchIndex % 2 == 0) {
      nextRoundMatchIndex = (widget.matchIndex / 2).ceil();
    } else {
      nextRoundMatchIndex = (widget.matchIndex / 2).floor();
    }
    return nextRoundMatchIndex;
  }

  setNextRoundParticipant(
      {required int nextRoundMatchIndex, required String participantName}) {
    if (widget.matchIndex % 2 == 0) {
      widget.roundMatchesData[widget.roundIndex + 1][nextRoundMatchIndex]
          ["participantA"] = {"name": participantName};
    } else {
      widget.roundMatchesData[widget.roundIndex + 1][nextRoundMatchIndex]
          ["participantB"] = {"name": participantName};
    }
    setState(() {
      widget.roundMatchesData;
    });
  }

  @override
  Widget build(BuildContext context) {
    TournamentDataProvider tournamentDataProvider =
        context.watch<TournamentDataProvider>();

    try {
      setState(() {
        selectedTeamA = tournamentDataProvider.tournamentData["brackets"]
                [widget.bracketIndex - 1]["rounds"][widget.roundIndex]
            [widget.matchIndex]["participantA"]["name"];

        selectedTeamB = tournamentDataProvider.tournamentData["brackets"]
                [widget.bracketIndex - 1]["rounds"][widget.roundIndex]
            [widget.matchIndex]["participantB"]["name"];
      });
    } catch (e) {}

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
                            [widget.matchIndex]['winner'] = {"name": value};

                        tournamentDataProvider.tournamentData["brackets"]
                                    [widget.bracketIndex - 1]["rounds"]
                                [widget.roundIndex][widget.matchIndex]
                            ["winner"] = {"name": value};

                        int nextRoundMatchIndex =
                            calculateNextRoundMatchIndex();

                        if (widget.matchIndex % 2 == 0) {
                          tournamentDataProvider.tournamentData["brackets"]
                                      [widget.bracketIndex - 1]["rounds"]
                                  [widget.roundIndex + 1][nextRoundMatchIndex]
                              ["participantA"] = {"name": value};
                        } else {
                          tournamentDataProvider.tournamentData["brackets"]
                                      [widget.bracketIndex - 1]["rounds"]
                                  [widget.roundIndex + 1][nextRoundMatchIndex]
                              ["participantB"] = {"name": value};
                        }
                        tournamentDataProvider.notifyListeners();
                        // print(
                        //     "SPOOONNN  ${tournamentDataProvider.tournamentData["brackets"][widget.bracketIndex - 1]["rounds"][widget.roundIndex][widget.matchIndex]}");
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
                            [widget.matchIndex]['winner'] = {"name": value};

                        tournamentDataProvider.tournamentData["brackets"]
                                    [widget.bracketIndex - 1]["rounds"]
                                [widget.roundIndex][widget.matchIndex]
                            ["winner"] = {"name": value};

                        int nextRoundMatchIndex =
                            calculateNextRoundMatchIndex();

                        if (widget.matchIndex % 2 == 0) {
                          tournamentDataProvider.tournamentData["brackets"]
                                      [widget.bracketIndex - 1]["rounds"]
                                  [widget.roundIndex + 1][nextRoundMatchIndex]
                              ["participantA"] = {"name": value};
                        } else {
                          tournamentDataProvider.tournamentData["brackets"]
                                      [widget.bracketIndex - 1]["rounds"]
                                  [widget.roundIndex + 1][nextRoundMatchIndex]
                              ["participantB"] = {"name": value};
                        }
                        tournamentDataProvider.notifyListeners();
                        // print(
                        //     "SPOOONNN  ${tournamentDataProvider.tournamentData["brackets"][widget.bracketIndex - 1]["rounds"][widget.roundIndex][widget.matchIndex]}");
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
      required this.roundIndex,
      required this.matchIndex,
      required this.participantA_B,
      required this.roundMatchesData});

  String selectedTeam;

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
        [widget.participantA_B] = {"name": widget.selectedTeam};
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
