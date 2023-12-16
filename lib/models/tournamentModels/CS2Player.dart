import 'package:bottle_ver2/models/tournamentModels/player.dart';

class CS2Player extends Player {
  CS2Player(
      {required this.username, this.rank, this.region, this.specialization});
  String username;
  String? region;
  String? rank;
  String? specialization;
}
