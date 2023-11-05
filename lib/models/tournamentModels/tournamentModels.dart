import 'dart:math';

import 'package:bottle_ver2/models/tournamentModels/round.dart';
import 'team.dart';
import 'match.dart';

class Tournament {
  List<Participant>? participants = [];
  List<Round> rounds = [];
  Participant? winner;
  String participantType;

  Tournament(
      {this.participants, this.winner, this.participantType = "participant"});

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

  generateRounds({required List<Participant> participants}) {}

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
      'winner': winner?.toMap(),
      'participantType': participantType
    };
  }

  static Tournament fromMap(Map<String, dynamic> map) {
    return Tournament(
        participants: (map['participants'] as List<dynamic>)
            .map((participantMap) => Participant.fromMap(participantMap))
            .toList(),
        winner: Participant.fromMap(map['winner']),
        participantType: map['participantType'] ?? "participant");
  }
}

class SingleEliminationTournament extends Tournament {
  SingleEliminationTournament(
      {List<Participant>? participants, String participantType = "participant"})
      : super(participants: participants, participantType: participantType);

  @override
  List<Round> generateRounds({required List<Participant> participants}) {
    double totalParticiapnts = double.parse(participants!.length.toString());
    int noOfRounds = log(totalParticiapnts) ~/ log(2);
    for (int i = noOfRounds; i > 0; i--) {
      rounds.add(Round(
        roundIndex: i - 1,
        noOfMatches: (pow(2, i - 1)).toInt(),
      ));
    }
    rounds.forEach((element) {
      print(
          "Matches in round: ${pow(2, element.roundIndex)},,${element.roundIndex}");
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

  @override
  void simulateTournament() {
    // Simulate single-elimination tournament
    // ...
  }
}

class DoubleBracketTournament extends Tournament {
  int bracketCount;
  List<Map<String, dynamic>> brackets = [];

  // Implement Double Bracket specific methods and properties
  DoubleBracketTournament(
      {required this.bracketCount, String participantType = "participant"})
      : super(participantType: participantType);

  @override
  List<Round> generateRounds({required List<Participant> participants}) {
    double totalParticipants = double.parse(participants!.length.toString());
    int noOfRounds = log(totalParticipants) ~/ log(2);
    List<Round> rounds = [];
    for (int i = noOfRounds; i > 0; i--) {
      Round newRound = Round(
        roundIndex: i - 1,
        noOfMatches: (pow(2, i - 1)).toInt(),
      );
      if (pow(2, i) == participants.length) {
        newRound.matches = newRound.pairParticipantsForMatches(participants);
      }
      rounds.add(newRound);
    }
    rounds.forEach((element) {
      print(
          "Matches in round: ${pow(2, element.roundIndex)},,${element.roundIndex}");
    });
    return rounds;
  }

  List<Map<String, dynamic>> generateNewBracket(
      {required List<Team> teamsList, required int bracketIndex}) {
    List<Round> rounds = generateRounds(participants: teamsList);

    brackets.add({
      "bracketIndex": bracketIndex,
      "rounds": rounds,
      "winner": null,
      "participants": teamsList
    });

    return brackets;
  }

  generatePostBracketRounds({required Map<String, dynamic> brackets}) {
    List<Team> bracketWinners = [];
    brackets["brackets"].forEach((bracket) {
      if (bracket["winner"] != null) bracketWinners.add(bracket["winner"]);
    });

    List<Round> postBracketRounds =
        generateRounds(participants: bracketWinners);
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
