import 'package:klaverjasapp/models/Team.dart';
import 'dart:developer';
import 'RoemValue.dart';

class Round {
  Team _team1;
  Team _team2;

  get team1Name => _team1.teamName;
  get team2Name => _team2.teamName;

  Round({required Team team1, required Team team2})
    : _team1 = team1,
      _team2 = team2;

  void addRoem(Teams whatTeam, RoemValue roem) {
    switch (whatTeam) {
      case Teams.team1:
        _team1.addRoem(roem);
        break;
      case Teams.team2:
        _team2.addRoem(roem);
        break;
      default:
        log("got noTeam in addRoem file: Round.dart");
    }
  }

  void removeRoem(Teams whatTeam, RoemValue roem) {
    switch (whatTeam) {
      case Teams.team1:
        _team1.removeRoem(roem);
        break;
      case Teams.team2:
        _team2.removeRoem(roem);
        break;
      default:
        log("got noTeam in removeRoem file: Round.dart");
    }
  }

  void editFirstTeammateName(Teams whatTeam, String name) {
    switch (whatTeam) {
      case Teams.team1:
        _team1.editFirstTeammateName(name);
        break;
      case Teams.team2:
        _team2.editSecondTeammateName(name);
        break;
      default:
        log("got noTeam in editFirstTeammateName file: Round.dart");
    }
  }

  void editSecondTeammateName(Teams whatTeam, String name) {
    switch (whatTeam) {
      case Teams.team1:
        _team1.editFirstTeammateName(name);
        break;
      case Teams.team2:
        _team2.editSecondTeammateName(name);
        break;
      default:
        log("got noTeamm in editSecondTeammateName file: Round.dart");
    }
  }

  void editTeamName(Teams whatTeam, String name) {
    switch (whatTeam) {
      case Teams.team1:
        _team1.editTeamName(name);
        break;
      case Teams.team2:
        _team2.editTeamName(name);
        break;
      default:
        log("got noTeam in editTeamName file: Round.dart");
    }
  }
}
