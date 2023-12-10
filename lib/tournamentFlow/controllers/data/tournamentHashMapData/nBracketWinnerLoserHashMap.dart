import 'dart:math';

Map<String, dynamic> generateTournamentStructure(
    int numberOfBrackets, List<int> participantsPerBracket) {
  Map<String, dynamic> tournamentStructure = {
    "brackets": [],
    "postBracketRounds": {
      "rounds": [],
      "winner": {"name": ""}
    }
  };

  for (int i = 0; i < numberOfBrackets; i++) {
    Map<String, dynamic> bracket = {
      "bracketIndex": i,
      "rounds": [],
      "winner": {"name": ""}
    };

    int currentBracketParticipants = participantsPerBracket[i];
    List<dynamic> participants =
        List.generate(currentBracketParticipants, (index) => {"name": ""});

    while (participants.length > 1) {
      int matchesInRound = participants.length ~/ 2;
      List<dynamic> matches = List.generate(matchesInRound, (index) {
        return {
          "participantA": {"name": participants[index * 2]["name"]},
          "participantB": {"name": participants[index * 2 + 1]["name"]},
          "winner": {"name": ""},
        };
      });

      Map<String, dynamic> round = {
        "isLastRound": participants.length == 2,
        "roundIndex": bracket["rounds"].length,
        "noOfMatches": matchesInRound,
        "matches": matches,
      };

      bracket["rounds"].add(round);

      participants = List.generate(participants.length ~/ 2, (index) {
        return {
          "name": bracket["rounds"].last["matches"][index]["winner"]["name"]
        };
      });
    }

    // Add the winner
    bracket["winner"]["name"] = participants[0]["name"];
    tournamentStructure["brackets"].add(bracket);
  }

  // Generate postBracketRounds
  int postBracketRoundIndex = 0;
  List<Map<String, dynamic>> postBracketMatches = [];
  for (int i = 0; i < numberOfBrackets; i += 2) {
    Map<String, dynamic> winnerA = tournamentStructure["brackets"][i]["winner"];
    Map<String, dynamic> winnerB =
        tournamentStructure["brackets"][i + 1]["winner"];

    postBracketMatches.add({
      "participantA": {"name": winnerA["name"]},
      "participantB": {"name": winnerB["name"]},
      "winner": {"name": ""},
    });
  }

  while (postBracketMatches.length > 1) {
    postBracketMatches = List.generate(postBracketMatches.length ~/ 2, (index) {
      return {
        "participantA": {
          "name": postBracketMatches[index * 2]["winner"]["name"]
        },
        "participantB": {
          "name": postBracketMatches[index * 2 + 1]["winner"]["name"]
        },
        "winner": {"name": ""},
      };
    });

    Map<String, dynamic> postBracketRound = {
      "isLastRound": postBracketMatches.length == 1,
      "roundIndex": postBracketRoundIndex,
      "noOfMatches": postBracketMatches.length,
      "matches": List.from(postBracketMatches),
    };

    tournamentStructure["postBracketRounds"]["rounds"].add(postBracketRound);
    postBracketRoundIndex++;
  }

  // Add the final postBracketRound
  Map<String, dynamic> finalPostBracketRound = {
    "isLastRound": true,
    "roundIndex": postBracketRoundIndex,
    "noOfMatches": 1,
    "matches": [
      {
        "participantA": {"name": ""},
        "participantB": {"name": ""},
        "winner": {"name": ""},
      }
    ],
  };

  tournamentStructure["postBracketRounds"]["rounds"].add(finalPostBracketRound);

  return tournamentStructure;
}

Map<String, dynamic> populateBrackets(
    Map<String, dynamic> tournamentJson, List<String> participants) {
  List<dynamic> brackets = tournamentJson['brackets'];

  for (int i = 0; i < brackets.length; i++) {
    List<dynamic> rounds = brackets[i]['rounds'];

    for (int j = 0; j < rounds.length; j++) {
      List<dynamic> matches = rounds[j]['matches'];

      for (int k = 0; k < matches.length; k++) {
        if (participants.isEmpty) {
          return tournamentJson; // Stop and return the current state of the JSON if there are no more participants
        }

        String participantA = participants.removeAt(0);
        String participantB = participants.removeAt(0);

        matches[k]['participantA']['name'] = participantA;
        matches[k]['participantB']['name'] = participantB;
      }
    }
  }

  return tournamentJson; // Return the updated JSON
}
