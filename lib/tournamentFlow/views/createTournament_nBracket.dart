import 'package:bottle_ver2/tournamentFlow/views/tournamentContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/tournamentModels/player.dart';
import '../../models/tournamentModels/team.dart';
import '../../models/tournamentModels/tournamentModels.dart';
import '../controllers/providers/nBracketTournamentDataProvider.dart';
import 'nBracketTournamentScreen.dart';
import 'dart:convert';

import '../models/nBracketTournament.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  late N_BracketTournament tournament;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    
    widget.tournament = N_BracketTournament(
        bracketCount: 2, tournamentData: nBracket_template_8_participants);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create tournament'),
        ),
        body: TournamentContainer(tournament: widget.tournament),
      ),
    );
  }
}
