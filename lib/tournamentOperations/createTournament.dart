import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/tournamentModels/player.dart';
import '../models/tournamentModels/team.dart';
import '../models/tournamentModels/tournamentModels.dart';
import '../screens/tournamentWidgets/tournamentCreateWidgets/doubleBracketTournamentEdit.dart';
import 'dart:convert';

class TournamentDataProvider with ChangeNotifier {
  Map<String, dynamic> tournamentData = {"brackets": []};
  int bracketCount = 1;

  @override
  notifyListeners() {
    super.notifyListeners();
    print(tournamentData["brackets"].length);
  }
}

void main() {
  runApp(MyApp());
}


String tempTournamentString = "{brackets: [{bracketIndex: 1, rounds: [[{round: 0, participantA: {name: Sentinels}, participantB: {name: PRX}, winner: {name: Sentinels}}, {round: 0, participantA: {name: Zeta}, participantB: {name: Cloud 9}, winner: {name: Zeta}}, {round: 0, participantA: {name: NAVI}, participantB: {name: Fnatic}, winner: {name: NAVI}}, {round: 0, participantA: {name: DRX}, participantB: {name: Optic}, winner: {name: Optic}}], [{round: 1, participantA: {name: Sentinels}, participantB: {name: Zeta}, winner: {name: Sentinels}}, {round: 1, participantA: {name: NAVI}, participantB: {name: Optic}, winner: {name: Optic}}], [{round: 2, participantA: {name: Sentinels}, participantB: {name: Optic}, winner: {name: Optic}}]], winner: {name: Optic}}, {bracketIndex: 2, rounds: [[{round: 0, participantA: {name: DRX2}, participantB: {name: Zeta2}, winner: {name: DRX2}}, {round: 0, participantA: {name: Sentinels2}, participantB: {name: Cloud 9_2}, winner: {name: Sentinels2}}], [{round: 1, participantA: {name: DRX2}, participantB: {name: Sentinels2}, winner: {name: DRX2}}]], winner: {name: DRX2}}]}";


class MyApp extends StatefulWidget {
  late SingleEliminationTournament tournament1;
  late DoubleBracketTournament tournament2;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    widget.tournament1 = Tournament.createTournament(
        bracketCount: 0,
        type: 'SingleElimination',
        participantType: "player") as SingleEliminationTournament;

    widget.tournament1.generateRounds(participants: participants1);

    widget.tournament2 = Tournament.createTournament(
        type: "DoubleBracket",
        bracketCount: 2,
        participantType: "team") as DoubleBracketTournament;
    widget.tournament2
        .generateNewBracket(participantsList: teams, bracketIndex: 1);
    widget.tournament2
        .generateNewBracket(participantsList: teams2, bracketIndex: 2);

    print(widget.tournament2.brackets);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create tournament'),
        ),
        body: TournamentEditHolder(
          tournament: widget.tournament2,
        ),
      ),
    );
  }
}

class TournamentEditHolder extends StatefulWidget {
  TournamentEditHolder({super.key, required this.tournament});

  Tournament tournament;

  @override
  State<TournamentEditHolder> createState() => _TournamentEditHolderState();
}

class _TournamentEditHolderState extends State<TournamentEditHolder> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TournamentDataProvider>(
          create: (context) {
            TournamentDataProvider tournamentDataProvider =
            TournamentDataProvider();
            if (widget.tournament.runtimeType == SingleEliminationTournament)
              tournamentDataProvider.bracketCount = 1;
            else if (widget.tournament.runtimeType == DoubleBracketTournament) {
              DoubleBracketTournament temp =
              widget.tournament as DoubleBracketTournament;
              tournamentDataProvider.bracketCount = temp.bracketCount;
            }
            return tournamentDataProvider;
          },
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text("TOURNEYY"),
          ),
          body: DoubleBracketTournamentEdit(
              tournament: widget.tournament as DoubleBracketTournament)),
    );
  }
}
