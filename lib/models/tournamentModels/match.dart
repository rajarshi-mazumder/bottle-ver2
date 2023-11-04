import 'package:bottle_ver2/models/tournamentModels/team.dart';

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

  Map<String, dynamic> tournamentSpecificToMap() {
    return {
      'teamA': teamA?.tournamnetSpecificToMap(),
      'teamB': teamB?.tournamnetSpecificToMap(),
      'winner': winner?.tournamnetSpecificToMap(),
    };
  }

  static Match fromMap(Map<String, dynamic> map) {
    return Match(
      teamA: Team.fromMap(map['teamA']) ?? Team(),
      teamB: Team.fromMap(map['teamB']) ?? Team(),
      winner: Team.fromMap(map['winner']) ?? Team(),
    );
  }
}
