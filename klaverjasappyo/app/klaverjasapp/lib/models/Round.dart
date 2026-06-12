import 'package:klaverjasapp/models/Score.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/models/RoemValue.dart';

class Round {
  Score _team1Score = Score();
  Score _team2Score = Score();

  final int roundNumber;
  final Teams playingTeam;
  int biddedScore;

  Round({
    required this.roundNumber,
    this.biddedScore = 82,
    required this.playingTeam,
  });

  int get team1Score => _team1Score.totalScore;
  int get team2Score => _team2Score.totalScore;

  int get team1Roem => _team1Score.roem;
  int get team2Roem => _team2Score.roem;

  void addRoem(Teams whatTeam, RoemValue roem) {
    if (whatTeam == Teams.team1) {
      _team1Score.addRoem(roem);
    } else if (whatTeam == Teams.team2) {
      _team2Score.addRoem(roem);
    }
  }

  void removeRoem(Teams whatTeam, RoemValue roem) {
    if (whatTeam == Teams.team1) {
      _team1Score.removeRoem(roem);
    } else if (whatTeam == Teams.team2) {
      _team2Score.removeRoem(roem);
    }
  }
}
