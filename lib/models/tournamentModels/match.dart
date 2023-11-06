import 'package:bottle_ver2/models/tournamentModels/team.dart';

class Match {
  Participant? participantA;
  Participant? participantB;
  Participant? winner;

  Match({this.participantA, this.participantB, this.winner});

  Map<String, dynamic> toMap() {
    return {
      'teamA': participantA?.toMap(),
      'teamB': participantB?.toMap(),
      'winner': winner?.toMap(),
    };
  }

  Map<String, dynamic> tournamentSpecificToMap() {
    return {
      'teamA': participantA?.tournamnetSpecificToMap(),
      'teamB': participantB?.tournamnetSpecificToMap(),
      'winner': winner?.tournamnetSpecificToMap(),
    };
  }

  static Match fromMap(Map<String, dynamic> map) {
    return Match(
      participantA: Team.fromMap(map['teamA']) ?? Participant(),
      participantB: Team.fromMap(map['teamB']) ?? Participant(),
      winner: Team.fromMap(map['winner']) ?? Participant(),
    );
  }
}
