class Player {
  String name;
  String? nationality;
  String? twitchLink;
  String? twitterLink;
  String? mainAgent;

  Player({
    required this.name,
    this.nationality,
    this.twitchLink,
    this.twitterLink,
    this.mainAgent,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nationality': nationality,
      'twitchLink': twitchLink,
      'twitterLink': twitterLink,
      'mainAgent': mainAgent,
    };
  }

  static Player fromMap(Map<String, dynamic> map) {
    return Player(
      name: map['name'],
      nationality: map['nationality'],
      twitchLink: map['twitchLink'],
      twitterLink: map['twitterLink'],
      mainAgent: map['mainAgent'],
    );
  }
}
