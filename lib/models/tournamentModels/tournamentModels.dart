import 'dart:math';

import 'package:bottle_ver2/models/tournamentModels/team.dart';

class Tournament {
  List<Team>? teams = [];
  List<Round> rounds = [];
  Team? winner;

  Tournament({this.teams, this.winner});

  void generateRounds() {
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
  }

  Map<String, dynamic> toMap() {
    return {
      // 'teams': teams?.map((team) => team?.toMap()).toList(),
      'rounds': rounds.map((round) => round.toMap()).toList(),
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

class Round {
  int roundIndex = 0;
  List<Match>? matches;
  int noOfMatches;

  Round({required this.roundIndex, this.matches, required this.noOfMatches});

  Map<String, dynamic> toMap() {
    return {
      'roundIndex': roundIndex,
      'matches': matches?.map((match) => match?.toMap()).toList(),
      'noOfMatches': noOfMatches,
    };
  }

  static Round fromMap(Map<String, dynamic> map) {
    return Round(
      roundIndex: map['roundIndex'],
      matches: (map['matches'] as List<dynamic>)
          .map((matchMap) => Match.fromMap(matchMap))
          .toList(),
      noOfMatches: map['noOfMatches'],
    );
  }
}

class Match {
  Team? teamA;
  Team? teamB;
  Team? winner;

  Match({this.teamA, this.teamB, this.winner});

  Map<String, dynamic> toMap() {
    return {
      'teamA': teamA?.toMap(),
      'teamB': teamB?.toMap(),
      'winner': winner?.toMap(),
    };
  }

  static Match fromMap(Map<String, dynamic> map) {
    return Match(
      teamA: Team.fromMap(map['teamA']),
      teamB: Team.fromMap(map['teamB']),
      winner: Team.fromMap(map['winner']),
    );
  }
}

class Player {
  String name;
  String? nationality;

  String? twitchLink;
  String? twitterLink;
  String? mainAgent;

  Player(
      {required this.name,
      this.nationality,
      this.twitchLink,
      this.twitterLink,
      this.mainAgent});
}
