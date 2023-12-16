import 'package:flutter/material.dart';

import 'doubleElimMatchWidget.dart';

class DoubleElimRoundWidget extends StatelessWidget {
  final String bracketType;
  final int roundNumber;
  final int matchCount;
  Map<String, dynamic> tournamentHashMap;

  DoubleElimRoundWidget({
    required this.bracketType,
    required this.roundNumber,
    required this.matchCount,
    required this.tournamentHashMap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Round $roundNumber',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...List.generate(
              matchCount,
              (index) => DoubleElimMatchWidget(
                    bracketType: bracketType,
                    roundNumber: roundNumber,
                    matchNumber: index,
                    tournamentHashMap: tournamentHashMap,
                  )),
        ],
      ),
    );
  }
}
