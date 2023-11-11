import 'package:bottle_ver2/screens/teamsWidgets/playerWidgets/playerDisplayWidget.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/TournamentTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tournamentModels/player.dart';
import '../models/tournamentModels/round.dart';
import '../models/tournamentModels/team.dart';
import '../models/tournamentModels/tournamentModels.dart';
import '../models/tournamentModels/match.dart';
import '../screens/tournamentWidgets/tournamentCreateWidgets/tournamentEdit.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/matchInputWidget.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/tournamentProgressionDisplay.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/winnerInputWidget.dart';
import 'bracketRounds.dart';
import 'package:bottle_ver2/models/tournamentModels/match.dart';

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
        bracketCount: 1,
        participantType: "player") as DoubleBracketTournament;
    widget.tournament2
        .generateNewBracket(participantsList: participants1, bracketIndex: 1);
    // widget.tournament2
    //     .generateNewBracket(participantsList: participants1, bracketIndex: 2);

    print("ROUNDS: ");
    print(widget.tournament1.tournamentSpecificToMap());
    widget.tournament1.rounds.forEach((round) {
      print(round.noOfMatches);
    });
    print("-------------");

    print(widget.tournament2.tournamentSpecificToMap());
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
            tournamentDataProvider.bracketCount = 1;
            return tournamentDataProvider;
          },
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text("TOURNEYY"),
          ),
          body: TournamentEdit(
              tournament: widget.tournament as DoubleBracketTournament)),
    );
  }
}
