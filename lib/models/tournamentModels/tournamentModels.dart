import 'dart:convert';
import 'dart:math';

import 'package:bottle_ver2/models/tournamentModels/round.dart';
import 'package:bottle_ver2/tournamentOperations/createTournament.dart';
// import '../../tournamentOperations/tournamentScreenWidgets/doubleElimTournamentUtilities/winnerLoserRoundHashMap.dart';
import 'team.dart';

class Tournament {
  List<String>? participants = [];
  List rounds = [];
  Mappable? winner;
  String participantType;

  Tournament({this.participants, this.winner, this.participantType = "player"});

  // Factory method to create tournaments
  factory Tournament.createTournament(
      {required String type,
      int bracketCount = 0,
      required String participantType,
      List<String>? participants,
      int participantsLength = 0,
      Map<String, dynamic>? winnerLoserHashMap}) {
    if (type == 'n_bracket') {
      return N_BracketTournament(
          bracketCount: bracketCount, participantType: participantType);
    } else if (type == "double_elimination") {
      return DoubleElimTournament(
          noOfParticipants: participantsLength!,
          winnerLoserHashMap: winnerLoserHashMap!,
          participants: participants);
    }
    // else if (type == 'RoundRobin') {
    //   return RoundRobinTournament(teams);
    // } else if (type == 'DoubleRoundRobin') {
    //   return DoubleRoundRobinTournament(teams, bracketCount);
    // } else if (type == 'BattleRoyale') {
    //   return BattleRoyaleTournament(teams);
    // }
    else {
      throw Exception('Invalid tournament type');
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'participants': participants,
      'rounds': rounds.map((round) => round.toMap()).toList(),
      'winner': winner?.toMap(),
      'participantType': participantType
    };
  }

  Map<String, dynamic> tournamentSpecificToMap() {
    return {
      // 'teams': teams?.map((team) => team?.tournamnetSpecificToMap()).toList(),
      'rounds': rounds.map((round) => round.tournamentSpecificToMap()).toList(),
      'winner': winner?.tournamnetSpecificToMap(),
      'participantType': participantType
    };
  }
}

class N_BracketTournament extends Tournament {
  int bracketCount;
  List brackets = [];
  Map postBracketRounds = {};

  // Implement Double Bracket specific methods and properties
  N_BracketTournament(
      {required this.bracketCount, String participantType = "player"})
      : super(participantType: participantType);

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
      if (pow(2, i) == participants.length) {
        newRound["matches"] = Round.pairParticipantsForMatches(participants);
      }
      rounds.add(newRound);
    }

    return rounds;
  }

  List generateNewBracket(
      {required List<String> participantsList, required int bracketIndex}) {
    List rounds = generateRounds(participants: participantsList);

    brackets.add({
      "bracketIndex": bracketIndex,
      "rounds": rounds,
      "winner": null,
      "participants": participantsList
    });

    return brackets;
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
      this.postBracketRounds = {"rounds": postBracketRounds};
      print(this.postBracketRounds);
    }
  }

  @override
  Map<String, dynamic> tournamentSpecificToMap() {
    List<Map<String, dynamic>> bracketsMapList = [];
    brackets.forEach((bracket) {
      bracketsMapList.add({
        "bracketIndex": bracket['bracketIndex'],
        "rounds": bracket["rounds"]
            .map((Round round) => round.tournamentSpecificToMap())
      });
    });

    return {"brackets": bracketsMapList};
  }

  @override
  void simulateTournament() {
    // Simulate double bracket tournament
    // ...
  }
}

class DoubleElimTournament extends Tournament {
  int winnerRounds = 0;
  int loserRounds = 0;

  Map<String, dynamic> winnerLoserHashMap;

  DoubleElimTournament(
      {required int noOfParticipants,
      required this.winnerLoserHashMap,
      List<String>? participants}) {
    winnerRounds = (noOfParticipants / 2).floor().bitLength;
    // int loserRounds = winnerRounds * 2 - 1;
    loserRounds = winnerLoserHashMap["loserBracketRoundsCount"];
    if (participants != null) {
      List matches = generateMatchPairs(participants: participants);
      List doubleElimTournamentMap =
          json.decode(doubleElimEmptyTournamentString)["brackets"];
      doubleElimTournamentMap[0]["rounds"][0]["matches"] = matches;

      print("MAPPPP ${doubleElimTournamentMap[0]}");
    }
  }

  List generateMatchPairs({required List<String> participants}) {
    List matches = Round.pairParticipantsForMatches(participants);
    print("DOUBLE ELIM MATCHES - tournamentModels.dart line 169 ${matches}");
    return matches;
  }
}
