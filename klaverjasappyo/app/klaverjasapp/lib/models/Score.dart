import 'package:klaverjasapp/models/RoemValue.dart';

class Score {
  int score;
  int roem;

  int get totalScore => score + roem;

  Score({this.score = 0, this.roem = 0});

  void addRoem(RoemValue roemVal) {
    roem += roemVal.value;
  }

  void removeRoem(RoemValue roemVal) {
    roem -= roemVal.value;
    if (roem < 0) {
      roem = 0;
    }
  }

  void setScore(int score) {
    score = score;
  }
}
