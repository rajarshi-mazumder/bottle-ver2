import 'package:bottle_ver2/tournamentFlow/views/doubleElimTournamentWidgets/teamWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/providers/doubleBracketTournamentDataProvider.dart';

class MatchWidget extends StatefulWidget {
  Map<String, dynamic> tournamentHashMap;
  final String bracketType;
  final int roundNumber;
  final int matchNumber;
  String? participantA;
  String? participantB;

  MatchWidget({
    required this.tournamentHashMap,
    required this.bracketType,
    required this.roundNumber,
    required this.matchNumber,
    this.participantA,
    this.participantB,
  });

  @override
  State<MatchWidget> createState() => _MatchWidgetState();
}

class _MatchWidgetState extends State<MatchWidget> {
  setWinnerBracketWinnerParticipant(
      {required DoubleElimTournamentDataProvider
          doubleElimTournamentDataProvider,
      required String participant}) {
    if (widget.tournamentHashMap["w_l"]["w_r_${widget.roundNumber}"]
            ["isLastRound"] ==
        false) {
      if (widget.roundNumber <
          doubleElimTournamentDataProvider.tournamentData["winnersBracketMap"]
                  ["noOfRounds"] -
              1) {
        int nextRoundMatchIndex = calculateNextRoundMatchIndex();
        if (widget.matchNumber % 2 == 0) {
          doubleElimTournamentDataProvider.tournamentData["winnersBracketMap"]
                  ["rounds"][widget.roundNumber + 1]["matches"]
              [nextRoundMatchIndex]["participantA"]["name"] = participant;
        } else {
          doubleElimTournamentDataProvider.tournamentData["winnersBracketMap"]
                  ["rounds"][widget.roundNumber + 1]["matches"]
              [nextRoundMatchIndex]["participantB"]["name"] = participant;
        }

        doubleElimTournamentDataProvider.notifyListeners();
      }
    } else {
      setPostBracketParticipantA(
          doubleElimTournamentDataProvider: doubleElimTournamentDataProvider,
          participant: participant);
    }
  }

  setLoserBracketLoserParticipant(
      {required DoubleElimTournamentDataProvider
          doubleElimTournamentDataProvider,
      required String participantA_B,
      required int thisParticipantIndex}) {
    if (widget.tournamentHashMap["l_b"]["l_r_${widget.roundNumber}"]
            ["isLastRound"] ==
        false) {
      int loserBracketRoundIndex = widget.tournamentHashMap["w_l"]
          ["w_r_${widget.roundNumber}"]["loser_bracket_round_index"];

      var nextRoundParticipantIndex = widget.tournamentHashMap["w_l"]
              ["w_r_${widget.roundNumber}"]["match_maps"]
          ["m_${widget.matchNumber}_p_${thisParticipantIndex}"]["m"];

      var nextRoundParticipant = widget.tournamentHashMap["w_l"]
              ["w_r_${widget.roundNumber}"]["match_maps"]
          ["m_${widget.matchNumber}_p_${thisParticipantIndex}"]["p"];

      doubleElimTournamentDataProvider.tournamentData["losersBracketMap"]
                  ["rounds"][loserBracketRoundIndex]["matches"]
              [nextRoundParticipantIndex][nextRoundParticipant]["name"] =
          participantA_B; // loser goes to the losers bracket round, thats why b not A
      doubleElimTournamentDataProvider.notifyListeners();
    }
  }

  setLoserBracketWinnerParticipant(
      {required DoubleElimTournamentDataProvider
          doubleElimTournamentDataProvider,
      required String participant}) {
    if (!widget.tournamentHashMap["l_b"]["l_r_${widget.roundNumber}"]
        ["isLastRound"]) {
      print(
          "I PRINT l_r_${widget.roundNumber}, ${widget.tournamentHashMap["l_b"]["l_r_${widget.roundNumber}"]}");
      var nextRoundMatchIndex = widget.tournamentHashMap["l_b"]
              ["l_r_${widget.roundNumber}"]["match_maps"]
          ["m_${widget.matchNumber}_w"]["m"];

      var nextRoundMatchParticipant = widget.tournamentHashMap["l_b"]
              ["l_r_${widget.roundNumber}"]["match_maps"]
          ["m_${widget.matchNumber}_w"]["p"];

      doubleElimTournamentDataProvider.tournamentData["losersBracketMap"]
              ["rounds"][widget.roundNumber + 1]["matches"][nextRoundMatchIndex]
          [nextRoundMatchParticipant]["name"] = participant;

      doubleElimTournamentDataProvider.notifyListeners();
    } else {
      setPostBracketParticipantB(
          doubleElimTournamentDataProvider: doubleElimTournamentDataProvider,
          participant: participant);
    }
    // print(nextRoundMatchIndex);
  }

  setPostBracketParticipantA(
      {required DoubleElimTournamentDataProvider
          doubleElimTournamentDataProvider,
      required String participant}) {
    doubleElimTournamentDataProvider.tournamentData["postBracketMap"]["rounds"]
        [0]["matches"][0]["participantA"]["name"] = participant;

    doubleElimTournamentDataProvider.notifyListeners();
    // print(nextRoundMatchIndex);
  }

  setPostBracketParticipantB(
      {required DoubleElimTournamentDataProvider
          doubleElimTournamentDataProvider,
      required String participant}) {
    doubleElimTournamentDataProvider.tournamentData["postBracketMap"]["rounds"]
        [0]["matches"][0]["participantB"]["name"] = participant;

    doubleElimTournamentDataProvider.notifyListeners();
    // print(nextRoundMatchIndex);
  }

  setTournamentWinner(
      {required DoubleElimTournamentDataProvider
          doubleElimTournamentDataProvider,
      required String participant}) {
    doubleElimTournamentDataProvider.tournamentData["winner"]["name"] =
        participant;
    doubleElimTournamentDataProvider.notifyListeners();
  }

  int calculateNextRoundMatchIndex() {
    int nextRoundMatchIndex = 0;
    if (widget.matchNumber % 2 == 0) {
      nextRoundMatchIndex = (widget.matchNumber / 2).ceil();
    } else {
      nextRoundMatchIndex = (widget.matchNumber / 2).floor();
    }
    return nextRoundMatchIndex;
  }

  @override
  Widget build(BuildContext context) {
    DoubleElimTournamentDataProvider doubleElimTournamentDataProvider =
        context.watch<DoubleElimTournamentDataProvider>();

    String participantA = "";
    String participantB = "";
    setState(() {});
    try {
      participantA = doubleElimTournamentDataProvider
          .tournamentData[widget.bracketType]["rounds"][widget.roundNumber]
              ["matches"][widget.matchNumber]["participantA"]["name"]
          .toString();
    } catch (e) {}
    try {
      participantB = doubleElimTournamentDataProvider
          .tournamentData[widget.bracketType]["rounds"][widget.roundNumber]
              ["matches"][widget.matchNumber]["participantB"]["name"]
          .toString();
    } catch (e) {}

    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              if (widget.bracketType == "winnersBracketMap") {
                setLoserBracketLoserParticipant(
                  doubleElimTournamentDataProvider:
                      doubleElimTournamentDataProvider,
                  participantA_B: participantB,
                  thisParticipantIndex: 0,
                );

                setWinnerBracketWinnerParticipant(
                    doubleElimTournamentDataProvider:
                        doubleElimTournamentDataProvider,
                    participant: participantA);
              } else if (widget.bracketType == "losersBracketMap") {
                setLoserBracketWinnerParticipant(
                    doubleElimTournamentDataProvider:
                        doubleElimTournamentDataProvider,
                    participant: participantA);
              } else if (widget.bracketType == "postBracketMap") {
                setTournamentWinner(
                    doubleElimTournamentDataProvider:
                        doubleElimTournamentDataProvider,
                    participant: participantA);
              }
            },
            child: TeamWidget(
              teamIndex: 1,
              matchIndex: widget.matchNumber,
              roundIndex: widget.roundNumber,
              bracketType: widget.bracketType,
              participantA_B: participantA,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.bracketType == "winnersBracketMap") {
                setLoserBracketLoserParticipant(
                  doubleElimTournamentDataProvider:
                      doubleElimTournamentDataProvider,
                  participantA_B: participantA,
                  thisParticipantIndex: 1,
                );

                setWinnerBracketWinnerParticipant(
                    doubleElimTournamentDataProvider:
                        doubleElimTournamentDataProvider,
                    participant: participantB);
              } else if (widget.bracketType == "losersBracketMap") {
                setLoserBracketWinnerParticipant(
                    doubleElimTournamentDataProvider:
                        doubleElimTournamentDataProvider,
                    participant: participantB);
              } else if (widget.bracketType == "postBracketMap") {
                setTournamentWinner(
                    doubleElimTournamentDataProvider:
                        doubleElimTournamentDataProvider,
                    participant: participantB);
              }
            },
            child: TeamWidget(
                teamIndex: 2,
                matchIndex: widget.matchNumber,
                roundIndex: widget.roundNumber,
                bracketType: widget.bracketType,
                participantA_B: participantB),
          ),
        ],
      ),
    );
  }
}
