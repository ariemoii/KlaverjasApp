import 'package:klaverjasapp/models/Score.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/models/RoemValue.dart';

class Round {
  final Score _team1Score;
  final Score _team2Score;

  final int roundNumber;
  final Teams playingTeam;
  bool _isFinalised = false;
  int biddedScore;

  Round({
    required this.roundNumber,
    this.biddedScore = 82,
    required this.playingTeam,
  }) : _team1Score = Score(),
       _team2Score = Score();

  Round._internal({
    required Score team1Score,
    required Score team2Score,
    required this.roundNumber,
    required this.playingTeam,
    required bool isFinalised,
    required this.biddedScore,
  }) : _team1Score = team1Score,
       _team2Score = team2Score,
       _isFinalised = isFinalised;

  factory Round.fromJson(Map<String, dynamic> json) {
    return Round._internal(
      team1Score: Score.fromJson(json['_team1Score']),
      team2Score: Score.fromJson(json['_team2Score']),
      roundNumber: json['roundNumber'],
      playingTeam: Teams.values.byName(json['playingTeam']),
      isFinalised: json['_isFinalised'],
      biddedScore: json['biddedScore'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_team1Score': _team1Score.toJson(),
      '_team2Score': _team2Score.toJson(),
      'roundNumber': roundNumber,
      'playingTeam': playingTeam.name,
      '_isFinalised': _isFinalised,
      'biddedScore': biddedScore,
    };
  }

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

  void setScore(Teams whatTeam, int score) {
    Score scoreT = (whatTeam == Teams.team1) ? _team1Score : _team2Score;
    scoreT.setScore(score);
  }

  void transferRoem(Teams targetTeam) {
    Score targetScore = (targetTeam == Teams.team1) ? _team1Score : _team2Score;
    Score other = (targetTeam == Teams.team1) ? _team2Score : _team1Score;
    targetScore.roem += other.roem;
    other.roem = 0;
  }
}
