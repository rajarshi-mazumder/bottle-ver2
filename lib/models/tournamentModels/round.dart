import 'dart:math';

import 'package:bottle_ver2/models/tournamentModels/team.dart';

import 'match.dart';

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

  Map<String, dynamic> tournamentSpecificToMap() {
    return {
      'roundIndex': roundIndex,
      'matches':
          matches?.map((match) => match?.tournamentSpecificToMap()).toList(),
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

  List<Match> pairTeamsForMatches(List<Team> teams) {
    if (teams.length % 2 != 0) {
      throw Exception("The number of teams must be even for pairing.");
    }

    // Shuffle the list of teams to randomize pairing
    final random = Random();
    final shuffledTeams = List<Team>.from(teams)..shuffle(random);

    final matches = <Match>[];
    for (int i = 0; i < shuffledTeams.length; i += 2) {
      final teamA = shuffledTeams[i];
      final teamB = shuffledTeams[i + 1];
      matches.add(Match(teamA: teamA, teamB: teamB));
    }

    return matches;
  }
}
