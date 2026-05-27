import 'package:klaverjasapp/models/Round.dart';

class ScoreManager {
  int _team1score = 0;
  int _team2score = 0;

  int get team1score => _team1score;
  int get team2score => _team2score;

  final List<RoundScore> rounds = [];

  void playRound(RoundScore round) {
    Result result = round.calculateAndSetFinalScores();
    _team1score += result.team1score;
    _team2score += result.team1score;
    rounds.add(round);
  }

  void undoLast() {
    if (rounds.isEmpty) return;
    _team1score -= rounds.last.team1score;
    _team2score -= rounds.last.team2score;
    rounds.removeLast();
  }

}
