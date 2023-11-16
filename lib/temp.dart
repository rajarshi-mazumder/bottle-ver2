import 'dart:math';

import 'package:bottle_ver2/tournamentOperations/providers/doubleBracketTournamentDataProvider.dart';
import 'package:bottle_ver2/tournamentOperations/tournamentScreenWidgets/doubleElimTournamentUtilities/winnerLoserRoundHashMap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VCT Champions Tournament',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TournamentScreen(participants: 8),
    );
  }
}

class TournamentScreen extends StatelessWidget {
  final int participants;

  TournamentScreen({required this.participants});

  @override
  Widget build(BuildContext context) {
    int winnerRounds = (participants / 2).floor().bitLength;
    int loserRounds = winnerRounds * 2 - 1;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DoubleElimTournamentDataProvider>(
          create: (context) {
            DoubleElimTournamentDataProvider doubleElimTournamentDataProvider =
                DoubleElimTournamentDataProvider();

            return doubleElimTournamentDataProvider;
          },
        ),
      ],
      child: Consumer<DoubleElimTournamentDataProvider>(
        builder: (BuildContext context, DoubleElimTournamentDataProvider value,
            Widget? child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('VCT Champions Tournament'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Winners Bracket',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      for (int i = 0; i < winnerRounds; i++)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: RoundWidget(
                              bracketType: 'winnersBracketMap',
                              roundNumber: i,
                              matchCount: (pow(2,
                                      (log(participants) ~/ log(2)) - (i + 1)))
                                  .toInt()),
                        ),
                      SizedBox(height: 20),
                    ],
                  ),
                  Text('Losers Bracket',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      for (int i = 0; i < loserRounds; i++)
                        RoundWidget(
                            bracketType: 'losersBracketMap',
                            roundNumber: i,
                            matchCount: calculateLoserMatches(i, winnerRounds)),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  int calculateLoserMatches(int round, int winnerRounds) {
    if (round == 1) return participants ~/ 4;
    if (round % 2 == 0) return (participants / (1 << (round ~/ 2 + 1))).ceil();
    return (participants / (1 << ((round + 1) ~/ 2))).ceil();
  }
}

class RoundWidget extends StatelessWidget {
  final String bracketType;
  final int roundNumber;
  final int matchCount;

  RoundWidget(
      {required this.bracketType,
      required this.roundNumber,
      required this.matchCount});

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
                  matchNumber: index)),
        ],
      ),
    );
  }
}

class MatchWidget extends StatefulWidget {
  final String bracketType;
  final int roundNumber;
  final int matchNumber;
  String? participantA;
  String? participantB;

  MatchWidget({
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
                print(widget.roundNumber);
                print(winnerLoserRoundHashMap_8_teams["w_l"]
                    ["w_r_${widget.roundNumber}"]);
                int tempRoundIndex = winnerLoserRoundHashMap_8_teams["w_l"]
                    ["w_r_${widget.roundNumber}"]["loser_bracket_round_index"];
                doubleElimTournamentDataProvider
                            .tournamentData["losersBracketMap"]["rounds"]
                        [tempRoundIndex]["matches"][widget.matchNumber]
                    ["participantA"]["name"] = participantA;
                doubleElimTournamentDataProvider.notifyListeners();
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
          TeamWidget(
              teamIndex: 2,
              matchIndex: widget.matchNumber,
              roundIndex: widget.roundNumber,
              bracketType: widget.bracketType,
              participantA_B: participantB),
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
