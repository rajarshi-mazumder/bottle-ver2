import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    generateRounds();
  }

  void generateRounds() {
    int totalTeams = numberOfTeams;
    while (totalTeams > 0) {
      List<String> teams = [];
      for (int i = 0; i < totalTeams; i++) {
        teams.add("Team ${i + 1}");
      }
      rounds.add(teams);
      totalTeams ~/= 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rounds.map((round) {
            return RoundDisplay(teams: round);
          }).toList(),
        ),
      ),
    );
  }
}

class RoundDisplay extends StatelessWidget {
  final List<String> teams;

  RoundDisplay({required this.teams});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: teams
          .map(
            (team) => Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(team),
            ),
          )
          .toList(),
    );
  }
}
