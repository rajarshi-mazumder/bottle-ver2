import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tournamentModels/match.dart';
import '../../../models/tournamentModels/player.dart';
import '../../../models/tournamentModels/round.dart';
import '../../../models/tournamentModels/team.dart';
import '../../../models/tournamentModels/tournamentModels.dart';
import '../../../tournamentOperations/bracketRounds.dart';
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
        return Stack(
          children: [
            SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.tournament.bracketCount,
                itemBuilder: (BuildContext context, int index) {
                  List<Map<String, dynamic>> bracketMapData = [];
                  List<List<Map<String, dynamic>>> roundMatchesData = [];
                  bracketMapData.add({
                    "bracketIndex": widget.tournament.brackets[index],
                    "rounds": roundMatchesData
                  });
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        color: index % 2 == 0 ? Colors.black26 : Colors.black45,
                        child: BracketRounds(
                          bracket: widget.tournament.brackets[index],
                          roundMatchesData: roundMatchesData,
                        )),
                    // child: Text(widget.tournament.brackets[index].toString()),
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (widget.tournament.runtimeType == DoubleBracketTournament)
                    convertDoubleBracketTournamentToMap(
                        tournamentData: tournamentDataProvider.tournamentData,
                        participantType: "team");
                },
                child: Text("SMTH"))
          ],
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
    print("OUTTHOUGHT ${roundMatch["winner"]}");

    if (participantType == "player") {
      match = {
        "participantA": Player(name: roundMatch["participantA"]["name"]),
        "participantB": Player(name: roundMatch["participantB"]["name"]),
        "winner": Player(name: roundMatch["winner"]?["name"] ?? ""),
      };
    } else if (participantType == "team") {
      match = {
        "participantA": Team(name: roundMatch["participantA"]["name"]),
        "participantB": Team(name: roundMatch["participantB"]["name"]),
        "winner": Team(name: roundMatch["winner"]?["name"] ?? ""),
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
      List<Map<String, dynamic>> matchesMapList = [];
      round.forEach((match) {
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

//
// convertDoubleBracketTournamentToModel(
//     // ONLY FOR DOUBLE BRACKET
//         {required Map<String, dynamic> tournamentData,
//       required String participantType}) {
//   DoubleBracketTournament doubleBracketTournament = DoubleBracketTournament(
//       bracketCount: tournamentData["brackets"].length);
//
//   List<Map<String, dynamic>> brackets = [];
//
//   for (int i = 0; i < tournamentData["brackets"].length; i++) {
//     int bracketIndex = tournamentData["brackets"][i]["bracketIndex"];
//     brackets.add({"bracketIndex": bracketIndex});
//     List<Round> rounds = [];
//     tournamentData["brackets"][i]["rounds"].forEach((List roundMatches) {
//       Round round = Round(
//           roundIndex: roundMatches[0]["round"],
//           noOfMatches: roundMatches.length);
//
//       round.matches = createRoundMatches(
//           roundMatches: roundMatches, participantType: participantType);
//
//       rounds.add(round);
//     });
//
//     brackets[i] = {"bracketIndex": bracketIndex, "rounds": rounds};
//   }
//
//   doubleBracketTournament.brackets = brackets;
//   print(
//       "parsedRoundMatchesData:  ${doubleBracketTournament.tournamentSpecificToMap()}");
// }
