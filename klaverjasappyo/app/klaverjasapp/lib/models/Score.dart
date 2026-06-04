import 'package:klaverjasapp/models/RoemValue.dart';

class Score {
  int _score;
  int _roem;

  int get totalScore => _score + _roem;

  Score({score = 0, roem = 0}) : _score = score, _roem = roem;

  void addRoem(RoemValue roem) {
    _roem += roem.value;
  }

  void removeRoem(RoemValue roem) {
    _roem -= roem.value;
  }
}
