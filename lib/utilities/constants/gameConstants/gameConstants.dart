enum GameTitles {
  valorant,
  counterStrike,
  apexLegends,
  // Add more games as needed
}

// Extension on GameTitles to get custom string values
extension GameTitleExtension on GameTitles {
  String get name {
    switch (this) {
      case GameTitles.valorant:
        return 'VALORANT';
      case GameTitles.counterStrike:
        return 'CS2';
      case GameTitles.apexLegends:
        return 'APEX';
      // Add more cases as needed
      default:
        return 'Unknown';
    }
  }
}
