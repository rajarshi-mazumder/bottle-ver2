class Team {
  String? name;
  int? membersCount;
  String? regionFlag;
  List<dynamic>? members;
  String? teamLogo;

  Team({this.name, this.membersCount, this.regionFlag, this.teamLogo});

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
      membersCount: map['membersCount'],
      regionFlag: map['regionFlag'],
      teamLogo: map['teamLogo'],
    );
  }
}
