import 'package:klaverjasapp/models/RoemValue.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:flutter/material.dart';
import 'package:klaverjasapp/services/ScoreManager.dart';
import 'package:klaverjasapp/models/Round.dart';
import 'dart:collection';

class GameState extends ChangeNotifier {
  final Scoremanager _scoreManager = Scoremanager();

  String get team1Name => _scoreManager.team1Name;
  String get team2Name => _scoreManager.team2Name;

  int get team1Score => _scoreManager.team1Score;
  int get team2Score => _scoreManager.team2Score;

  UnmodifiableListView<Round> get rounds => _scoreManager.rounds;

  Round? get selectedRound => _scoreManager.selectedRound;

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

  void addRound(Teams playingTeam) {
    _scoreManager.addRound(playingTeam);
    notifyListeners();
  }

  void selectRound(Round round) {
    _scoreManager.selectRound(round);
    notifyListeners();
  }

  void finalizeRound(Teams countingTeam, int score) {
    _scoreManager.finalizeRound(countingTeam, score);
    notifyListeners();
  }
}
