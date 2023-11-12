import 'package:bottle_ver2/screens/tournamentWidgets/tournamentProgressionWidgets/postBracketRounds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tournamentModels/match.dart';
import '../../../models/tournamentModels/player.dart';
import '../../../models/tournamentModels/round.dart';
import '../../../models/tournamentModels/team.dart';
import '../../../models/tournamentModels/tournamentModels.dart';
import '../tournamentProgressionWidgets/bracketRounds.dart';
import '../../../tournamentOperations/createTournament.dart';

class DoubleBracketTournamentEdit extends StatefulWidget {
  DoubleBracketTournamentEdit({required this.tournament});

  DoubleBracketTournament tournament;

  @override
  _DoubleBracketTournamentEditState createState() =>
      _DoubleBracketTournamentEditState();
}

class _DoubleBracketTournamentEditState
    extends State<DoubleBracketTournamentEdit> {
  int numberOfTeams = 16; // Change this to set the initial number of teams
  List<List<String>> rounds = [];

  @override
  void initState() {
    super.initState();
    widget.tournament = widget.tournament as DoubleBracketTournament;
  }

  void submitMatches() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<TournamentDataProvider>(
      builder: (context, TournamentDataProvider tournamentDataProvider, child) {
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

List createRoundMatches(
    {required List roundMatches, required String participantType}) {
  List matchesList = [];
  Map<String, dynamic> match = {};
  roundMatches.forEach((roundMatch) {
    if (participantType == "player") {
      match = {
        "participantA": Player(name: roundMatch["participantA"]["name"]),
        "participantB": Player(name: roundMatch["participantB"]["name"]),
        "winner": Player(name: roundMatch["winner"]?["name"] ?? ""),
      };
    } else if (participantType == "team") {
      match = {
        "participantA": {"name": roundMatch["participantA"]["name"]},
        "participantB": {"name": roundMatch["participantB"]["name"]},
        "winner": {"name": roundMatch["winner"]?["name"]},
      };
    }

    matchesList.add(match);
  });

  return matchesList;
}

convertDoubleBracketTournamentToMap(
    // ONLY FOR DOUBLE BRACKET
    {required Map<String, dynamic> tournamentData,
    required String participantType}) {
  print(tournamentData);
  Map<String, dynamic> brackets;
  List bracketsList = [];
  for (int i = 0; i < tournamentData["brackets"].length; i++) {
    List roundsList = tournamentData["brackets"][i]["rounds"];
    int roundIndex = 0;
    List roundMapList = [];
    roundsList.forEach((round) {
      print("MICHIII ${round}");
      List<Map<String, dynamic>> matchesMapList = [];
      round["matches"].forEach((match) {
        Map<String, dynamic> matchMap = {
          "participantA": {"name": match["participantA"]["name"]},
          "participantB": {"name": match["participantB"]["name"]},
          "winner": match["winner"]
        };
        matchesMapList.add(matchMap);
      });

      // print("LUCILLE ${matchesMapList}");
      roundMapList.add({
        "roundIndex": roundIndex,
        "noOfMatches": matchesMapList.length,
        "matches": matchesMapList
      });
      // print("GRIMESS ${roundMap}");
      roundIndex++;
    });
    bracketsList.add({
      "bracketIndex": i,
      "rounds": roundMapList,
      "winner": tournamentData["brackets"][i]["winner"],
      // "participants": tournamentData["brackets"][i]["pa"]
    });
  }
  print("NEGANN ${bracketsList}");
}
