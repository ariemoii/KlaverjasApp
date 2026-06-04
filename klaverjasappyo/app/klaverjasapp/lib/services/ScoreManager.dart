import 'package:klaverjasapp/models/Round.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/models/RoemValue.dart';

class Scoremanager {
  int numberOfRounds = 0;
  int _currentRound = 0;
  List<Round> rounds = [];
  Team team1 = Team(whatTeam: Teams.team1, teamName: 'Team 1');
  Team team2 = Team(whatTeam: Teams.team2, teamName: 'Team 2');

  Round get currentRound => rounds[_currentRound];
  String get team1Name => team1.teamName;
  String get team2Name => team2.teamName;

  int get team1Score => rounds.fold(0, (sum, round) => sum + round.team1Score);
  int get team2Score => rounds.fold(0, (sum, round) => sum + round.team2Score);

  void nextRound() {
    if (_currentRound == numberOfRounds) {
      rounds.add(Round());
      numberOfRounds++;
    } else {
      _currentRound++;
    }
  }

  void previousRound() {
    if (_currentRound > 0) {
      _currentRound--;
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
    currentRound.addRoem(whatTeam, roem);
  }

  void removeRoem(Teams whatTeam, RoemValue roem) {
    currentRound.removeRoem(whatTeam, roem);
  }
}
