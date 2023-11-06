import 'package:bottle_ver2/models/tournamentModels/CS2Player.dart';
import 'package:flutter/cupertino.dart';

import 'ValorantPlayer.dart';

class PlayerProvider with ChangeNotifier {
  List<ValorantPlayer> valorantPlayers = [];
  List<CS2Player> cs2Players = [];

  ValorantPlayer createValorantPlayer(
    String username, {
    String? rank,
    String? preferredRole,
    String? mainAgent,
  }) {
    // Instantiate a new ValorantPlayer
    final player = ValorantPlayer(
        username: username,
        rank: rank ?? 'n/a',
        preferredRole: preferredRole ?? 'n/a',
        mainAgent: mainAgent ?? 'n/a');
    //
    valorantPlayers.add(player);
    notifyListeners();
    print(
        "${player.username}, ${player.rank}, ${player.preferredRole}, ${player.mainAgent}");
    return player;
  }

  CS2Player createCS2Player(String username,
      {String? rank, String? region, String? specialization}) {
    final player = CS2Player(
        username: username,
        rank: rank ?? 'n/a',
        region: region ?? 'n/a',
        specialization: specialization ?? 'n/a');
    cs2Players.add(player);
    notifyListeners();
    print(
        "${player.username}, ${player.rank}, ${player.specialization}, ${player.region}");
    return player;
  }
}
