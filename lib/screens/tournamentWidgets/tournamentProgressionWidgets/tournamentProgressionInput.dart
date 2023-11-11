import 'package:bottle_ver2/screens/tournamentWidgets/tournamentProgressionWidgets/tournamentProgressionDisplay.dart';
import 'package:bottle_ver2/tournamentOperations/createTournament.dart';
import 'package:flutter/material.dart';

import '../../../models/tournamentModels/team.dart';
import '../../../models/tournamentModels/tournamentModels.dart';
import '../../tournamentDetailsScreen.dart';
import 'matchInputWidget.dart';
import 'winnerInputWidget.dart';
import 'package:bottle_ver2/models/tournamentModels/match.dart';

List<List<Map<String, dynamic>>> roundMatchesListData = [];
String? winner;

class TournamentProgressionInput extends StatefulWidget {
  TournamentProgressionInput({required this.tournament});

  Tournament tournament;

  @override
  _TournamentProgressionInputState createState() =>
      _TournamentProgressionInputState();
}

class _TournamentProgressionInputState
    extends State<TournamentProgressionInput> {
  int numberOfTeams = 16; // Change this to set the initial number of teams
  List<List<String>> rounds = [];

  List<Widget> roundWidgets = [];

  @override
  void initState() {
    super.initState();
    roundMatchesListData = [];

    roundMatchesListData =
        List.generate(widget.tournament.rounds.length, (index) {
      return List.generate(widget.tournament.rounds[index].noOfMatches,
          (index) {
        return {"teamA": null, "teamB": null};
      });
    });
    widget.tournament.generateRounds(participants: teams);
    generateRoundWidgets();
  }

  generateRoundWidgets() {
    int roundIndex = -1;

    widget.tournament.rounds.forEach((round) {
      roundIndex++;
      int matchIndex = -1;
      roundMatchesListData.add([]);
      roundWidgets.add(Container(
        margin: EdgeInsets.only(top: 0),
        child: Column(
          children: List.generate(round.noOfMatches, (index) {
            matchIndex++;

            roundMatchesListData[roundIndex].add({
              "round": roundIndex,
              "participantA": "",
              "participantA": "",
            });

            return MatchInputWidget(
              roundMatchesData: roundMatchesListData,
              matchIndex: matchIndex,
              roundIndex: roundIndex,
              // teamNames: List.generate(widget.tournament.participants!.length,
              //         (index) => widget.tournament.participants![index].name!),
              isMatchDecided: false,
              bracketIndex: 0,
            );
          }),
        ),
      ));
    });
    roundWidgets.add(Container(
      width: 100,
      child: Column(
        children: [
          WinnerInputData(
            bracketIndex: 1,
            // teamNames: List.generate(widget.tournament.participants!.length,
            //     (index) => widget.tournament.participants![index].name!)
          ),
        ],
      ),
    ));
  }

  void submitMatches() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Row(
                  children: List.generate(roundWidgets.length, (index) {
                return Expanded(child: roundWidgets[index]);
              })),
            ),
          ),
          if (widget.tournament.rounds.length > 0)
            Positioned(
                right: 50,
                top: 50,
                child: ElevatedButton(
                    onPressed: () {
                      // print(roundMatchesData);
                      for (int i = 0; i < roundMatchesListData.length; i++) {
                        widget.tournament.rounds[i].matches = [];
                        for (int j = 0;
                            j < roundMatchesListData[i].length;
                            j++) {
                          Team participantA = Team();
                          Team participantB = Team();
                          Team winner = Team();

                          for (Mappable p in widget.tournament.participants!) {
                            if (roundMatchesListData[i][j]["teamA"] == p.name)
                              participantA = p as Team;
                            else if (roundMatchesListData[i][j]["teamB"] ==
                                p.name) participantB = p as Team;
                            if (roundMatchesListData[i][j]["winner"] ==
                                p.name) {
                              winner = p as Team;
                            }
                          }

                          Map<String, dynamic> match = {
                            "participantA": participantA,
                            "participantB": participantB,
                            "winner": winner
                          };
                          widget.tournament.rounds[i].matches!.add(match);
                        }
                      }
                      widget.tournament.winner = Team(name: winner);
                      widget.tournament.rounds.forEach((element) {
                        element.matches?.forEach((element) {
                          print(
                              "${element.participantA!.name}  VS  ${element.participantB!.name}");
                        });
                        print("------------");
                      });
                      print("------------");
                      print("WINNER: ${widget.tournament.winner?.name}");
                      print(widget.tournament.tournamentSpecificToMap());
                      convertTournamentJSONToObject(
                          widget.tournament.tournamentSpecificToMap());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TournamentProgressionDisplay(
                                      tournament: widget.tournament)));
                    },
                    child: Text(
                      "Submit ",
                      style: TextStyle(color: Colors.white),
                    )))
        ],
      ),
    );
  }
}

convertTournamentJSONToObject(Map<String, dynamic> tournamentJSON) {
  List parsedRoundMatchesData = [];
  for (int i = 0; i < tournamentJSON["rounds"].length; i++) {
    var roundData = tournamentJSON["rounds"][i];

    parsedRoundMatchesData
        .add({"roundIndex": roundData["roundIndex"], "matches": []});
    for (int j = 0; j < roundData["matches"].length; j++) {
      Team teamA = Team();
      Team teamB = Team();
      Team winner = Team();
      for (Team t in teams) {
        if (roundMatchesListData[i][j]["teamA"] == t.name)
          teamA = t;
        else if (roundMatchesListData[i][j]["teamB"] == t.name) teamB = t;
        if (roundMatchesListData[i][j]["winner"] == t.name) {
          winner = t;
        }
      }
      parsedRoundMatchesData[i]["matches"]
          .add({"teamA": teamA, "teamB": teamB, "winner": winner});
    }
  }
  print("parsedRoundMatchesData:  ${parsedRoundMatchesData}");
  print("roundMatchesData:  ${roundMatchesListData}");
}
