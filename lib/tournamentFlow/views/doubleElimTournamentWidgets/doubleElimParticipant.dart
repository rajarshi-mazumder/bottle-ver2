import 'package:flutter/material.dart';

class DoubleElimParticipantWidget extends StatelessWidget {
  final int teamIndex;
  final int matchIndex;
  final int roundIndex;
  final String bracketType;
  String? participantA_B;

  DoubleElimParticipantWidget({
    required this.teamIndex,
    required this.matchIndex,
    required this.roundIndex,
    required this.bracketType,
    this.participantA_B,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      color: Colors.grey[300],
      // child: Text(' $bracketType- R $roundIndex, M $matchIndex'),
      child: Text(participantA_B.toString()),
    );
  }
}
