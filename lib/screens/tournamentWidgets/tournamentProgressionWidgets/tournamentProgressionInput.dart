import 'package:bottle_ver2/screens/tournamentWidgets/tournamentProgressionWidgets/tournamentProgressionDisplay.dart';
import 'package:flutter/material.dart';

import '../../../models/tournamentModels/team.dart';
import '../../../models/tournamentModels/tournamentModels.dart';
import 'matchInputWidget.dart';
import 'winnerInputWidget.dart';

List roundMatchesData = [];
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
    roundMatchesData = [];
    // widget.tournament = Tournament(teams: [
    //   Team(name: "Fnatic"),
    //   Team(name: "PRX"),
    //   Team(name: "DRX"),
    //   Team(name: "Loud"),
    //   Team(name: "Team Liquid"),
    //   Team(name: "Optic"),
    //   Team(name: "Zeta Division"),
    //   Team(name: "Sentinels"),
    // ]);
    roundMatchesData = List.generate(widget.tournament.rounds.length, (index) {
      return List.generate(widget.tournament.rounds[index].noOfMatches,
          (index) {
        return {"teamA": null, "teamB": null};
      });
    });
    widget.tournament.generateRounds();
    generateRoundWidgets();
  }

  generateRoundWidgets() {
    int roundIndex = -1;

    widget.tournament.rounds.forEach((round) {
      roundIndex++;
      int matchIndex = -1;
      roundMatchesData.add([]);
      roundWidgets.add(Container(
        margin: EdgeInsets.only(top: 0),
        child: Column(
          children: List.generate(round.noOfMatches, (index) {
            matchIndex++;
            TextEditingController teamAController = TextEditingController();
            TextEditingController teamBController = TextEditingController();
            roundMatchesData[roundIndex].add({
              "round": roundIndex,
              "teamA": teamAController.text,
              "teamB": teamBController.text,
            });

            return MatchInputWidget(
              matchIndex: matchIndex,
              roundIndex: roundIndex,
              teamNames: List.generate(widget.tournament.teams!.length,
                  (index) => widget.tournament.teams![index].name!),
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
              teamNames: List.generate(widget.tournament.teams!.length,
                  (index) => widget.tournament.teams![index].name!)),
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
                      for (int i = 0; i < roundMatchesData.length; i++) {
                        widget.tournament.rounds[i].matches = [];
                        for (int j = 0; j < roundMatchesData[i].length; j++) {
                          Team teamA = Team();
                          Team teamB = Team();
                          for (Team t in widget.tournament.teams!) {
                            if (roundMatchesData[i][j]["teamA"] == t.name)
                              teamA = t;
                            else if (roundMatchesData[i][j]["teamB"] == t.name)
                              teamB = t;
                          }
                          Match match = Match(teamA: teamA, teamB: teamB);
                          widget.tournament.rounds[i].matches!.add(match);
                        }
                      }
                      widget.tournament.winner = Team(name: winner);
                      widget.tournament.rounds.forEach((element) {
                        element.matches?.forEach((element) {
                          print(
                              "${element.teamA!.name}  VS  ${element.teamB!.name}");
                        });
                        print("------------");
                      });
                      print("------------");
                      print("WINNER: ${widget.tournament.winner}");
                      print(widget.tournament.toMap());
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
