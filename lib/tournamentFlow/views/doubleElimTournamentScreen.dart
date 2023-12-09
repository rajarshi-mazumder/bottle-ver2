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
import 'doubleElimTournamentWidgets/matchWidget.dart';
import 'doubleElimTournamentWidgets/roundWidget.dart';
import 'doubleElimTournamentWidgets/teamWidget.dart';

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
