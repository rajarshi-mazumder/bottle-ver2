import 'package:bottle_ver2/screens/tournamentWidgets/TournamentTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tournamentModels/round.dart';
import '../models/tournamentModels/team.dart';
import '../models/tournamentModels/tournamentModels.dart';
import '../models/tournamentModels/match.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/matchInputWidget.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/tournamentProgressionDisplay.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/winnerInputWidget.dart';
import 'bracketRounds.dart';

class TournamentDataProvider with ChangeNotifier {
  List tournamentData = [];

  updateTournamentData(Map<String, dynamic> data) {
    tournamentData.add(data);
    notifyListeners();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  late SingleEliminationTournament tournament1;
  late DoubleBracketTournament tournament2;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    widget.tournament1 = Tournament.createTournament(
        bracketCount: 0,
        type: 'SingleElimination',
        participantType: "teams") as SingleEliminationTournament;

    widget.tournament1.generateRounds(participants: teams);

    widget.tournament2 = Tournament.createTournament(
        type: "DoubleBracket",
        bracketCount: 1,
        participantType: "teams") as DoubleBracketTournament;
    widget.tournament2
        .generateNewBracket(participantsList: participants1, bracketIndex: 1);
    // widget.tournament2
    // .generateNewBracket(participantsList: teams2, bracketIndex: 2);

    print("ROUNDS: ");
    print(widget.tournament1.tournamentSpecificToMap());
    widget.tournament1.rounds.forEach((round) {
      print(round.noOfMatches);
    });
    print("-------------");

    // print(widget.tournament2.tournamentSpecificToMap());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TournamentDataProvider>(
            create: (context) => TournamentDataProvider())
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Create tournament'),
          ),
          body: TournamentEdit(tournament: widget.tournament2),
        ),
      ),
    );
  }
}

class TournamentEdit extends StatefulWidget {
  TournamentEdit({required this.tournament});

  DoubleBracketTournament tournament;

  @override
  _TournamentEditState createState() => _TournamentEditState();
}

class _TournamentEditState extends State<TournamentEdit> {
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
                  print(
                      "PRINTTTTTTTTTTT ${tournamentDataProvider.tournamentData}");
                },
                child: Text("SMTH"))
          ],
        );
      },
    );
  }

  convertTournamentJSONToObject(Map<String, dynamic> brackets) {
    List parsedRoundMatchesData = [];
    print(brackets);
    // for (int i = 0; i < tournamentJSON["rounds"].length; i++) {
    //   var roundData = tournamentJSON["rounds"][i];
    //
    //   parsedRoundMatchesData
    //       .add({"roundIndex": roundData["roundIndex"], "matches": []});
    //   for (int j = 0; j < roundData["matches"].length; j++) {
    //     Team teamA = Team();
    //     Team teamB = Team();
    //     Team winner = Team();
    //     for (Team t in teams) {
    //       if (widget.roundMatchesData[i][j]["teamA"] == t.name)
    //         teamA = t;
    //       else if (widget.roundMatchesData[i][j]["teamB"] == t.name) teamB = t;
    //       if (widget.roundMatchesData[i][j]["winner"] == t.name) {
    //         winner = t;
    //       }
    //     }
    //     parsedRoundMatchesData[i]["matches"]
    //         .add({"teamA": teamA, "teamB": teamB, "winner": winner});
    //   }
    // }
    print("parsedRoundMatchesData:  ${parsedRoundMatchesData}");
  }
}
