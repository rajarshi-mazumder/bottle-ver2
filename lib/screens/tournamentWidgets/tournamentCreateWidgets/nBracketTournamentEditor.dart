import 'package:bottle_ver2/tournamentOperations/tournamentScreenWidgets/nBracketTournamentWidgets/postBracketRounds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tournamentModels/match.dart';
import '../../../models/tournamentModels/player.dart';
import '../../../models/tournamentModels/round.dart';
import '../../../models/tournamentModels/team.dart';
import '../../../models/tournamentModels/tournamentModels.dart';
import '../../../tournamentOperations/providers/nBracketTournamentDataProvider.dart';
import '../../../tournamentOperations/tournamentScreenWidgets/nBracketTournamentWidgets/bracketRounds.dart';
import '../../../tournamentOperations/createTournament.dart';

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
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.tournament.bracketCount,
                        itemBuilder: (BuildContext context, int index) {
                          List<List<Map<String, dynamic>>> roundMatchesData =
                              [];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                color: index % 2 == 0
                                    ? Colors.black26
                                    : Colors.black45,
                                child: BracketRounds(
                                  bracket: widget.tournament.brackets[index],
                                  roundMatchesData: roundMatchesData,
                                )),
                            // child: Text(widget.tournament.brackets[index].toString()),
                          );
                        },
                      ),
                    ),
                  ),
                  if (tournamentDataProvider.tournamentData["postBracketRounds"]
                          ["rounds"] !=
                      null)
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            color: Colors.blueGrey,
                            child: PostBracketRounds(
                              rounds: tournamentDataProvider
                                  .tournamentData["postBracketRounds"],
                            )),
                      ),
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
