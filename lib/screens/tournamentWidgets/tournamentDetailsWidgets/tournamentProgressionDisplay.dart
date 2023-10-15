import 'package:flutter/material.dart';

import '../../../models/tournamentModels/tournamentModels.dart';

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

    tournament = Tournament(teams: [
      Team(),
      Team(),
      Team(),
      Team(),
      Team(),
      Team(),
      Team(),
      Team(),
      Team(),
      Team(),
      Team(),
      Team(),
      Team(),
      Team(),
      Team(),
      Team(),
    ]);
    // tournament = Tournament(teams: [
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    //   Team(),
    // ]);
    tournament.generateRounds();
    generateRoundWidgets();
  }

  generateRoundWidgets() {
    tournament.rounds.forEach((round) {
      roundWidgets.add(Container(
        margin: EdgeInsets.only(top: 0),
        child: Column(
          children: List.generate(round.noOfMatches, (index) {
            return Container(
              width: 200,
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: BoxConstraints(minHeight: 50),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.blue,
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Team A"),
                        ),
                      ),
                      Text("VS"),
                      Container(
                        color: Colors.red,
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Team B"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Row(
              children: List.generate(roundWidgets.length, (index) {
            return Expanded(child: roundWidgets[index]);
          })),
        ),
      ),
    );
  }
}
