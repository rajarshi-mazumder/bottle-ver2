import 'package:bottle_ver2/models/tournamentModels/team.dart';

class TournamentMatch {
  Mappable? participantA;
  Mappable? participantB;
  Mappable? winner;

  TournamentMatch({this.participantA, this.participantB, this.winner});

  Map<String, dynamic> toMap() {
    return {
      'participantA': participantA?.toMap(),
      'participantB': participantB?.toMap(),
      'winner': winner?.toMap(),
    };
  }

  Map<String, dynamic> tournamentSpecificToMap() {
    return {
      'participantA': participantA?.tournamnetSpecificToMap(),
      'participantB': participantB?.tournamnetSpecificToMap(),
      'winner': winner?.tournamnetSpecificToMap(),
    };
  }

  static TournamentMatch fromMap(Map<String, dynamic> map) {
    return TournamentMatch(
      participantA: Team.fromMap(map['participantA']) ?? null,
      participantB: Team.fromMap(map['participantB']) ?? null,
      winner: Team.fromMap(map['winner']) ?? null,
    );
  }
}
