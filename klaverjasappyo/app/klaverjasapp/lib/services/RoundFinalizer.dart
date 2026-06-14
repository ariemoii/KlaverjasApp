import 'package:klaverjasapp/models/Round.dart';
import 'package:klaverjasapp/models/Team.dart';

class RoundFinalizer {
  void finalizeRound(
    Teams countingTeam,
    int score,
    bool metBieden,
    Round? selectedRound,
  ) {
    Round? round = selectedRound;
    if (round == null) return;
    round.setFinalised();

    if (_isNat(metBieden, countingTeam, score, round)) {
      print("${round.playingTeam} is nat!");
      round.natGespeeld(round.playingTeam);
    } else {
      round.nietNatGespeeld(score, countingTeam);
    }
  }

  bool _isNat(bool metBieden, Teams countingTeam, int score, Round round) {
    score = (countingTeam == round.playingTeam) ? score : maxScore - score;
    int behaaldeRoem = (countingTeam == Teams.team1)
        ? round.team1Roem
        : round.team2Roem;

    if (metBieden) {
      //roem telt niet mee
      if (score < round.biddedScore) {
        return true;
      }
    } else {
      //roem telt mee
      if (score + behaaldeRoem / 2 < round.biddedScore) {
        return true;
      }
    }
    return false;
  }
}
