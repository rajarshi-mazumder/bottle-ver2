import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:bottle_ver2/models/tournamentModels/CS2Player.dart';
import 'package:bottle_ver2/utilities/constants/gameConstants/gameConstants.dart';

import '../../utilities/json/writeJSONToFile.dart';
import 'ValorantPlayer.dart';

class PlayerProvider with ChangeNotifier {
  List<ValorantPlayer> valorantPlayers = [];
  List<CS2Player> cs2Players = [];

  Future<ValorantPlayer> createValorantPlayer(
    String? username, {
    String? rank,
    String? preferredRole,
    String? mainAgent,
    String? game,
  }) async {
    // Instantiate a new ValorantPlayer
    final player = ValorantPlayer(
      username: username!,
      rank: rank ?? 'n/a',
      preferredRole: preferredRole ?? 'n/a',
      mainAgent: mainAgent ?? 'n/a',
      game: GameTitles.valorant.name,
    );
    //
    valorantPlayers.add(player);
    notifyListeners();
    print(
        "${player.username}, ${player.rank}, ${player.preferredRole}, ${player.mainAgent},${player.game}");
    Map<String, dynamic> myData = {
      'username': player.username,
      'rank': player.rank,
      'mainAgent': player.preferredRole,
      'game': player.game,
    };
    // String jsonString = json.encode(player);
    saveData("key2", myData.toString());

    return player;
  }

  CS2Player createCS2Player(
    String username, {
    String? rank,
    String? region,
    String? specialization,
    String? game,
  }) {
    final player = CS2Player(
        username: username,
        rank: rank ?? 'n/a',
        region: region ?? 'n/a',
        specialization: specialization ?? 'n/a',
        game: GameTitles.counterStrike.name);
    cs2Players.add(player);
    notifyListeners();
    print(
        "${player.username}, ${player.rank}, ${player.specialization}, ${player.region}, ${player.game}");
    String jsonString = json.encode(player);

    return player;
  }
}
