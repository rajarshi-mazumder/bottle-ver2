import 'dart:math';

import 'package:bottle_ver2/models/tournamentModels/round.dart';
import 'team.dart';
import 'match.dart';

class Tournament {
  List<Team>? teams = [];
  List<Round> rounds = [];
  Team? winner;

  Tournament({this.teams, this.winner});

  // Factory method to create tournaments
  factory Tournament.createTournament(
      {required String type, int bracketCount = 0}) {
    if (type == 'SingleElimination') {
      return SingleEliminationTournament();
    } else if (type == 'DoubleBracket') {
      return DoubleBracketTournament(bracketCount);
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

  generateRounds({required List<Team> teams}) {}

  Map<String, dynamic> toMap() {
    return {
      'teams': teams?.map((team) => team?.toMap()).toList(),
      'rounds': rounds.map((round) => round.toMap()).toList(),
      'winner': winner?.toMap(),
    };
  }

  Map<String, dynamic> tournamentSpecificToMap() {
    return {
      // 'teams': teams?.map((team) => team?.tournamnetSpecificToMap()).toList(),
      'rounds': rounds.map((round) => round.tournamentSpecificToMap()).toList(),
      'winner': winner?.toMap(),
    };
  }

  static Tournament fromMap(Map<String, dynamic> map) {
    return Tournament(
      teams: (map['teams'] as List<dynamic>)
          .map((teamMap) => Team.fromMap(teamMap))
          .toList(),
      winner: Team.fromMap(map['winner']),
    );
  }
}

class SingleEliminationTournament extends Tournament {
  SingleEliminationTournament() : super();

  @override
  List<Round> generateRounds({required List<Team> teams}) {
    double totalTeams =
        double.parse(teams!.length.toString()); // totalTeams= 16
    int noOfRounds = log(totalTeams) ~/ log(2);
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
        {"bracketIndex": 1, "rounds": roundsMap}
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
  DoubleBracketTournament(this.bracketCount) : super();

  @override
  List<Round> generateRounds({required List<Team> teams}) {
    double totalTeams =
        double.parse(teams!.length.toString()); // totalTeams= 16
    int noOfRounds = log(totalTeams) ~/ log(2);
    List<Round> rounds = [];
    for (int i = noOfRounds; i > 0; i--) {
      Round newRound = Round(
        roundIndex: i - 1,
        noOfMatches: (pow(2, i - 1)).toInt(),
      );
      if (pow(2, i) == teams.length) {
        newRound.matches = newRound.pairTeamsForMatches(teams);
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
      {required List<Team> teams, required int bracketIndex}) {
    List<Round> rounds = generateRounds(teams: teams);

    brackets
        .add({"bracketIndex": bracketIndex, "rounds": rounds, "winner": null});

    return brackets;
  }

  generatePostBracketRounds({required Map<String, dynamic> brackets}) {
    List<Team> bracketWinners = [];
    brackets["brackets"].forEach((bracket) {
      if (bracket["winner"] != null) bracketWinners.add(bracket["winner"]);
    });

    List<Round> postBracketRounds = generateRounds(teams: bracketWinners);
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
