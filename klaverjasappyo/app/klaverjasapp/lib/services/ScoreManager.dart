import 'package:klaverjasapp/models/Round.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/models/RoemValue.dart';
import 'dart:collection';

class Scoremanager {
  List<Round> _rounds = [Round(roundNumber: 0)];
  Team team1 = Team(whatTeam: Teams.team1, teamName: 'Team 1');
  Team team2 = Team(whatTeam: Teams.team2, teamName: 'Team 2');

  Round? _selectedRound;

  Round? get selectedRound => _selectedRound;

  UnmodifiableListView<Round> get rounds => UnmodifiableListView(_rounds);

  String get team1Name => team1.teamName;
  String get team2Name => team2.teamName;

  int get team1Score => _rounds.fold(0, (sum, round) => sum + round.team1Score);
  int get team2Score => _rounds.fold(0, (sum, round) => sum + round.team2Score);

  void addRound() {
    _rounds.add(Round(roundNumber: _rounds.length));
  }

  void selectRound(Round round) {
    if (_selectedRound == round) {
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
}
