import 'package:flutter/cupertino.dart';

class nBracketTournamentDataProvider with ChangeNotifier {
  Map<String, dynamic> tournamentData = {
    "brackets": [],
    "postBracketRounds": {}
  };
  int bracketCount = 1;

  @override
  notifyListeners() {
    super.notifyListeners();
    print(tournamentData["brackets"].length);
  }
}
