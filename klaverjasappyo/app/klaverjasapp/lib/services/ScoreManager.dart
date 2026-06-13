import 'package:klaverjasapp/models/Round.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/models/RoemValue.dart';
import 'dart:collection';

class Scoremanager {
  final List<Round> _rounds = [];
  Team team1 = Team(whatTeam: Teams.team1, teamName: 'Team 1');
  Team team2 = Team(whatTeam: Teams.team2, teamName: 'Team 2');

  Round? _selectedRound;

  Round? get selectedRound => _selectedRound;

  UnmodifiableListView<Round> get rounds => UnmodifiableListView(_rounds);

  String get team1Name => team1.teamName;
  String get team2Name => team2.teamName;

  int get team1Score =>
      _rounds.fold(0, (sum, round) => sum + round.team1TotalScore);
  int get team2Score =>
      _rounds.fold(0, (sum, round) => sum + round.team2TotalScore);

  void addRound(Teams playingTeam) {
    _rounds.add(Round(roundNumber: _rounds.length, playingTeam: playingTeam));
  }

  void selectRound(Round round) {
    if (_selectedRound == round || round.isFinalised) {
      _selectedRound = null;
    } else {
      _selectedRound = round;
    }
  }

  void editTeamName(Teams whatTeam, String name) {
    if (whatTeam == Teams.team1) {
      team1.editTeamName(name);
    } else if (whatTeam == Teams.team2) {
      team2.editTeamName(name);
    }
  }

  void editFirstTeammateName(Teams whatTeam, String name) {
    if (whatTeam == Teams.team1) {
      team1.editFirstTeammateName(name);
    } else if (whatTeam == Teams.team2) {
      team2.editFirstTeammateName(name);
    }
  }

  void editSecondTeammateName(Teams whatTeam, String name) {
    if (whatTeam == Teams.team1) {
      team1.editSecondTeammateName(name);
    } else if (whatTeam == Teams.team2) {
      team2.editSecondTeammateName(name);
    }
  }

  void addRoem(Teams whatTeam, RoemValue roem) {
    selectedRound?.addRoem(whatTeam, roem);
  }

  void removeRoem(Teams whatTeam, RoemValue roem) {
    selectedRound?.removeRoem(whatTeam, roem);
  }

  void finalizeRound(Teams countingTeam, int score, bool metBieden) {
    Round? round = selectedRound;
    if (round == null) return;
    round.setFinalised();

    if (_isNat(metBieden, countingTeam, score, round)) {
      print("${round.playingTeam} is nat!");
      round.natGespeeld(round.playingTeam);
    } else {
      round.nietNatGespeeld(score, countingTeam);
    }
  }

  bool _isNat(bool metBieden, Teams countingTeam, int score, Round round) {
    score = (countingTeam == round.playingTeam) ? score : maxScore - score;
    int behaaldeRoem = (countingTeam == Teams.team1)
        ? round.team1Roem
        : round.team2Roem;

    if (metBieden) {
      //roem telt niet mee
      if (score < round.biddedScore) {
        return true;
      }
    } else {
      //roem telt mee
      if (score + behaaldeRoem / 2 < round.biddedScore) {
        return true;
      }
    }
    return false;
  }
}
