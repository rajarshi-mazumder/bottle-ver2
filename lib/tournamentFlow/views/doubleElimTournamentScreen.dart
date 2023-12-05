import 'dart:convert';
import 'dart:math';

import 'package:bottle_ver2/tournamentFlow/controllers/data/tournamentDatabase.dart';
import 'package:bottle_ver2/tournamentFlow/controllers/providers/doubleBracketTournamentDataProvider.dart';
import 'package:bottle_ver2/tournamentFlow/models/doubleElimTournament.dart';
import 'package:bottle_ver2/tournamentFlow/views/createTournament_nBracket.dart';
import 'package:bottle_ver2/tournamentOperations/tournamentScreenWidgets/doubleElimTournamentUtilities/winnerLoserRoundHashMap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/tournamentModels/tournamentModels.dart';

class DoubleElimTournamentScreen extends StatelessWidget {
  Map<String, dynamic> winnerLoserHashMap;

  // List<String>? participants;
  Map<String, dynamic> template;
  DoubleElimTournament_Hive doubleElimTournament_Hive;

  DoubleElimTournamentScreen({
    required this.winnerLoserHashMap,
    required this.template,
    required this.doubleElimTournament_Hive,
    // this.participants,
  });

  // List setFirstRoundMatches({required List<String> participants}) {
  //   List matches =
  //       doubleElimTournament.generateMatchPairs(participants: participants);
  //
  //   return matches;
  //
  // }

  saveTournament(
      {required DoubleElimTournamentDataProvider
          doubleElimTournamentDataProvider}) {
    doubleElimTournament_Hive.tournamentData =
        doubleElimTournamentDataProvider.tournamentData;
    TournamentDatabase().saveTournament(doubleElimTournament_Hive);
  }

  deleteTournament(
      {required DoubleElimTournament_Hive doubleElimTournament_Hive}) {
    TournamentDatabase().deleteTournament(0);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DoubleElimTournamentDataProvider>(
          create: (context) {
            // if (participants != null) {
            //   List matches = setFirstRoundMatches(participants: participants!);
            //
            //   for (int i = 0; i < matches.length; i++) {
            //     try {
            //       winnersBracketMap["rounds"][0]["matches"][i]["participantA"]
            //           ["name"] = matches[i]["participantA"]["name"];
            //       winnersBracketMap["rounds"][0]["matches"][i]["participantB"]
            //           ["name"] = matches[i]["participantB"]["name"];
            //     } catch (e) {
            //       // print("PPPPPP ${matches[i]}");
            //       print("PPPPPP ${winnersBracketMap["rounds"]["matches"][i]}");
            //     }
            //   }
            //   matches.forEach((match) {});
            // }
            DoubleElimTournamentDataProvider doubleElimTournamentDataProvider =
                DoubleElimTournamentDataProvider(
              tournamentData: doubleElimTournament_Hive.tournamentData,
            );

            return doubleElimTournamentDataProvider;
          },
        ),
      ],
      child: Consumer<DoubleElimTournamentDataProvider>(
        builder: (BuildContext context,
            DoubleElimTournamentDataProvider doubleElimTournamentDataProvider,
            Widget? child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('VCT Champions Tournament'),
            ),
            body: Row(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('Winners Bracket',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          for (int i = 0;
                              i <
                                  doubleElimTournament_Hive
                                          .tournamentData["winnersBracketMap"]
                                      ["noOfRounds"];
                              i++)
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: RoundWidget(
                                  tournamentHashMap: winnerLoserHashMap,
                                  bracketType: 'winnersBracketMap',
                                  roundNumber: i,
                                  matchCount: doubleElimTournament_Hive
                                          .tournamentData["winnersBracketMap"]
                                      ["rounds"][i]["noOfMatches"]),
                            ),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Text('Grand Final',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: RoundWidget(
                                    tournamentHashMap: winnerLoserHashMap,
                                    bracketType: 'postBracketMap',
                                    roundNumber: 0,
                                    matchCount: doubleElimTournament_Hive
                                            .tournamentData["postBracketMap"]
                                        ["rounds"][0]["noOfMatches"]),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Winner',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                    doubleElimTournamentDataProvider
                                        .tournamentData["winner"]["name"],
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text('Losers Bracket',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          for (int i = 0;
                              i <
                                  doubleElimTournamentDataProvider
                                          .tournamentData["losersBracketMap"]
                                      ["noOfRounds"];
                              i++)
                            RoundWidget(
                                tournamentHashMap: winnerLoserHashMap,
                                bracketType: 'losersBracketMap',
                                roundNumber: i,
                                // matchCount: calculateLoserBracketRoundsMatcheCount(i, winnerRounds)),
                                matchCount: doubleElimTournamentDataProvider
                                        .tournamentData["losersBracketMap"]
                                    ["rounds"][i]["noOfMatches"]),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          saveTournament(
                              doubleElimTournamentDataProvider:
                                  doubleElimTournamentDataProvider);
                        },
                        child: Text(
                          "Save Tournament",
                          style: TextStyle(color: Colors.white),
                        )),
                    SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () {
                          deleteTournament(
                              doubleElimTournament_Hive:
                                  doubleElimTournament_Hive);
                        },
                        child: Text(
                          "Delete Tournament Box",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class RoundWidget extends StatelessWidget {
  final String bracketType;
  final int roundNumber;
  final int matchCount;
  Map<String, dynamic> tournamentHashMap;

  RoundWidget({
    required this.bracketType,
    required this.roundNumber,
    required this.matchCount,
    required this.tournamentHashMap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Round $roundNumber',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...List.generate(
              matchCount,
              (index) => MatchWidget(
                    bracketType: bracketType,
                    roundNumber: roundNumber,
                    matchNumber: index,
                    tournamentHashMap: tournamentHashMap,
                  )),
        ],
      ),
    );
  }
}

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

class TeamWidget extends StatelessWidget {
  final int teamIndex;
  final int matchIndex;
  final int roundIndex;
  final String bracketType;
  String? participantA_B;

  TeamWidget({
    required this.teamIndex,
    required this.matchIndex,
    required this.roundIndex,
    required this.bracketType,
    this.participantA_B,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      color: Colors.grey[300],
      // child: Text(' $bracketType- R $roundIndex, M $matchIndex'),
      child: Text(participantA_B.toString()),
    );
  }
}

class Team {
  final int id;
  final String name;

  Team({required this.id, required this.name});
}