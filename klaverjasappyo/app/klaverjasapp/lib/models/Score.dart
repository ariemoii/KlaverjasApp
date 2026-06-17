import 'package:klaverjasapp/models/RoemValue.dart';

class Score {
  int score;
  int roem;

  int get totalScore => score + roem;

  Score({this.score = 0, this.roem = 0});

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(roem: json['roem'], score: json['score']);
  }

  Map<String, dynamic> toJson() {
    return {'score': score, 'roem': roem};
  }

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
    this.score = score;
  }
}
