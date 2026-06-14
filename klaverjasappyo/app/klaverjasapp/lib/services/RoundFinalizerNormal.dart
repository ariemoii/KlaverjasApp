import 'package:klaverjasapp/models/Round.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'RoundFinalizer.dart';

class RoundFinalizerNormal extends RoundFinalizer {
  @override
  final int maxScore = 162;

  @override
  bool isNat(Teams countingTeam, int score, Round round) {
    score = (countingTeam == round.playingTeam) ? score : maxScore - score;
    int behaaldeRoem = (countingTeam == Teams.team1)
        ? round.team1Roem
        : round.team2Roem;

    if ((score + behaaldeRoem / 2) < round.biddedScore) {
      return true;
    }
    return false;
  }
}
