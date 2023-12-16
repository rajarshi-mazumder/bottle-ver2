import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/providers/nBracketTournamentDataProvider.dart';
import '../models/nBracketTournament.dart';
import 'createTournament_nBracket.dart';
import 'nBracketTournamentWidgets/bracketRounds.dart';
import 'nBracketTournamentWidgets/postBracketRounds.dart';

class N_BracketTournamentScreen extends StatefulWidget {
  N_BracketTournamentScreen({required this.tournament});

  N_BracketTournament tournament;

  @override
  _N_BracketTournamentScreenState createState() =>
      _N_BracketTournamentScreenState();
}

class _N_BracketTournamentScreenState extends State<N_BracketTournamentScreen> {
  List<List<String>> rounds = [];

  @override
  void initState() {
    super.initState();
    widget.tournament = widget.tournament as N_BracketTournament;
  }

  void submitMatches() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<nBracketTournamentDataProvider>(
      builder: (context, nBracketTournamentDataProvider tournamentDataProvider,
          child) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                            color: index % 2 == 0
                                ? Colors.black26
                                : Colors.black45,
                            height: index % 2 == 0 ? 800 : 400,
                            child: BracketRounds(
                              bracket: widget
                                  .tournament.tournamentData["brackets"][index],
                            ));
                      },
                      childCount: widget.tournament.bracketCount,
                    ),
                  ),
                  if (tournamentDataProvider.tournamentData["postBracketRounds"]
                          ["rounds"] !=
                      null)
                    SliverToBoxAdapter(
                      child: Container(
                          color: Colors.blueGrey,
                          height: 200,
                          child: PostBracketRounds(
                            postBracketRounds: tournamentDataProvider
                                .tournamentData["postBracketRounds"],
                          )),
                    ),
                ],
              ),
              Positioned(
                right: 20,
                top: 20,
                child: ElevatedButton(
                    onPressed: () {
                      print(
                          "PRINTING TOURNAMNENT DATAAA : ${tournamentDataProvider.tournamentData}");
                    },
                    child: Text("Update tournament")),
              ),
            ],
          ),
        );
      },
    );
  }
}
