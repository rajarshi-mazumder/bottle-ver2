import 'package:flutter/cupertino.dart';

class nBracketTournamentDataProvider with ChangeNotifier {
  Map<String, dynamic> tournamentData = {
    "brackets": [],
    "postBracketRounds": {}
  };
  int bracketCount = 1;

  @override
  notifyListeners() {
    super.notifyListeners();
    print(tournamentData["brackets"].length);
  }
}

Map<String, dynamic> nBracket_template_8_participants = {
  "brackets": [
    {
      "bracketIndex": 0,
      "rounds": [
        {
          "isLastRound": false,
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
          "isLastRound": false,
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
          "isLastRound": true,
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
          "isLastRound": false,
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
          "isLastRound": true,
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
        "isLastRound": true,
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
