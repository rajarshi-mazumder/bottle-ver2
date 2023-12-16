import 'package:bottle_ver2/models/tournamentModels/team.dart';

class Player implements Mappable {
  @override
  String? name;
  String? nationality;
  String? twitchLink;
  String? twitterLink;
  String? mainAgent;
  String? regionFlag;

  Player(
      {this.name,
      this.nationality,
      this.twitchLink,
      this.twitterLink,
      this.mainAgent,
      this.regionFlag});

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nationality': nationality,
      'twitchLink': twitchLink,
      'twitterLink': twitterLink,
      'mainAgent': mainAgent,
      'regionFlag': regionFlag,
    };
  }

  @override
  Map<String, dynamic> tournamnetSpecificToMap() {
    return {
      'name': name
      // 'regionFlag': regionFlag,
    };
  }

  static Player fromMap(Map<String, dynamic> map) {
    return Player(
      name: map['name'],
      nationality: map['nationality'] ?? '',
      twitchLink: map['twitchLink'] ?? '',
      twitterLink: map['twitterLink'] ?? '',
      mainAgent: map['mainAgent'] ?? '',
      regionFlag: map['regionFlag'] ?? '',
    );
  }
}

List<Player> participants1 = [
  Player(name: "Yay", regionFlag: "flags/us.png"),
  Player(name: "FNS", regionFlag: "flags/us.png"),
  Player(name: "Marved", regionFlag: "flags/us.png"),
  Player(name: "Crashies", regionFlag: "flags/us.png"),
  Player(name: "Jingg", regionFlag: "flags/singapore.png"),
  Player(name: "Forsaken", regionFlag: "flags/singapore.png"),
  Player(name: "Mako", regionFlag: "flags/sk.png"),
  Player(name: "Buzz", regionFlag: "flags/sk.png"),
];
