import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

class TournamentDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tournament Display'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundDisplay(
              teams: [
                "Team 1",
                "Team 2",
                "Team 3",
                "Team 4",
                "Team 5",
                "Team 6",
                "Team 7",
                "Team 8",
              ],
            ),
            SizedBox(height: 20),
            RoundDisplay(
              teams: [
                "Match 1 Winner",
                "Match 2 Winner",
                "Match 3 Winner",
                "Match 4 Winner",
              ],
            ),
            SizedBox(height: 20),
            RoundDisplay(
              teams: [
                "Semifinal 1 Winner",
                "Semifinal 2 Winner",
              ],
            ),
            SizedBox(height: 20),
            RoundDisplay(
              teams: [
                "Final Winner",
              ],
            ),
          ],
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
