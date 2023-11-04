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
}
