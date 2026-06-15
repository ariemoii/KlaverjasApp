import 'package:flutter/foundation.dart';
import 'package:klaverjasapp/models/Round.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/services/RoundFinalizerBieden.dart';
import 'package:klaverjasapp/services/RoundFinalizerNormal.dart';

abstract class RoundFinalizer {
  int get maxScore;

  @nonVirtual
  void finalizeRound(Teams countingTeam, int score, Round? selectedRound) {
    Round? round = selectedRound;
    if (round == null) return;
    round.setFinalised();

    if (isNat(countingTeam, score, round)) {
      natGespeeld(round.playingTeam, round);
    } else {
      nietNatGespeeld(countingTeam, round, score);
    }
  }

  @protected
  bool isNat(Teams countingTeam, int score, Round selectedRound);

  @nonVirtual
  void natGespeeld(Teams natTeam, Round round) {
    Teams otherTeam = (natTeam == Teams.team1) ? Teams.team2 : Teams.team1;
    round.transferRoem(otherTeam);
    round.setScore(otherTeam, maxScore);
    round.setScore(natTeam, 0);
  }

  @protected
  void nietNatGespeeld(Teams countingTeam, Round round, int score);

  static RoundFinalizer create(bool metBieden) {
    return metBieden ? RoundFinalizerBieden() : RoundFinalizerNormal();
  }
}
