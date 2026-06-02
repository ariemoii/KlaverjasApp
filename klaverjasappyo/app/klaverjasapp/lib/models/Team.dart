import 'package:klaverjasapp/models/RoemValue.dart';

import 'dart:developer';

class Team {
  String firstTeammate;
  String secondTeammate;
  String teamName;
  Teams whatTeam;
  int _score;
  int _roem;

  Team({
    this.firstTeammate = '',
    this.secondTeammate = '',
    this.teamName = '',
    required this.whatTeam,
    score = 0,
    roem = 0,
  }) : _roem = roem,
       _score = score;

  void addRoem(RoemValue roem) {
    _roem += roem.value;
  }

  void removeRoem(RoemValue roem) {
    _roem += roem.value;
  }

  void editTeamName(String name) {
    teamName = name;
  }

  void editFirstTeammateName(String name) {
    firstTeammate = name;
  }

  void editSecondTeammateName(String name) {
    secondTeammate = name;
  }
}

enum Teams { team1, team2, noTeam }
