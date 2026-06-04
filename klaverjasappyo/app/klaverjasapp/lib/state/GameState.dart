import 'package:klaverjasapp/models/RoemValue.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:flutter/material.dart';
import 'package:klaverjasapp/services/ScoreManager.dart';

class GameState extends ChangeNotifier {
  final Scoremanager _scoreManager = Scoremanager();

  String get team1Name => _scoreManager.team1Name;
  String get team2Name => _scoreManager.team2Name;

  int get team1Score => _scoreManager.team1Score;
  int get team2Score => _scoreManager.team2Score;

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
