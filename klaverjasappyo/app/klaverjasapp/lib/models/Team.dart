import 'package:flutter/cupertino.dart';

class Team {
  String firstTeammate;
  String secondTeammate;
  String teamName;
  Teams whatTeam;

  Team({
    this.firstTeammate = '',
    this.secondTeammate = '',
    this.teamName = '',
    this.whatTeam = Teams.noTeam,
  });
}

enum Teams { team1, team2, noTeam }

class TeamState extends ChangeNotifier {
  Team team1 = Team(whatTeam: Teams.team1, teamName: 'team1');
  Team team2 = Team(whatTeam: Teams.team2, teamName: 'team2');

  void editTeam1(Team team) {
    team1 = team;
    notifyListeners();
  }

  void editTeam2(Team team) {
    team2 = team;
    notifyListeners();
  }

  void editTeam1FirstTeammateName(String name) {
    team1.firstTeammate = name;
    notifyListeners();
  }

  void editTeam1SecondTeammateName(String name) {
    team1.secondTeammate = name;
    notifyListeners();
  }

  void editTeam2FirstTeammateName(String name) {
    team2.firstTeammate = name;
    notifyListeners();
  }

  void editTeam2SecondTeammateName(String name) {
    team2.secondTeammate = name;
    notifyListeners();
  }

  void editTeam1TeamName(String name) {
    team1.teamName = name;
    notifyListeners();
  }

  void editTeam2TeamName(String name) {
    team2.teamName = name;
    notifyListeners();
  }
}
