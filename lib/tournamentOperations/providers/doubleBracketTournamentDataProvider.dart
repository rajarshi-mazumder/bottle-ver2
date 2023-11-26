import 'package:flutter/cupertino.dart';

class DoubleElimTournamentDataProvider with ChangeNotifier {
  Map<String, dynamic> tournamentData = {
    "winnersBracketMap": winnersBracketMap,
    "losersBracketMap": losersBracketMap,
  };

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
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        },
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        }
      ]
    },
    {
      "roundIndex": 2,
      "noOfMatches": 1,
      "matches": [
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": "Cloud "}
        }
      ]
    }
  ],
  "winner": {"name": ""}
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
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        },
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        },
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        }
      ]
    },
    {
      "roundIndex": 1,
      "noOfMatches": 4,
      "matches": [
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        },
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        },
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        },
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        }
      ]
    },
    {
      "roundIndex": 2,
      "noOfMatches": 2,
      "matches": [
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        },
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        }
      ]
    },
    {
      "roundIndex": 3,
      "noOfMatches": 2,
      "matches": [
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        },
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        }
      ]
    },
  ],
  "winner": {"name": ""}
};
