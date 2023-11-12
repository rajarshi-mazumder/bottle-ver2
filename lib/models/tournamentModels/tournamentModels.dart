import 'dart:math';

import 'package:bottle_ver2/models/tournamentModels/round.dart';
import 'team.dart';

class Tournament {
  List<Mappable>? participants = [];
  List rounds = [];
  Mappable? winner;
  String participantType;

  Tournament({this.participants, this.winner, this.participantType = "player"});

  // Factory method to create tournaments
  factory Tournament.createTournament(
      {required String type,
      int bracketCount = 0,
      required String participantType}) {
    if (type == 'SingleElimination') {
      return SingleEliminationTournament(participantType: participantType);
    } else if (type == 'DoubleBracket') {
      return DoubleBracketTournament(
          bracketCount: bracketCount, participantType: participantType);
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

  generateRounds({required List<Mappable> participants}) {}

  Map<String, dynamic> toMap() {
    return {
      'participants':
          participants?.map((participant) => participant?.toMap()).toList(),
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

// static Tournament fromMap(Map<String, dynamic> map) {
//   return Tournament(
//       participants: (map['participants'] as List<dynamic>)
//           .map((participantMap) => Mappable.fromMap(participantMap))
//           .toList(),
//       winner: Participant.fromMap(map['winner']),
//       participantType: map['participantType'] ?? "participant");
// }
}

class SingleEliminationTournament extends Tournament {
  SingleEliminationTournament(
      {List<Mappable>? participants, String participantType = "player"})
      : super(participants: participants, participantType: participantType);

  @override
  List generateRounds({required List<Mappable> participants}) {
    double totalParticiapnts = double.parse(participants!.length.toString());
    int noOfRounds = log(totalParticiapnts) ~/ log(2);
    for (int i = noOfRounds; i > 0; i--) {
      rounds.add({"roundIndex": i - 1, "noOfMatches": (pow(2, i - 1)).toInt()});
    }
    rounds.forEach((element) {
      print(
          "Matches in round: ${pow(2, element["roundIndex"])},,${element["roundIndex"]}");
    });
    return rounds;
  }

  @override
  Map<String, dynamic> tournamentSpecificToMap() {
    Map<String, dynamic> roundsMap = super.tournamentSpecificToMap();

    return {
      "brackets": [
        {"bracketIndex": 1, "rounds": roundsMap, "participants": participants}
      ]
    };
  }
}

class DoubleBracketTournament extends Tournament {
  int bracketCount;
  List brackets = [];

  // Implement Double Bracket specific methods and properties
  DoubleBracketTournament(
      {required this.bracketCount, String participantType = "player"})
      : super(participantType: participantType);

  @override
  List generateRounds({required List<Mappable> participants}) {
    double totalParticipants = double.parse(participants!.length.toString());
    int noOfRounds = log(totalParticipants) ~/ log(2);
    List rounds = [];
    for (int i = noOfRounds; i > 0; i--) {
      Map<String, dynamic> newRound = {
        "roundIndex": i - 1,
        "noOfMatches": (pow(2, i - 1)).toInt(),
      };
      if (pow(2, i) == participants.length) {
        newRound["matches"] = Round.pairParticipantsForMatches(participants);
      }
      rounds.add(newRound);
    }

    return rounds;
  }

  List generateNewBracket(
      {required List<Mappable> participantsList, required int bracketIndex}) {
    List rounds = generateRounds(participants: participantsList);
    List<String> participants =
        participantsList.map((e) => e.name ?? '').toList();
    brackets.add({
      "bracketIndex": bracketIndex,
      "rounds": rounds,
      "winner": null,
      "participants": participants
    });

    return brackets;
  }

  generatePostBracketRounds({required Map<String, dynamic> brackets}) {
    List<Mappable> bracketWinners = [];
    brackets["brackets"].forEach((bracket) {
      if (bracket["winner"] != null) bracketWinners.add(bracket["winner"]);
    });

    List postBracketRounds = generateRounds(participants: bracketWinners);
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
