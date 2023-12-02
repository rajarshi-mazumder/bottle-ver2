import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tournamentModels/match.dart';
import '../../../models/tournamentModels/player.dart';
import '../../../models/tournamentModels/round.dart';
import '../../../models/tournamentModels/team.dart';
import '../../../models/tournamentModels/tournamentModels.dart';
import '../../../tournamentFlow/controllers/providers/nBracketTournamentDataProvider.dart';
import '../../../tournamentFlow/views/createTournament_nBracket.dart';
import '../../../tournamentFlow/views/nBracketTournamentWidgets/bracketRounds.dart';
import '../../../tournamentFlow/views/nBracketTournamentWidgets/postBracketRounds.dart';

class N_BracketTournamentEditor extends StatefulWidget {
  N_BracketTournamentEditor({required this.tournament});

  N_BracketTournament tournament;

  @override
  _N_BracketTournamentEditorState createState() =>
      _N_BracketTournamentEditorState();
}

class _N_BracketTournamentEditorState extends State<N_BracketTournamentEditor> {
  int numberOfTeams = 16; // Change this to set the initial number of teams
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
                        List<List<Map<String, dynamic>>> roundMatchesData = [];

                        return Container(
                            color: index % 2 == 0
                                ? Colors.black26
                                : Colors.black45,
                            height: index % 2 == 0 ? 800 : 400,
                            child: BracketRounds(
                              bracket: widget.tournament.brackets[index],
                              roundMatchesData: roundMatchesData,
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
                          child: PostBracketRounds(
                            rounds: tournamentDataProvider
                                .tournamentData["postBracketRounds"],
                          )),
                    ),
                ],
              ),
              Positioned(
                right: 250,
                top: 20,
                child: ElevatedButton(
                    onPressed: () {
                      widget.tournament.generatePostBracketRounds(
                          brackets: tournamentDataProvider.tournamentData);
                      tournamentDataProvider
                              .tournamentData["postBracketRounds"] =
                          widget.tournament.postBracketRounds;

                      print(
                          "PROVIDER DATA ${tournamentDataProvider.tournamentData['postBracketRounds']}");
                      tournamentDataProvider.notifyListeners();
                    },
                    child: Text("Generate round for bracket winners")),
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
