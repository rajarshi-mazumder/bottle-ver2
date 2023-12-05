import 'package:hive/hive.dart';

import '../../models/doubleElimTournament.dart';

class TournamentDatabase {
  static String boxName = "tournamentSavedData";

  // Add a new tournament
  Future<void> saveTournament(
      DoubleElimTournament_Hive doubleElimTournament_Hive) async {
    var box = await Hive.openBox<DoubleElimTournament_Hive>(boxName);
    print(box.keys);
    print(box.values);
    var existingTournamentIndex = box.values.toList().indexWhere(
        (tournament) => tournament.id == doubleElimTournament_Hive.id);

    if (existingTournamentIndex != -1) {
      DoubleElimTournament_Hive temp = DoubleElimTournament_Hive(
        name: doubleElimTournament_Hive.name,
        tournamentData: doubleElimTournament_Hive.tournamentData,
        id: doubleElimTournament_Hive.id,
        participants: doubleElimTournament_Hive.participants,
        participantType: doubleElimTournament_Hive.participantType,
      );

      await box.putAt(existingTournamentIndex, temp);
    } else {
      // Add as a new object
      await box.add(doubleElimTournament_Hive);
    }

    await box.close();
  }

  // Get all tournaments
  Future<List<DoubleElimTournament_Hive>> getAllTournaments() async {
    var box = await Hive.openBox<DoubleElimTournament_Hive>(boxName);
    List<DoubleElimTournament_Hive> tournaments = box.values.toList();
    await box.close();
    return tournaments;
  }

  // Update a tournament
  Future<void> updateTournament(
      int index, DoubleElimTournament_Hive tournament) async {
    var box = await Hive.openBox<DoubleElimTournament_Hive>(boxName);
    await box.putAt(index, tournament);
    await box.close();
  }

  Future<DoubleElimTournament_Hive> getTournamentById({required int id}) async {
    var box = await Hive.openBox<DoubleElimTournament_Hive>(boxName);
    try {
      for (DoubleElimTournament_Hive tournament in box.values) {
        if (tournament.id == id) {
          return tournament;
        }
      }
      throw Exception("Tournament of ID: ${id} not found");
    } finally {
      await box.close();
    }
  }

  // Delete a tournament
  Future<void> deleteTournament(int index) async {
    var box = await Hive.openBox<DoubleElimTournament_Hive>(boxName);
    await box.deleteAt(index);
    await box.close();
  }
}
