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
                    tournament.rounds.forEach((element) {
                      element.matches?.forEach((element) {
                        print(
                            "${element.teamA!.name}  VS  ${element.teamB!.name}");
                      });
                      print("------------");
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
  MatchInputWidget({
    super.key,
    required this.teamAController,
    required this.teamBController,
    required this.matchIndex,
    required this.roundIndex,
    required this.teamNames, // Add a parameter for team names
  });

  TextEditingController teamAController;
  TextEditingController teamBController;
  final int roundIndex;
  final int matchIndex;
  final List<String> teamNames; // List of team names

  @override
  State<MatchInputWidget> createState() => _MatchInputWidgetState();
}

class _MatchInputWidgetState extends State<MatchInputWidget> {
  String selectedTeamA = ''; // Track selected team A
  String selectedTeamB = ''; // Track selected team B
  @override
  void initState() {
    super.initState();
    widget.teamNames.add("");
    selectedTeamA = widget.teamNames.last;
    selectedTeamB = widget.teamNames.last;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.roundIndex == 0) {
      print("Match addedddddddd ${widget.matchIndex}");
    }
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
                child: DropdownButton<String>(
                  value: selectedTeamA,
                  items: widget.teamNames.map((team) {
                    return DropdownMenuItem<String>(
                      value: team,
                      child: Text(team),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTeamA = value!;
                      roundMatchesData[widget.roundIndex][widget.matchIndex]
                          ["teamA"] = value;
                      roundMatchesData[widget.roundIndex][widget.matchIndex]
                          ["teamB"] = selectedTeamB;
                    });
                  },
                ),
              ),
              Text("VS"),
              Container(
                color: Colors.red,
                child: DropdownButton<String>(
                  value: selectedTeamB,
                  items: widget.teamNames.map((team) {
                    return DropdownMenuItem<String>(
                      value: team,
                      child: Text(team),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTeamB = value!;
                      roundMatchesData[widget.roundIndex][widget.matchIndex]
                          ["teamA"] = selectedTeamA;
                      roundMatchesData[widget.roundIndex][widget.matchIndex]
                          ["teamB"] = value;
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

class WinnerInputData extends StatefulWidget {
  WinnerInputData({super.key, required this.teamNames});

  final List<String> teamNames;

  @override
  State<WinnerInputData> createState() => _WinnerInputDataState();
}

class _WinnerInputDataState extends State<WinnerInputData> {
  String winner = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    winner = widget.teamNames.last;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      color: Colors.green,
      child: DropdownButton<String>(
        value: winner,
        items: widget.teamNames.map((team) {
          return DropdownMenuItem<String>(
            value: team,
            child: Text(team),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            winner = value!;
          });
        },
      ),
    );
  }
}
