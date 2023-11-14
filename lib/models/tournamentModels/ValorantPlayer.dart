import 'dart:html';

import 'package:bottle_ver2/models/tournamentModels/player.dart';
import 'package:bottle_ver2/utilities/constants/gameConstants/gameConstants.dart';

class ValorantPlayer extends Player {
  ValorantPlayer(
      {required this.username,
      this.region,
      this.preferredRole,
      this.rank,
      this.mainAgent,
      this.game});

  //Properties that a VALORANT player should have
  String username;
  String? region;
  String? preferredRole;
  String? rank;
  String? mainAgent;
  String? game = GameTitles.valorant.name;
}
