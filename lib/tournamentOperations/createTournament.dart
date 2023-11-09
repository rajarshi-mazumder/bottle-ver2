import 'package:bottle_ver2/screens/teamsWidgets/playerWidgets/playerDisplayWidget.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/TournamentTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tournamentModels/player.dart';
import '../models/tournamentModels/round.dart';
import '../models/tournamentModels/team.dart';
import '../models/tournamentModels/tournamentModels.dart';
import '../models/tournamentModels/match.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/matchInputWidget.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/tournamentProgressionDisplay.dart';
import '../screens/tournamentWidgets/tournamentProgressionWidgets/winnerInputWidget.dart';
import 'bracketRounds.dart';
import 'package:bottle_ver2/models/tournamentModels/match.dart';

class TournamentDataProvider with ChangeNotifier {
  Map<String, dynamic> tournamentData = {"brackets": []};

  updateTournamentData(Map<String, dynamic> data) {
    // tournamentData.add(data);
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
        participantType: "player") as SingleEliminationTournament;

    widget.tournament1.generateRounds(participants: participants1);

    widget.tournament2 = Tournament.createTournament(
        type: "DoubleBracket",
        bracketCount: 1,
        participantType: "player") as DoubleBracketTournament;
    widget.tournament2
        .generateNewBracket(participantsList: participants1, bracketIndex: 1);
    // widget.tournament2
    //     .generateNewBracket(participantsList: participants1, bracketIndex: 2);

    print("ROUNDS: ");
    print(widget.tournament1.tournamentSpecificToMap());
    widget.tournament1.rounds.forEach((round) {
      print(round.noOfMatches);
    });
    print("-------------");

    print(widget.tournament2.tournamentSpecificToMap());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TournamentDataProvider>(
            create: (context) => TournamentDataProvider()),
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
                  if (widget.tournament.runtimeType == DoubleBracketTournament)
                    convertDoubleBracketTournamentToModel(
                        tournamentData: tournamentDataProvider.tournamentData,
                        participantType: "player");
                },
                child: Text("SMTH"))
          ],
        );
      },
    );
  }

  convertDoubleBracketTournamentToModel(
      // ONLY FOR DOUBLE BRACKET
      {required Map<String, dynamic> tournamentData,
      required String participantType}) {
    DoubleBracketTournament doubleBracketTournament = DoubleBracketTournament(
        bracketCount: tournamentData["brackets"].length);

    List<Map<String, dynamic>> brackets = [];

    for (int i = 0; i < tournamentData["brackets"].length; i++) {
      int bracketIndex = tournamentData["brackets"][i]["bracketIndex"];
      brackets.add({"bracketIndex": bracketIndex});
      List<Round> rounds = [];
      tournamentData["brackets"][i]["rounds"].forEach((List roundMatches) {
        Round round = Round(
            roundIndex: roundMatches[0]["round"],
            noOfMatches: roundMatches.length);

        round.matches = createRoundMatches(
            roundMatches: roundMatches, participantType: participantType);

        rounds.add(round);
      });

      brackets[i] = {"bracketIndex": bracketIndex, "rounds": rounds};
    }

    doubleBracketTournament.brackets = brackets;
    print(
        "parsedRoundMatchesData:  ${doubleBracketTournament.tournamentSpecificToMap()}");
  }
}

List<TournamentMatch> createRoundMatches(
    {required List roundMatches, required String participantType}) {
  List<TournamentMatch> matchesList = [];
  TournamentMatch match = TournamentMatch();
  roundMatches.forEach((roundMatch) {
    print("OUTTHOUGHT ${roundMatch["winner"]}");
    if (participantType == "player") {
      match = TournamentMatch(
        participantA: Player(name: roundMatch["participantA"]["name"]),
        participantB: Player(name: roundMatch["participantB"]["name"]),
        winner: Player(name: roundMatch["winner"]?["name"] ?? ""),
      );
    } else if (participantType == "team") {
      match = TournamentMatch(
        participantA: Team(name: roundMatch["participantA"]["name"]),
        participantB: Team(name: roundMatch["participantB"]["name"]),
        winner: Team(name: roundMatch["winner"]?["name"] ?? ""),
      );
    }

    matchesList.add(match);
  });

  return matchesList;
}
