import 'package:flutter/material.dart';
import 'package:klaverjasapp/GameState/SaveGameService.dart';

import 'GameState.dart';

class GameManager extends ChangeNotifier {
  List<GameState> _games = [];

  Future<void> loadGames() async {
    _games = await SaveGameService.loadAllGames();
    notifyListeners();
  }

  List<GameState> get games => _games;
}
