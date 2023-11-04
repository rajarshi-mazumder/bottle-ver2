import 'package:bottle_ver2/screens/tournamentWidgets/TournamentTile.dart';
import 'package:flutter/material.dart';

import '../models/tournamentModels/team.dart';
import '../models/tournamentModels/tournamentModels.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  late Tournament tournament;
  late BracketTournament bracketTournament;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    widget.tournament = Tournament(teams: teams);
    widget.tournament.generateRounds(teams: teams);

    // widget.bracketTournament = BracketTournament();
    // widget.bracketTournament.addNewBracket(teams, 1);
    // widget.bracketTournament.addNewBracket(teams2, 2);
    // print(widget.tournament.rounds);
    print("------------------");
    print(widget.tournament.rounds);
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
