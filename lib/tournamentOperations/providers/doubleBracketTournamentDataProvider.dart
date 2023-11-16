import 'package:flutter/cupertino.dart';

class DoubleElimTournamentDataProvider with ChangeNotifier {
  Map<String, dynamic> tournamentData = {
    "winnersBracketMap": winnersBracketMap,
    "losersBracketMap": losersBracketMap,
  };
  int bracketCount = 1;

  @override
  notifyListeners() {
    super.notifyListeners();
  }
}

Map<String, dynamic> winnersBracketMap = {
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
};

Map<String, dynamic> losersBracketMap = {
  "rounds": [
    {
      "roundIndex": 0,
      "noOfMatches": 4,
      "matches": [
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
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
      "noOfMatches": 4,
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
        },
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
      "noOfMatches": 2,
      "matches": [
        {
          "participantA": {"name": "Cloud 9"},
          "participantB": {"name": "NAVI"},
          "winner": {"name": "Cloud 9"}
        },
        {
          "participantA": {"name": "Cloud 9"},
          "participantB": {"name": "NAVI"},
          "winner": {"name": "Cloud 9"}
        }
      ]
    },
    {
      "roundIndex": 3,
      "noOfMatches": 2,
      "matches": [
        {
          "participantA": {"name": "Cloud 9"},
          "participantB": {"name": "NAVI"},
          "winner": {"name": "Cloud 9"}
        },
        {
          "participantA": {"name": "Cloud 9"},
          "participantB": {"name": "NAVI"},
          "winner": {"name": "Cloud 9"}
        }
      ]
    },
  ],
  "winner": {"name": "Cloud 9"}
};
