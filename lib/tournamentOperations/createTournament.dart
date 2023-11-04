import 'package:bottle_ver2/screens/tournamentWidgets/TournamentTile.dart';
import 'package:flutter/material.dart';

import '../models/tournamentModels/team.dart';
import '../models/tournamentModels/tournamentModels.dart';

void main() {
  runApp(MyApp());
}

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
    widget.tournament1 =
        Tournament.createTournament(bracketCount: 0, type: 'SingleElimination')
            as SingleEliminationTournament;

    widget.tournament1.generateRounds(teams: teams);

    widget.tournament2 =
        Tournament.createTournament(type: "DoubleBracket", bracketCount: 2)
            as DoubleBracketTournament;
    widget.tournament2.generateNewBracket(teams: teams, bracketIndex: 1);
    widget.tournament2.generateNewBracket(teams: teams2, bracketIndex: 2);

    print("ROUNDS: ");
    print(widget.tournament1.tournamentSpecificToMap());
    widget.tournament1.rounds.forEach((round) {
      print(round.noOfMatches);
    });
    print("-------------");

    print(widget.tournament2.tournamentSpecificToMap());
    widget.tournament2.tournamentSpecificToMap()["brackets"].forEach((bracket) {
      print("BRACKET ${bracket["bracketIndex"]}");
      bracket["rounds"].forEach((round) {
        print("ROUND: $round");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create tournament'),
        ),
        body: Center(
          child: Text('Create tournament'),
        ),
      ),
    );
  }
}
