import 'package:bottle_ver2/models/tournamentModels/player.dart';
import 'package:bottle_ver2/utilities/constants/gameConstants/gameConstants.dart';

class CS2Player extends Player {
  CS2Player(
      {required this.username,
      this.rank,
      this.region,
      this.specialization,
      this.game});
  String username;
  String? region;
  String? rank;
  String? specialization;
  String? game = GameTitles.counterStrike.name;
}
