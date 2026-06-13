import 'package:klaverjasapp/models/Score.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/models/RoemValue.dart';

const maxScore = 162;

class Round {
  final Score _team1Score = Score();
  final Score _team2Score = Score();

  final int roundNumber;
  final Teams playingTeam;
  bool _isFinalised = false;
  int biddedScore;

  Round({
    required this.roundNumber,
    this.biddedScore = 82,
    required this.playingTeam,
  });

  int get team1TotalScore => _team1Score.totalScore;
  int get team2TotalScore => _team2Score.totalScore;

  int get team1Score => _team1Score.score;
  int get team2Score => _team2Score.score;

  bool get isFinalised => _isFinalised;

  int get team1Roem => _team1Score.roem;
  int get team2Roem => _team2Score.roem;

  void addRoem(Teams whatTeam, RoemValue roem) {
    if (whatTeam == Teams.team1) {
      _team1Score.addRoem(roem);
    } else if (whatTeam == Teams.team2) {
      _team2Score.addRoem(roem);
    }
  }

  void setFinalised() {
    _isFinalised = true;
  }

  void removeRoem(Teams whatTeam, RoemValue roem) {
    if (whatTeam == Teams.team1) {
      _team1Score.removeRoem(roem);
    } else if (whatTeam == Teams.team2) {
      _team2Score.removeRoem(roem);
    }
  }

  void natGespeeld(Teams natTeam) {
    Score natScore = (natTeam == Teams.team1) ? _team1Score : _team2Score;
    Score other = (natTeam == Teams.team1) ? _team2Score : _team1Score;

    other.score = maxScore;
    other.roem += natScore.roem;

    natScore.roem = 0;
    natScore.score = 0;
  }

  void nietNatGespeeld(int score, Teams countingTeam) {
    Score countingScore = (playingTeam == Teams.team1)
        ? _team1Score
        : _team2Score;
    Score other = (playingTeam == Teams.team1) ? _team2Score : _team1Score;

    countingScore.score = score;
    other.score = maxScore - score;
  }
}
