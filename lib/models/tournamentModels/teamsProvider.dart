import 'package:bottle_ver2/models/tournamentModels/team.dart';
import 'package:flutter/cupertino.dart';

class TeamsProvider with ChangeNotifier {
  List<Team> unlistedGameTeams = [];

  Future<void> createUnlistedGameTeam(String? teamName,
      {int? membersCount,
      List<dynamic>? members,
      dynamic? teamLogo,
      dynamic? regionFlag}) async {
    final team = Team(
        name: teamName ?? "n/a",
        membersCount: membersCount ?? 0,
        members: members ?? [],
        teamLogo: teamLogo ?? 'n/a',
        regionFlag: 'n/a');
    print(team.name);
  }
}
