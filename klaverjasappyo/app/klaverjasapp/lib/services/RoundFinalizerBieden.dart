import 'package:klaverjasapp/models/Round.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'RoundFinalizer.dart';

class RoundFinalizerBieden extends RoundFinalizer {
  @override
  final int maxScore = 16;

  @override
  bool isNat(Teams countingTeam, int score, Round round) {
    score = (countingTeam == round.playingTeam) ? score : 162 - score;
    if ((score) < round.biddedScore) {
      return true;
    }
    return false;
  }

  @override
  void nietNatGespeeld(Teams countingTeam, Round round, int score) {
    Teams otherTeam = (countingTeam == Teams.team1) ? Teams.team2 : Teams.team1;
    round.setScore(countingTeam, _afgerond(score));
    round.setScore(otherTeam, maxScore - _afgerond(score));
  }

  int _afgerond(int score) {
    int lastDig = score % 10;
    lastDig = (lastDig >= 7) ? 1 : 0;
    return (score ~/ 10 + lastDig);
  }
}
