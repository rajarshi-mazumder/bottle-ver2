import 'package:bottle_ver2/tournamentFlow/views/tournamentContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/tournamentModels/player.dart';
import '../../models/tournamentModels/team.dart';
import '../../models/tournamentModels/tournamentModels.dart';
import 'nBracketTournamentScreen.dart';
import 'dart:convert';

import '../models/nBracketTournament.dart';

void main() {
  runApp(MyApp());
}

Map<String, dynamic> nBracket_template_8_participants = {
  "brackets": [
    {
      "bracketIndex": 0,
      "rounds": [
        {
          "roundIndex": 0,
          "noOfMatches": 4,
          "matches": [
            {
              "participantA": {"name": "Cloud 9"},
              "participantB": {"name": "DRX"},
              "winner": {"name": "Cloud 9"}
            },
            {
              "participantA": {"name": "Sentinels"},
              "participantB": {"name": "Zeta"},
              "winner": {"name": "Sentinels"}
            },
            {
              "participantA": {"name": "NAVI"},
              "participantB": {"name": "Fnatic"},
              "winner": {"name": "NAVI"}
            },
            {
              "participantA": {"name": "PRX"},
              "participantB": {"name": "Optic"},
              "winner": {"name": "PRX"}
            }
          ]
        },
        {
          "roundIndex": 1,
          "noOfMatches": 2,
          "matches": [
            {
              "participantA": {"name": "Cloud 9"},
              "participantB": {"name": "Sentinels"},
              "winner": {"name": "Cloud 9"}
            },
            {
              "participantA": {"name": "NAVI"},
              "participantB": {"name": "PRX"},
              "winner": {"name": "NAVI"}
            }
          ]
        },
        {
          "roundIndex": 2,
          "noOfMatches": 1,
          "matches": [
            {
              "participantA": {"name": "Cloud 9"},
              "participantB": {"name": "NAVI"},
              "winner": {"name": "Cloud 9"}
            }
          ]
        }
      ],
      "winner": {"name": "Cloud 9"}
    },
    {
      "bracketIndex": 1,
      "rounds": [
        {
          "roundIndex": 0,
          "noOfMatches": 2,
          "matches": [
            {
              "participantA": {"name": "Cloud 9_2"},
              "participantB": {"name": "DRX2"},
              "winner": {"name": "DRX2"}
            },
            {
              "participantA": {"name": "Zeta2"},
              "participantB": {"name": "Sentinels2"},
              "winner": {"name": "Zeta2"}
            }
          ]
        },
        {
          "roundIndex": 1,
          "noOfMatches": 1,
          "matches": [
            {
              "participantA": {"name": "DRX2"},
              "participantB": {"name": "Zeta2"},
              "winner": {"name": "Zeta2"}
            }
          ]
        }
      ],
      "winner": {"name": "Zeta2"}
    }
  ],
  "postBracketRounds": {
    "rounds": [
      {
        "roundIndex": 0,
        "noOfMatches": 1,
        "matches": [
          {
            "participantA": {"name": "Zeta2"},
            "participantB": {"name": "Cloud 9"},
            "winner": {"name": "Cloud 9"}
          }
        ]
      }
    ],
    "winner": {"name": "Cloud 9"}
  }
};

class MyApp extends StatefulWidget {
  late N_BracketTournament tournament;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    List<String> playersList1 = participants1.map((e) => e.name ?? '').toList();

    List<String> teamsList1 = teams.map((e) => e.name ?? '').toList();
    List<String> teamsList2 = teams2.map((e) => e.name ?? '').toList();
    widget.tournament = N_BracketTournament(bracketCount: 2);
    widget.tournament
        .generateNewBracket(participantsList: teamsList1, bracketIndex: 0);
    widget.tournament
        .generateNewBracket(participantsList: teamsList2, bracketIndex: 1);
    print(widget.tournament.brackets);
    print("-----------------------");

    // print(json.decode(tempTournamentString));
    widget.tournament.brackets = nBracket_template_8_participants["brackets"];
    widget.tournament.postBracketRounds =
        nBracket_template_8_participants["postBracketRounds"];
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
