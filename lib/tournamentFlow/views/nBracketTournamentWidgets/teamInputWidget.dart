import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../tournamentFlow/views/createTournament_nBracket.dart';
import '../../controllers/providers/nBracketTournamentDataProvider.dart';

class TeamInputWidget extends StatefulWidget {
  TeamInputWidget({
    super.key,
    required this.bracketIndex,
    required this.selectedTeam,
    required this.roundIndex,
    required this.matchIndex,
    required this.participantA_B,
  });

  String selectedTeam;

  int bracketIndex;
  int roundIndex;
  int matchIndex;
  String participantA_B;

  // List<List<Map<String, dynamic>>> roundMatchesData;

  @override
  State<TeamInputWidget> createState() => _TeamInputWidgetState();
}

class _TeamInputWidgetState extends State<TeamInputWidget> {
  @override
  Widget build(BuildContext context) {
    nBracketTournamentDataProvider tournamentDataProvider =
        context.watch<nBracketTournamentDataProvider>();

    // print(tournamentDataProvider.tournamentData["brackets"][widget.bracketIndex]
    // ["rounds"]);
    return Row(
      children: [
        Container(
          height: 50,
          width: 180,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(child: Text(widget.selectedTeam)),
        ),
      ],
    );
  }
}
