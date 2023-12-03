import 'package:flutter/cupertino.dart';

class DoubleElimTournamentDataProvider with ChangeNotifier {
  late Map<String, dynamic> tournamentData;

  DoubleElimTournamentDataProvider({required this.tournamentData});

  @override
  notifyListeners() {
    super.notifyListeners();
  }
}

Map<String, dynamic> template_8_participants = {
  "noOfParticipants": 8,
  "winnersBracketMap": {
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
  },
  "losersBracketMap": {
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
  }
};

Map<String, dynamic> template_16_participants = {
  "noOfParticipants": 16,
  "winnersBracketMap": {
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
  },
  "losersBracketMap": {
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
  }
};
