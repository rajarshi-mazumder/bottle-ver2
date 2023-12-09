import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class N_BracketTournament extends HiveObject {
  int bracketCount;

  @HiveField(1)
  Map<String, dynamic> tournamentData;

  // Implement Double Bracket specific methods and properties
  N_BracketTournament(
      {required this.bracketCount,
      String participantType = "player",
      required this.tournamentData});

  List generateRounds({required List<String> participants}) {
    double totalParticipants = double.parse(participants!.length.toString());
    int noOfRounds = log(totalParticipants) ~/ log(2);
    List rounds = [];
    for (int i = noOfRounds; i > 0; i--) {
      int noOfMatches = (pow(2, i - 1)).toInt();
      Map<String, dynamic> newRound = {
        "roundIndex": i - 1,
        "noOfMatches": noOfMatches,
        "matches": List.generate(
            noOfMatches,
            (index) =>
                {"participantA": {}, "participantB": {}, "winner": {}}).toList()
      };

      rounds.add(newRound);
    }

    return rounds;
  }

  List generateNewBracket(
      {required List<String> participantsList, required int bracketIndex}) {
    List rounds = generateRounds(participants: participantsList);

    tournamentData["brackets"].add({
      "bracketIndex": bracketIndex,
      "rounds": rounds,
      "winner": null,
      "participants": participantsList
    });

    return tournamentData["brackets"];
  }

  generatePostBracketRounds({required Map<String, dynamic> brackets}) {
    List<String> bracketWinners = [];
    brackets["brackets"].forEach((bracket) {
      print(bracket["winner"]);

      if (bracket["winner"] == null || bracket["winner"]["name"] == '') {
        print("NOT ALL BRACKETS HAVE WINNERS YET!");
        return;
      } else {
        bracketWinners.add(bracket["winner"]["name"]);
      }
    });
    if (bracketWinners.isNotEmpty) {
      List postBracketRounds = generateRounds(participants: bracketWinners);
      tournamentData["postBracketRounds"] = {"rounds": postBracketRounds};
    }
  }
}
