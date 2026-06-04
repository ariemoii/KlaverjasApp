import 'package:klaverjasapp/models/RoemValue.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:flutter/material.dart';
import 'package:klaverjasapp/services/ScoreManager.dart';

class GameState extends ChangeNotifier {
  final Scoremanager _scoreManager = Scoremanager();

  get team1Name => _scoreManager.team1Name;
  get team2Name => _scoreManager.team2Name;

  void addRoem(Teams whatTeam, RoemValue roem) {
    _scoreManager.addRoem(whatTeam, roem);
    notifyListeners();
  }

  void removeRoem(Teams whatTeam, RoemValue roem) {
    _scoreManager.removeRoem(whatTeam, roem);
    notifyListeners();
  }

  void editFirstTeammateName(Teams whatTeam, String name) {
    _scoreManager.editFirstTeammateName(whatTeam, name);
    notifyListeners();
  }

  void editSecondTeammateName(Teams whatTeam, String name) {
    _scoreManager.editFirstTeammateName(whatTeam, name);
    notifyListeners();
  }

  void editTeamName(Teams whatTeam, String name) {
    _scoreManager.editTeamName(whatTeam, name);
    notifyListeners();
  }
}
