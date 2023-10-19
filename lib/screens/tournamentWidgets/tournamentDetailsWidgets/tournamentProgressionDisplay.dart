import 'package:flutter/material.dart';

import '../../../models/tournamentModels/tournamentModels.dart';

List roundMatchesData = [];

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
      Team(name: "T1"),
      Team(name: "G2"),
      Team(name: "Bleed"),
      Team(name: "NAVI"),
      Team(name: "Cloud 9"),
      Team(name: "Global Esports"),
      Team(name: "Leviatan"),
      Team(name: "Karmine Corps"),
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
                teamAController: teamAController,
                teamBController: teamBController,
                matchIndex: matchIndex,
                roundIndex: roundIndex);
          }),
        ),
      ));
    });
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
                    tournament.rounds.forEach((element) {
                      element.matches?.forEach((match) {
                        print("${match.teamA}, ${match.teamB}");
                      });
                    });
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

class MatchInputWidget extends StatefulWidget {
  MatchInputWidget(
      {super.key,
      required this.teamAController,
      required this.teamBController,
      required this.matchIndex,
      required this.roundIndex});

  TextEditingController teamAController;
  TextEditingController teamBController;
  final int roundIndex;
  final int matchIndex;

  @override
  State<MatchInputWidget> createState() => _MatchInputWidgetState();
}

class _MatchInputWidgetState extends State<MatchInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints(minHeight: 50),
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.blue,
                child: TextFormField(
                  controller: widget.teamAController,
                  decoration: InputDecoration(hintText: "Team A"),
                  onChanged: (value) {
                    setState(() {
                      roundMatchesData[widget.roundIndex][widget.matchIndex]
                          ["teamA"] = widget.teamAController.text;
                      roundMatchesData[widget.roundIndex][widget.matchIndex]
                          ["teamB"] = widget.teamBController.text;
                    });
                  },
                ),
              ),
              Text("VS"),
              Container(
                color: Colors.red,
                child: TextFormField(
                  controller: widget.teamBController,
                  decoration: InputDecoration(hintText: "Team B"),
                  onChanged: (value) {
                    setState(() {
                      roundMatchesData[widget.roundIndex][widget.matchIndex]
                          ["teamA"] = widget.teamAController.text;
                      roundMatchesData[widget.roundIndex][widget.matchIndex]
                          ["teamB"] = widget.teamBController.text;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
