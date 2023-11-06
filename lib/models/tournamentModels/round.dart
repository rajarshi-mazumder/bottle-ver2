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

  List<Match> pairParticipantsForMatches(List<Participant> participants) {
    if (participants.length % 2 != 0) {
      throw Exception("The number of participants must be even for pairing.");
    }

    // Shuffle the list of participants to randomize pairing
    final random = Random();
    final shuffledParticipants = List<Participant>.from(participants)
      ..shuffle(random);

    final matches = <Match>[];
    for (int i = 0; i < shuffledParticipants.length; i += 2) {
      final participantA = shuffledParticipants[i];
      final participantB = shuffledParticipants[i + 1];
      matches
          .add(Match(participantA: participantA, participantB: participantB));
    }

    return matches;
  }
}
