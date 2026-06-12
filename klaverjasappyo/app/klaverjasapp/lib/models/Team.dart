class Team {
  String firstTeammate;
  String secondTeammate;
  String teamName;
  Teams whatTeam;

  Team({
    this.firstTeammate = '',
    this.secondTeammate = '',
    this.teamName = '',
    required this.whatTeam,
  });

  void editTeamName(String name) {
    teamName = name;
  }

  void editFirstTeammateName(String name) {
    firstTeammate = name;
  }

  void editSecondTeammateName(String name) {
    secondTeammate = name;
  }
}

enum Teams { team1, team2, noTeam }
