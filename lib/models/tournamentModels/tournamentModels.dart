import 'dart:convert';
import 'dart:math';

import 'package:bottle_ver2/models/tournamentModels/round.dart';
import 'package:bottle_ver2/tournamentFlow/views/createTournament_nBracket.dart';
import '../../tournamentFlow/models/nBracketTournament.dart';
import '../../tournamentFlow/controllers/data/tournamentHashMapData/doubleElimWinnerLoserRoundHashMap.dart';
import 'team.dart';

class Tournament {
  List<String>? participants = [];
  List rounds = [];
  Mappable? winner;
  String participantType;

  Tournament({this.participants, this.winner, this.participantType = "player"});

  // Factory method to create tournaments
  // factory Tournament.createTournament({required String type,
  //   int bracketCount = 0,
  //   required String participantType,
  //   List<String>? participants,
  //   int participantsLength = 0,
  //   Map<String, dynamic>? winnerLoserHashMap}) {
  //   if (type == 'n_bracket') {
  //     return N_BracketTournament(
  //         bracketCount: bracketCount, participantType: participantType);
  //   }
  //   // else if (type == "double_elimination") {
  //   //   return DoubleElim_Tournament(
  //   //       noOfParticipants: participantsLength!,
  //   //       winnerLoserHashMap: winnerLoserHashMap!,
  //   //       participants: participants);
  //   // }
  //
  //   else {
  //     throw Exception('Invalid tournament type');
  //   }
  // }

  Map<String, dynamic> toMap() {
    return {
      'participants': participants,
      'rounds': rounds.map((round) => round.toMap()).toList(),
      'winner': winner?.toMap(),
      'participantType': participantType
    };
  }

  Map<String, dynamic> tournamentSpecificToMap() {
    return {
      // 'teams': teams?.map((team) => team?.tournamnetSpecificToMap()).toList(),
      'rounds': rounds.map((round) => round.tournamentSpecificToMap()).toList(),
      'winner': winner?.tournamnetSpecificToMap(),
      'participantType': participantType
    };
  }
}
