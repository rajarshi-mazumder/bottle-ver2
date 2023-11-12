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

String tempTournamentString = """ [
  {
    "bracketIndex": 0,
    "rounds": [
      {
        "roundIndex": 0,
        "noOfMatches": 4,
        "matches": [
          {
            "participantA": { "name": "Cloud 9" },
            "participantB": { "name": "DRX" },
            "winner": { "name": "Cloud 9" }
          },
          {
            "participantA": { "name": "Sentinels" },
            "participantB": { "name": "Zeta" },
            "winner": { "name": "Sentinels" }
          },
          {
            "participantA": { "name": "NAVI" },
            "participantB": { "name": "Fnatic" },
            "winner": { "name": "NAVI" }
          },
          {
            "participantA": { "name": "PRX" },
            "participantB": { "name": "Optic" },
            "winner": { "name": "PRX" }
          }
        ]
      },
      {
        "roundIndex": 1,
        "noOfMatches": 2,
        "matches": [
          {
            "participantA": { "name": "Cloud 9" },
            "participantB": { "name": "Sentinels" },
            "winner": { "name": "Cloud 9" }
          },
          {
            "participantA": { "name": "NAVI" },
            "participantB": { "name": "PRX" },
            "winner": { "name": "NAVI" }
          }
        ]
      },
      {
        "roundIndex": 2,
        "noOfMatches": 1,
        "matches": [
          {
            "participantA": { "name": "Cloud 9" },
            "participantB": { "name": "NAVI" },
            "winner": { "name": "Cloud 9" }
          }
        ]
      }
    ],
    "winner": { "name": "Cloud 9" }
  },
  {
    "bracketIndex": 1,
    "rounds": [
      {
        "roundIndex": 0,
        "noOfMatches": 2,
        "matches": [
          {
            "participantA": { "name": "Cloud 9_2" },
            "participantB": { "name": "DRX2" },
            "winner": null
          },
          {
            "participantA": { "name": "Zeta2" },
            "participantB": { "name": "Sentinels2" },
            "winner": null
          }
        ]
      },
      {
        "roundIndex": 1,
        "noOfMatches": 1,
        "matches": [
          {
            "participantA": { "name": "" },
            "participantB": { "name": "" },
            "winner": null
          }
        ]
      }
    ],
    "winner": null
  }
]
""";

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

    List<String> playersList1 = participants1.map((e) => e.name ?? '').toList();
    widget.tournament1.generateRounds(participants: playersList1);

    widget.tournament2 = Tournament.createTournament(
        type: "DoubleBracket",
        bracketCount: 2,
        participantType: "team") as DoubleBracketTournament;

    List<String> teamsList1 = teams.map((e) => e.name ?? '').toList();
    List<String> teamsList2 = teams2.map((e) => e.name ?? '').toList();
    widget.tournament2
        .generateNewBracket(participantsList: teamsList1, bracketIndex: 0);
    widget.tournament2
        .generateNewBracket(participantsList: teamsList2, bracketIndex: 1);

    print(widget.tournament2.brackets);
    print("-----------------------");

    // print(json.decode(tempTournamentString));
    widget.tournament2.brackets = json.decode(tempTournamentString);
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
