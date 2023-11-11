import 'package:bottle_ver2/models/tournamentModels/team.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentProgressionWidgets/teamInputWidget.dart';
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

  setMatchWinner(
      {required TournamentDataProvider tournamentDataProvider,
      required String winnerName}) {
    tournamentDataProvider.tournamentData["brackets"][widget.bracketIndex - 1]
            ["rounds"][widget.roundIndex][widget.matchIndex]
        ["winner"] = {"name": winnerName};
  }

  setNextRoundParticipant(
      {required int nextRoundMatchIndex,
      required String participantName,
      required TournamentDataProvider tournamentDataProvider}) {
    if ((widget.roundIndex + 1) <
        tournamentDataProvider
            .tournamentData["brackets"][widget.bracketIndex - 1]["rounds"]
            .length) {
      if (widget.matchIndex % 2 == 0) {
        tournamentDataProvider.tournamentData["brackets"]
                [widget.bracketIndex - 1]["rounds"][widget.roundIndex + 1]
            [nextRoundMatchIndex]["participantA"] = {"name": participantName};
      } else {
        tournamentDataProvider.tournamentData["brackets"]
                [widget.bracketIndex - 1]["rounds"][widget.roundIndex + 1]
            [nextRoundMatchIndex]["participantB"] = {"name": participantName};
      }
    } else {
      tournamentDataProvider.tournamentData["brackets"][widget.bracketIndex - 1]
          ["winner"] = {"name": participantName};
    }
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

                        setMatchWinner(
                            tournamentDataProvider: tournamentDataProvider,
                            winnerName: value);

                        int nextRoundMatchIndex =
                            calculateNextRoundMatchIndex();

                        setNextRoundParticipant(
                            tournamentDataProvider: tournamentDataProvider,
                            participantName: value,
                            nextRoundMatchIndex: nextRoundMatchIndex);
                        tournamentDataProvider.notifyListeners();
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

                        setMatchWinner(
                            tournamentDataProvider: tournamentDataProvider,
                            winnerName: value);

                        int nextRoundMatchIndex =
                            calculateNextRoundMatchIndex();

                        setNextRoundParticipant(
                            tournamentDataProvider: tournamentDataProvider,
                            participantName: value,
                            nextRoundMatchIndex: nextRoundMatchIndex);
                        tournamentDataProvider.notifyListeners();
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
