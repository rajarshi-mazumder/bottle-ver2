class Participant {
  String? name;
  String? regionFlag;

  Participant({this.name, this.regionFlag});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'regionFlag': regionFlag,
    };
  }

  Map<String, dynamic> tournamnetSpecificToMap() {
    return {
      'name': name
      // 'regionFlag': regionFlag,
    };
  }

  static Participant fromMap(Map<String, dynamic> map) {
    return Team(
      name: map['name'],
      regionFlag: map['regionFlag'] ?? '',
    );
  }
}

class Team extends Participant {
  int? membersCount;

  List<dynamic>? members;
  String? teamLogo;

  Team({String? name, this.membersCount, String? regionFlag, this.teamLogo})
      : super(name: name, regionFlag: regionFlag);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'membersCount': membersCount,
      'regionFlag': regionFlag,
      'members': members,
      'teamLogo': teamLogo,
    };
  }

  Map<String, dynamic> tournamnetSpecificToMap() {
    return {
      'name': name,
      // 'membersCount': membersCount,
      // 'regionFlag': regionFlag,
      // 'members': members,
      // 'teamLogo': teamLogo,
    };
  }

  static Team fromMap(Map<String, dynamic> map) {
    return Team(
      name: map['name'],
      membersCount: map['membersCount'] ?? 0,
      regionFlag: map['regionFlag'] ?? '',
      teamLogo: map['teamLogo'] ?? '',
    );
  }
}

List<Team> teams = [
  Team(
      name: "Optic",
      regionFlag: "flags/us.png",
      membersCount: 6,
      teamLogo: "orgPics/optic.jpeg"),
  Team(
      name: "NAVI",
      regionFlag: "flags/ukraine.webp",
      membersCount: 6,
      teamLogo: "orgPics/navi.png"),
  Team(
      name: "Fnatic",
      regionFlag: "flags/uk.png",
      membersCount: 5,
      teamLogo: "orgPics/fnatic.png"),
  Team(
      name: "PRX",
      regionFlag: "flags/singapore.png",
      membersCount: 6,
      teamLogo: "orgPics/Paper_Rex_logo.png"),
  Team(
      name: "Sentinels",
      regionFlag: "flags/us.png",
      membersCount: 6,
      teamLogo: "orgPics/sentinels.png"),
  Team(
      name: "Cloud 9",
      regionFlag: "flags/us.png",
      membersCount: 6,
      teamLogo: "orgPics/Cloud9.png"),
  Team(
      name: "DRX",
      regionFlag: "flags/sk.png",
      membersCount: 6,
      teamLogo: "orgPics/drx.png"),
  Team(
      name: "Zeta",
      regionFlag: "flags/jp.png",
      membersCount: 6,
      teamLogo: "orgPics/zeta.png"),
];

List<Team> teams2 = [
  Team(
      name: "Optic2",
      regionFlag: "flags/us.png",
      membersCount: 6,
      teamLogo: "orgPics/optic.jpeg"),
  Team(
      name: "NAVI2",
      regionFlag: "flags/ukraine.webp",
      membersCount: 6,
      teamLogo: "orgPics/navi.png"),
  Team(
      name: "Fnatic2",
      regionFlag: "flags/uk.png",
      membersCount: 5,
      teamLogo: "orgPics/fnatic.png"),
  Team(
      name: "PRX2",
      regionFlag: "flags/singapore.png",
      membersCount: 6,
      teamLogo: "orgPics/Paper_Rex_logo.png"),
  Team(
      name: "Sentinels2",
      regionFlag: "flags/us.png",
      membersCount: 6,
      teamLogo: "orgPics/sentinels.png"),
  Team(
      name: "Cloud 9_2",
      regionFlag: "flags/us.png",
      membersCount: 6,
      teamLogo: "orgPics/Cloud9.png"),
  Team(
      name: "DRX2",
      regionFlag: "flags/sk.png",
      membersCount: 6,
      teamLogo: "orgPics/drx.png"),
  Team(
      name: "Zeta2",
      regionFlag: "flags/jp.png",
      membersCount: 6,
      teamLogo: "orgPics/zeta.png"),
];
