import 'package:hive/hive.dart';

part 'doubleElimTournament.g.dart'; // Hive generates this file

@HiveType(typeId: 0)
class DoubleElimTournament_Hive extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  Map<String, dynamic> tournamentData; // MatchID to Winning Team

  @HiveField(2)
  int id; // MatchID to Winning Team

  @HiveField(3)
  List<String>? participants;

  @HiveField(4)
  String participantType;

  DoubleElimTournament_Hive({this.name,

    required this.tournamentData,
    required this.id,
    required this.participantType,
    this.participants});
}
