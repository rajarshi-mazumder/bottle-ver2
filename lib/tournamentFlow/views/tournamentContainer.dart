import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'nBracketTournamentScreen.dart';
import '../controllers/providers/nBracketTournamentDataProvider.dart';
import '../models/nBracketTournament.dart';

class TournamentContainer extends StatefulWidget {
  TournamentContainer({super.key, required this.tournament});

  N_BracketTournament tournament;

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

            return tournamentDataProvider;
          },
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text("TOURAMENT PROGRESSION"),
          ),
          body: N_BracketTournamentScreen(tournament: widget.tournament)),
    );
  }
}
