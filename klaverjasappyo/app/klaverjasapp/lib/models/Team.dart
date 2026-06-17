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

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      firstTeammate: json['firstTeammate'],
      secondTeammate: json['secondTeammate'],
      teamName: json['teamName'],
      whatTeam: Teams.values.byName(json['whatTeam']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstTeammate': firstTeammate,
      'secondTeammate': secondTeammate,
      'teamName': teamName,
      'whatTeam': whatTeam.name,
    };
  }

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
