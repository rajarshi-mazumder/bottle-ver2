import 'package:bottle_ver2/models/tournamentModels/team.dart';

import '../../utilities/constants/gameConstants/gameConstants.dart';

class ValorantTeam extends Team {
  String? game = GameTitles.valorant.name;
  dynamic? igl;
  ValorantTeam({
    String? name,
    int? membersCount,
    String? regionFlag,
    String? teamLogo,
    List<dynamic>? members,
    this.igl,
    this.game,
  });

// Other methods and logic...
}
