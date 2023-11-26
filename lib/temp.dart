import 'dart:math';

import 'package:bottle_ver2/tournamentOperations/providers/doubleBracketTournamentDataProvider.dart';
import 'package:bottle_ver2/tournamentOperations/tournamentScreenWidgets/doubleElimTournamentUtilities/winnerLoserRoundHashMap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/tournamentModels/tournamentModels.dart';

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
  late DoubleElimTournament doubleElimTournament;
  Map<String, dynamic> tournamentHashMap = winnerLoserRoundHashMap_8_teams;

  TournamentScreen({required this.participants});

  @override
  Widget build(BuildContext context) {
    doubleElimTournament = DoubleElimTournament(participants: participants);

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
                      for (int i = 0;
                      i < doubleElimTournament.winnerRounds;
                      i++)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: RoundWidget(
                              tournamentHashMap: tournamentHashMap,
                              doubleElimTournament: doubleElimTournament,
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
                      for (int i = 0; i < doubleElimTournament.loserRounds; i++)
                        RoundWidget(
                            tournamentHashMap: tournamentHashMap,
                            doubleElimTournament: doubleElimTournament,
                            bracketType: 'losersBracketMap',
                            roundNumber: i,
                            // matchCount: calculateLoserBracketRoundsMatcheCount(i, winnerRounds)),
                            matchCount: tournamentHashMap[
                            "l_bracket_rounds_match_count"][i]),
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
}

class RoundWidget extends StatelessWidget {
  final String bracketType;
  final int roundNumber;
  final int matchCount;
  Map<String, dynamic> tournamentHashMap;
  DoubleElimTournament doubleElimTournament;

  RoundWidget({required this.bracketType,
    required this.roundNumber,
    required this.matchCount,
    required this.tournamentHashMap,
    required this.doubleElimTournament});

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
                  (index) =>
                  MatchWidget(
                    bracketType: bracketType,
                    roundNumber: roundNumber,
                    matchNumber: index,
                    tournamentHashMap: tournamentHashMap,
                    doubleElimTournament: doubleElimTournament,
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
  DoubleElimTournament doubleElimTournament;

  MatchWidget({
    required this.tournamentHashMap,
    required this.bracketType,
    required this.roundNumber,
    required this.matchNumber,
    this.participantA,
    this.participantB,
    required this.doubleElimTournament,
  });

  @override
  State<MatchWidget> createState() => _MatchWidgetState();
}

class _MatchWidgetState extends State<MatchWidget> {

  setWinnerBracketWinnerParticipant(
      {required DoubleElimTournamentDataProvider doubleElimTournamentDataProvider,
        required String participant
      }) {
    if (widget.roundNumber <
        widget.doubleElimTournament.winnerRounds - 1) {
      int nextRoundMatchIndex = calculateNextRoundMatchIndex();
      if (widget.matchNumber % 2 == 0) {
        doubleElimTournamentDataProvider
            .tournamentData["winnersBracketMap"]
        ["rounds"]
        [widget.roundNumber + 1]["matches"]
        [nextRoundMatchIndex]["participantA"]["name"] =
            participant;
      } else {
        doubleElimTournamentDataProvider
            .tournamentData["winnersBracketMap"]
        ["rounds"]
        [widget.roundNumber + 1]["matches"]
        [nextRoundMatchIndex]["participantB"]["name"] =
            participant;
      }

      doubleElimTournamentDataProvider.notifyListeners();
    }
  }


  setLoserBracketLoserParticipant({required DoubleElimTournamentDataProvider
  doubleElimTournamentDataProvider,
    required String participantA_B,
    required int thisParticipantIndex}) {
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

  setLoserBracketWinnerParticipant({required DoubleElimTournamentDataProvider
  doubleElimTournamentDataProvider,
    required String participant}) {
    if (!widget.tournamentHashMap["l_b"]["l_r_${widget.roundNumber}"]
    ["isLastRound"]) {
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
      // print(nextRoundMatchIndex);
    }
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
                    doubleElimTournamentDataProvider: doubleElimTournamentDataProvider,
                    participant: participantA
                );
              } else if (widget.bracketType == "losersBracketMap") {
                setLoserBracketWinnerParticipant(
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
                    doubleElimTournamentDataProvider: doubleElimTournamentDataProvider,
                    participant: participantB
                );
              } else if (widget.bracketType == "losersBracketMap") {
                setLoserBracketWinnerParticipant(
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
