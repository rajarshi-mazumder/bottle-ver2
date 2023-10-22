import 'package:flutter/material.dart';

import '../../../models/tournamentModels/tournamentModels.dart';
import '../tournamentProgressionWidgets/matchInputWidget.dart';
import '../tournamentProgressionWidgets/winnerInputWidget.dart';

List roundMatchesData = [];
String? winner;

class TournamentProgressionDisplay extends StatefulWidget {
  @override
  _TournamentProgressionDisplayState createState() =>
      _TournamentProgressionDisplayState();
}

class _TournamentProgressionDisplayState
    extends State<TournamentProgressionDisplay> {
  int numberOfTeams = 16; // Change this to set the initial number of teams
  List<List<String>> rounds = [];
  late Tournament tournament;
  List<Widget> roundWidgets = [];

  @override
  void initState() {
    super.initState();
    roundMatchesData = [];
    tournament = Tournament(teams: [
      Team(name: "Fnatic"),
      Team(name: "PRX"),
      Team(name: "DRX"),
      Team(name: "Loud"),
      Team(name: "Team Liquid"),
      Team(name: "Optic"),
      Team(name: "Zeta Division"),
      Team(name: "Sentinels"),
    ]);
    roundMatchesData = List.generate(tournament.rounds.length, (index) {
      return List.generate(tournament.rounds[index].noOfMatches, (index) {
        return {"teamA": "", "teamB": ""};
      });
    });
    tournament.generateRounds();
    generateRoundWidgets();
  }

  generateRoundWidgets() {
    int roundIndex = -1;

    tournament.rounds.forEach((round) {
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
              teamNames: List.generate(tournament.teams!.length,
                  (index) => tournament.teams![index].name!),
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
              teamNames: List.generate(tournament.teams!.length,
                  (index) => tournament.teams![index].name!)),
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
          Positioned(
              right: 50,
              top: 50,
              child: ElevatedButton(
                  onPressed: () {
                    // print(roundMatchesData);
                    for (int i = 0; i < roundMatchesData.length; i++) {
                      tournament.rounds[i].matches = [];
                      for (int j = 0; j < roundMatchesData[i].length; j++) {
                        Match match = Match(
                            teamA: Team(name: roundMatchesData[i][j]["teamA"]),
                            teamB: Team(name: roundMatchesData[i][j]["teamB"]));
                        tournament.rounds[i].matches!.add(match);
                      }
                    }
                    tournament.winner = Team(name: winner);
                    tournament.rounds.forEach((element) {
                      element.matches?.forEach((element) {
                        print(
                            "${element.teamA!.name}  VS  ${element.teamB!.name}");
                      });
                      print("------------");
                    });
                    print("------------");
                    print("WINNER: ${tournament.winner}");
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
