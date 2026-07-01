import 'package:klaverjasapp/models/RoemValue.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/services/RoundFinalizer.dart';
import 'package:klaverjasapp/models/Round.dart';
import 'dart:collection';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:klaverjasapp/GameState/SaveGameService.dart';

class GameState {
  final String id;
  late RoundFinalizer _roundFinalizer;
  bool _metBieden = false;
  bool _hasStarted = false;
  final List<Round> _rounds;
  Team team1;
  Team team2;
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

  int get numRounds => _rounds.length;

  GameState({
    String? id,
    Team? team1,
    Team? team2,
    bool? metBieden,
    bool? hasStarted,
    List<Round>? rounds,
  }) : id = id ?? const Uuid().v4(),
       team1 = team1 ?? Team(whatTeam: Teams.team2, teamName: 'Wij'),
       team2 = team2 ?? Team(whatTeam: Teams.team2, teamName: 'Zij'),
       _metBieden = metBieden ?? false,
       _hasStarted = hasStarted ?? false,
       _rounds = rounds ?? [];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'team1': team1.toJson(),
      'team2': team2.toJson(),
      '_metBieden': _metBieden,
      '_hasStarted': _hasStarted,
      '_rounds': _rounds.map((r) => r.toJson()).toList(),
    };
  }

  factory GameState.fromJson(Map<String, dynamic> json) {
    return GameState(
      id: json['id'],
      team1: Team.fromJson(json['team1']),
      team2: Team.fromJson(json['team2']),
      metBieden: json['_metBieden'],
      hasStarted: json['hasStarted'],
      rounds: (json['_rounds'] as List).map((e) => Round.fromJson(e)).toList(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GameState && other.id == id;

  @override
  int get hashCode => id.hashCode;

  void startGame() {
    _roundFinalizer = RoundFinalizer.create(metBieden);
    RoemConfig.init(metBieden);
    _hasStarted = true;
  }
}

class GameManager extends ChangeNotifier {
  List<GameState> _games = [];
  GameState _activeGame = GameState();

  List<GameState> get games => _games;
  GameState get activeGame => _activeGame;

  void playNewGame() {
    GameState newGame = GameState();
    games.add(newGame);
  }

  Future<void> loadGames() async {
    _games = await SaveGameService.loadAllGames();
    notifyListeners();
  }

  void setActiveGame(GameState gameState) {
    if (activeGame == gameState) {
      _activeGame = GameState();
    } else {
      _activeGame = gameState;
    }
    notifyListeners();
  }

  void addRound(Teams playingTeam, {int? biddedScore}) {
    if (biddedScore == null) {
      activeGame._rounds.add(
        Round(roundNumber: activeGame.numRounds + 1, playingTeam: playingTeam),
      );
    } else {
      activeGame._rounds.add(
        Round(
          roundNumber: activeGame.numRounds + 1,
          playingTeam: playingTeam,
          biddedScore: biddedScore,
        ),
      );
    }
    notifyListeners();
  }

  void removeSelectedRoundAtActiveGame() {
    if (activeGame.selectedRound == null) return;
    activeGame._rounds.remove(activeGame.selectedRound);
    notifyListeners();
  }

  void selectRoundAtActiveGame(Round round) {
    if (activeGame.selectedRound == round) {
      activeGame._selectedRound = null;
    } else {
      activeGame._selectedRound = round;
    }
    notifyListeners();
  }

  void editTeamNameAtActiveGame(Teams whatTeam, String name) {
    if (whatTeam == Teams.team1) {
      activeGame.team1.editTeamName(name);
    } else if (whatTeam == Teams.team2) {
      activeGame.team2.editTeamName(name);
    }
    notifyListeners();
  }

  void editFirstTeammateNameAtActiveGame(Teams whatTeam, String name) {
    if (whatTeam == Teams.team1) {
      activeGame.team1.editFirstTeammateName(name);
    } else if (whatTeam == Teams.team2) {
      activeGame.team2.editFirstTeammateName(name);
    }
    notifyListeners();
  }

  void editSecondTeammateNameAtActiveGame(Teams whatTeam, String name) {
    if (whatTeam == Teams.team1) {
      activeGame.team1.editSecondTeammateName(name);
    } else if (whatTeam == Teams.team2) {
      activeGame.team2.editSecondTeammateName(name);
    }
    notifyListeners();
  }

  void addRoemAtActiveGame(Teams whatTeam, RoemValue roem) {
    activeGame.selectedRound?.addRoem(whatTeam, roem);
    notifyListeners();
  }

  void removeRoemAtActiveGame(Teams whatTeam, RoemValue roem) {
    activeGame.selectedRound?.removeRoem(whatTeam, roem);
    notifyListeners();
  }

  void finalizeSelectedRoundAtActiveGame(Teams countingTeam, int score) {
    activeGame._roundFinalizer.finalizeRound(
      countingTeam,
      score,
      activeGame.selectedRound,
    );
    notifyListeners();
  }

  void setBiedenAtActiveGame(bool val) {
    activeGame._metBieden = val;
    notifyListeners();
  }
}
