import 'package:klaverjasapp/models/RoemValue.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:flutter/material.dart';
import '../models/Round.dart';

class GameState extends ChangeNotifier {
  final Round round = Round(
    team1: Team(whatTeam: Teams.team1, teamName: "team1"),
    team2: Team(whatTeam: Teams.team2, teamName: "team2"),
  );

  get team1Name => round.team1Name;
  get team2Name => round.team2Name;

  void addRoem(Teams whatTeam, RoemValue roem) {
    round.addRoem(whatTeam, roem);
    notifyListeners();
  }

  void editFirstTeammateName(Teams whatTeam, String name) {
    round.editFirstTeammateName(whatTeam, name);
    notifyListeners();
  }

  void editSecondTeammateName(Teams whatTeam, String name) {
    round.editFirstTeammateName(whatTeam, name);
    notifyListeners();
  }

  void editTeamName(Teams whatTeam, String name) {
    round.editTeamName(whatTeam, name);
    notifyListeners();
  }
}
