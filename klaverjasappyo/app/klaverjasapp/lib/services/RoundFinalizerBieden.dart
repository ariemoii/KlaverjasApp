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
}
