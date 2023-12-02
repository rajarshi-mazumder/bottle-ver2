import 'package:flutter/cupertino.dart';

class DoubleElimTournamentDataProvider with ChangeNotifier {
  late Map<String, dynamic> tournamentData;

  Map<String, dynamic> winnersBracketMap;
  Map<String, dynamic> losersBracketMap;

  DoubleElimTournamentDataProvider(
      {required this.winnersBracketMap, required this.losersBracketMap}) {
    tournamentData = {
      "winnersBracketMap": winnersBracketMap,
      "losersBracketMap": losersBracketMap,
    };
  }

  @override
  notifyListeners() {
    super.notifyListeners();
  }
}

Map<String, dynamic> winnersBracketMap_8_participants = {
  "noOfRounds": 3,
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

Map<String, dynamic> losersBracketMap_8_participants = {
  "noOfRounds": 4,
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

Map<String, dynamic> winnersBracketMap_16_participants = {
  "noOfRounds": 4,
  "rounds": [
    {
      "roundIndex": 0,
      "noOfMatches": 8,
      "matches": [
        {
          "participantA": {"name": "Cloud 9"},
          "participantB": {"name": "DRX"},
          "winner": {"name": "DRX"}
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
        },
        {
          "participantA": {"name": "Bleed"},
          "participantB": {"name": "T1"},
          "winner": {"name": "Bleed"}
        },
        {
          "participantA": {"name": "GE"},
          "participantB": {"name": "Kru"},
          "winner": {"name": "GE"}
        },
        {
          "participantA": {"name": "EDG"},
          "participantB": {"name": "M80"},
          "winner": {"name": "EDG"}
        },
        {
          "participantA": {"name": "100T"},
          "participantB": {"name": "g2"},
          "winner": {"name": "G2"}
        },
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
        },
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
        },
      ]
    },
    {
      "roundIndex": 3,
      "noOfMatches": 1,
      "matches": [
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        },
      ]
    },
  ],
  "winner": {"name": ""}
};

Map<String, dynamic> losersBracketMap_16_participants = {
  "noOfRounds": 5,
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
    {
      "roundIndex": 4,
      "noOfMatches": 1,
      "matches": [
        {
          "participantA": {"name": ""},
          "participantB": {"name": ""},
          "winner": {"name": ""}
        },
      ]
    },
  ],
  "winner": {"name": ""}
};
