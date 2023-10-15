import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(TournamentDisplayApp());

class TournamentDisplayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tournament Display'),
        ),
        body: TournamentDisplay(),
      ),
    );
  }
}

class TournamentDisplay extends StatefulWidget {
  @override
  _TournamentDisplayState createState() => _TournamentDisplayState();
}

class _TournamentDisplayState extends State<TournamentDisplay> {
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
    ]);
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
            return roundWidgets[index];
          })),
        ),
      ),
    );
  }
}

class Team {
  String name = "";
}

class Tournament {
  List<Team>? teams = [];
  List<Round> rounds = [];

  Tournament({this.teams});

  void generateRounds() {
    double totalTeams =
        double.parse(teams!.length.toString()); // totalTeams= 16
    int noOfRounds = log(totalTeams) ~/ log(2);
    for (int i = noOfRounds; i > 0; i--) {
      rounds.add(Round(
        roundIndex: i - 1,
        noOfMatches: (pow(2, i - 1)).toInt(),
      ));
    }
    rounds.forEach((element) {
      print(
          "Matches in round: ${pow(2, element.roundIndex)},,${element.roundIndex}");
    });
  }
}

class Round {
  int roundIndex = 0;
  List<Match>? matches;
  int noOfMatches;

  Round({required this.roundIndex, this.matches, required this.noOfMatches});
}

class Match {
  Team? teamA;
  Team? teamB;
}