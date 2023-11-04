import 'dart:math';

import 'package:bottle_ver2/models/tournamentModels/round.dart';
import 'team.dart';
import 'match.dart';

class Tournament {
  List<Team>? teams = [];
  List<Round> rounds = [];
  Team? winner;

  Tournament({this.teams, this.winner});

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

class BracketTournament extends Tournament {
  BracketTournament({this.noOfBrackets = 2}) : super();

  int noOfBrackets;
  List<Map<String, dynamic>> brackets = [];

  addNewBracket(List<Team> teams, int bracketIndex) {
    List<Round> roundsList = generateRounds(teams: teams);
    brackets.add({
      "bracketIndex": bracketIndex,
      "teams": teams,
      "rounds": roundsList,
      "winner": null
    });
  }
}
