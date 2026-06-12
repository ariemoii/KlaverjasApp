import 'package:klaverjasapp/models/Score.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/models/RoemValue.dart';

const _maxScore = 162;

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

  int get team1Score => _team1Score.totalScore;
  int get team2Score => _team2Score.totalScore;
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

  void removeRoem(Teams whatTeam, RoemValue roem) {
    if (whatTeam == Teams.team1) {
      _team1Score.removeRoem(roem);
    } else if (whatTeam == Teams.team2) {
      _team2Score.removeRoem(roem);
    }
  }

  void finalizeRound(Teams countingTeam, int score) {
    _isFinalised = true;
    score = score.clamp(0, _maxScore);
    final countingScore = (countingTeam == Teams.team1)
        ? _team1Score
        : _team2Score;
    final otherScore = (countingTeam == Teams.team1)
        ? _team2Score
        : _team1Score;

    bool isNat =
        (playingTeam == countingTeam &&
        (score + countingScore.roem / 2) < biddedScore);

    if (isNat) {
      otherScore.roem += countingScore.roem;
      otherScore.score = _maxScore;

      countingScore.roem = 0;
      countingScore.score = 0;
      return;
    }

    countingScore.score = score;
    otherScore.score = _maxScore - score;
  }
}
