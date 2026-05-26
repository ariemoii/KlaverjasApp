import 'Team.dart';
import 'RoemValue.dart';

class RoundScore {
  int _team1score = 0;
  int _team2score = 0;

  void addRoem(Team team, RoemValue roem) {
    if (team == Team.team1) {
      _team1score += roem.value;
    } else {
      _team2score += roem.value;
    }
  }

  void removeRoem(Team team, RoemValue roem) {
    if (team == Team.team1) {
      _team1score -= roem.value;
    } else {
      _team2score -= roem.value;
    }
    if (_team1score < 0) _team1score = 0;
    if (_team2score < 0) _team2score = 0;
  }

}