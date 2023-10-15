import 'dart:math';

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
