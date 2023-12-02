import 'package:bottle_ver2/models/tournamentModels/team.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentProgressionWidgets/tournamentProgressionInput.dart';
import 'package:bottle_ver2/tournamentFlow/views/createTournament_nBracket.dart';
import 'package:bottle_ver2/tournamentFlow/views/nBracketTournamentWidgets/teamInputWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../themes/themes.dart';
import '../../controllers/providers/nBracketTournamentDataProvider.dart';

class PostBracketMatchInput extends StatefulWidget {
  PostBracketMatchInput(
      {Key? key,
      required this.matchIndex,
      required this.roundIndex,
      required this.isMatchDecided,
      this.participantA = null,
      this.participantB = null});

  final int roundIndex;
  final int matchIndex;
  bool isMatchDecided;
  String? participantA;
  String? participantB;

  @override
  State<PostBracketMatchInput> createState() => _PostBracketMatchInputState();
}

class _PostBracketMatchInputState extends State<PostBracketMatchInput> {
  String selectedTeamA = '';
  String selectedTeamB = '';
  String winner = '';

  @override
  void initState() {
    super.initState();
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
      {required nBracketTournamentDataProvider tournamentDataProvider,
      required String winnerName}) {
    tournamentDataProvider.tournamentData["postBracketRounds"]["rounds"]
            [widget.roundIndex]["matches"][widget.matchIndex]
        .update("winner", (value) => {"name": winnerName},
            ifAbsent: () => {"name": winnerName});
  }

  setNextRoundParticipant(
      {required int nextRoundMatchIndex,
      required String participantName,
      required nBracketTournamentDataProvider tournamentDataProvider}) {
    if ((widget.roundIndex + 1) <
        tournamentDataProvider
            .tournamentData["postBracketRounds"]["rounds"].length) {
      if (widget.matchIndex % 2 == 0) {
        tournamentDataProvider.tournamentData["postBracketRounds"]["rounds"]
                [widget.roundIndex + 1]["matches"][nextRoundMatchIndex]
            .update("participantA", (value) => {"name": participantName},
                ifAbsent: () => {"name": participantName});
      } else {
        tournamentDataProvider.tournamentData["postBracketRounds"]["rounds"]
                [widget.roundIndex + 1]["matches"][nextRoundMatchIndex]
            .update("participantB", (value) => {"name": participantName},
                ifAbsent: () => {"name": participantName});
      }
    } else {
      tournamentDataProvider.tournamentData["postBracketRounds"]
          ["winner"] = {"name": participantName};
    }
  }

  @override
  Widget build(BuildContext context) {
    nBracketTournamentDataProvider tournamentDataProvider =
        context.watch<nBracketTournamentDataProvider>();

    try {
      setState(() {
        selectedTeamA =
            tournamentDataProvider.tournamentData["postBracketRounds"]["rounds"]
                    [widget.roundIndex]["matches"][widget.matchIndex]
                ["participantA"]["name"];

        selectedTeamB =
            tournamentDataProvider.tournamentData["postBracketRounds"]["rounds"]
                    [widget.roundIndex]["matches"][widget.matchIndex]
                ["participantB"]["name"];
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
                  bracketIndex: 0,
                  roundIndex: widget.roundIndex,
                  matchIndex: widget.matchIndex,
                  participantA_B: "participantA",
                  // roundMatchesData: widget.roundMatchesData,
                ),
                if (selectedTeamA != '')
                  Radio<String>(
                    value: selectedTeamA,
                    groupValue: winner,
                    onChanged: (value) {
                      setState(() {
                        winner = value!;
                        // widget.roundMatchesData[widget.roundIndex]
                        //     [widget.matchIndex]['winner'] = {"name": value};

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
                  bracketIndex: 0,
                  roundIndex: widget.roundIndex,
                  matchIndex: widget.matchIndex,
                  participantA_B: "participantB",
                  // roundMatchesData: widget.roundMatchesData,
                ),
                if (selectedTeamB != '')
                  Radio<String>(
                    value: selectedTeamB,
                    groupValue: winner,
                    onChanged: (value) {
                      setState(() {
                        winner = value!;
                        // widget.roundMatchesData[widget.roundIndex]
                        //     [widget.matchIndex]['winner'] = {"name": value};

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
