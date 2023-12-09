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

Map<String, dynamic> n_bracket_template_8_participants = {
  "noOfParticipants": 8,
  "winnersBracketMap": {
    "noOfRounds": 3,
    "rounds": [
      {
        "roundIndex": 0,
        "noOfMatches": 4,
        "matches": [
          {
            "participantA": {"name": "Cloud 10"},
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
          },
        ]
      },
      {
        "roundIndex": 2,
        "noOfMatches": 1,
        "matches": [
          {
            "participantA": {"name": ""},
            "participantB": {"name": ""},
            "winner": {"name": ""}
          }
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
          }
        ]
      },
    ],
    "winner": {"name": ""}
  },
  "postBracketMap": {
    "noOfRounds": 1,
    "rounds": [
      {
        "roundIndex": 0,
        "noOfMatches": 1,
        "matches": [
          {
            "participantA": {"name": ""},
            "participantB": {"name": ""},
            "winner": {"name": ""}
          }
        ]
      }
    ],
    "winner": {"name": ""}
  },
  "winner": {"name": ""}
};
