import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class N_BracketTournament extends HiveObject {
  int bracketCount;

  @HiveField(1)
  Map<String, dynamic> tournamentData;

  // Implement Double Bracket specific methods and properties
  N_BracketTournament({required this.bracketCount,
    String participantType = "player",
    required this.tournamentData});


}
