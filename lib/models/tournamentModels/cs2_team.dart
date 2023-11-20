import 'package:bottle_ver2/models/tournamentModels/team.dart';

import '../../utilities/constants/gameConstants/gameConstants.dart';

class CS2Team extends Team {
  dynamic? igl;
  String? game = GameTitles.counterStrike.name;
  CS2Team(
      {String? name,
      int? membersCount,
      String? regionFlag,
      String? teamLogo,
      List<dynamic>? members,
      this.igl,
      this.game});

// Other methods and logic...
}
