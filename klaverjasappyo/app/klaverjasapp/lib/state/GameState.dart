import 'package:klaverjasapp/models/RoemValue.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:flutter/material.dart';
import 'package:klaverjasapp/services/RoundFinalizer.dart';
import 'package:klaverjasapp/models/Round.dart';
import 'dart:collection';

class GameState extends ChangeNotifier {
  late RoundFinalizer _roundFinalizer;

  bool _metBieden = false;
  bool _hasStarted = false;

  final List<Round> _rounds = [];
  Team team1 = Team(whatTeam: Teams.team1, teamName: 'Team 1');
  Team team2 = Team(whatTeam: Teams.team2, teamName: 'Team 2');

  Round? _selectedRound;

  Round? get selectedRound => _selectedRound;

  UnmodifiableListView<Round> get rounds => UnmodifiableListView(_rounds);

  String get team1Name => team1.teamName;
  String get team2Name => team2.teamName;

  bool get metBieden => _metBieden;
  bool get hasStarted => _hasStarted;

  int get team1Score =>
      _rounds.fold(0, (sum, round) => sum + round.team1TotalScore);
  int get team2Score =>
      _rounds.fold(0, (sum, round) => sum + round.team2TotalScore);

  void startGame() {
    _roundFinalizer = RoundFinalizer.create(metBieden);
    RoemConfig.init(metBieden);
    _hasStarted = true;
  }

  void removeGame() {
    _rounds.clear();
  }

  void addRound(Teams playingTeam) {
    _rounds.add(Round(roundNumber: _rounds.length, playingTeam: playingTeam));
    notifyListeners();
  }

  void removeSelectedRound() {
    if (selectedRound == null) return;
    _rounds.remove(selectedRound);
    notifyListeners();
  }

  void selectRound(Round round) {
    if (_selectedRound == round) {
      _selectedRound = null;
    } else {
      _selectedRound = round;
    }
    notifyListeners();
  }

  void editTeamName(Teams whatTeam, String name) {
    if (whatTeam == Teams.team1) {
      team1.editTeamName(name);
    } else if (whatTeam == Teams.team2) {
      team2.editTeamName(name);
    }
    notifyListeners();
  }

  void editFirstTeammateName(Teams whatTeam, String name) {
    if (whatTeam == Teams.team1) {
      team1.editFirstTeammateName(name);
    } else if (whatTeam == Teams.team2) {
      team2.editFirstTeammateName(name);
    }
    notifyListeners();
  }

  void editSecondTeammateName(Teams whatTeam, String name) {
    if (whatTeam == Teams.team1) {
      team1.editSecondTeammateName(name);
    } else if (whatTeam == Teams.team2) {
      team2.editSecondTeammateName(name);
    }
    notifyListeners();
  }

  void addRoem(Teams whatTeam, RoemValue roem) {
    selectedRound?.addRoem(whatTeam, roem);
    notifyListeners();
  }

  void removeRoem(Teams whatTeam, RoemValue roem) {
    selectedRound?.removeRoem(whatTeam, roem);
    notifyListeners();
  }

  void finalizeSelectedRound(Teams countingTeam, int score) {
    _roundFinalizer.finalizeRound(countingTeam, score, selectedRound);
    notifyListeners();
  }

  void setBieden(bool val) {
    _metBieden = val;
    notifyListeners();
  }
}
