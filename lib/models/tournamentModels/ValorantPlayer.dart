import 'package:bottle_ver2/models/tournamentModels/player.dart';

class ValorantPlayer extends Player {
  ValorantPlayer(
      {required this.username,
      this.region,
      this.preferredRole,
      this.rank,
      this.mainAgent});

  //Properties that a VALORANT player should have
  String username;
  String? region;
  String? preferredRole;
  String? rank;
  String? mainAgent;
}
