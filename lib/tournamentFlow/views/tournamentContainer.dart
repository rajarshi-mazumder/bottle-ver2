import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/tournamentModels/tournamentModels.dart';
import '../../screens/tournamentWidgets/tournamentCreateWidgets/nBracketTournamentEditor.dart';
import '../controllers/providers/nBracketTournamentDataProvider.dart';

class TournamentContainer extends StatefulWidget {
  TournamentContainer({super.key, required this.tournament});

  Tournament tournament;

  @override
  State<TournamentContainer> createState() => _TournamentContainerState();
}

class _TournamentContainerState extends State<TournamentContainer> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<nBracketTournamentDataProvider>(
          create: (context) {
            nBracketTournamentDataProvider tournamentDataProvider =
                nBracketTournamentDataProvider();
            if (widget.tournament.runtimeType == N_BracketTournament) {
              N_BracketTournament temp =
                  widget.tournament as N_BracketTournament;
              tournamentDataProvider.bracketCount = temp.bracketCount;
              tournamentDataProvider.tournamentData["brackets"] = temp.brackets;
              tournamentDataProvider.tournamentData["postBracketRounds"] =
                  temp.postBracketRounds;
            }
            return tournamentDataProvider;
          },
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text("TOURAMENT PROGRESSION"),
          ),
          body: N_BracketTournamentEditor(
              tournament: widget.tournament as N_BracketTournament)),
    );
  }
}
