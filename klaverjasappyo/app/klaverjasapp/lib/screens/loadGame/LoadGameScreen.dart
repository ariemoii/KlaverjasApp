import 'package:flutter/material.dart';
import 'package:klaverjasapp/GameState/GameState.dart';
import 'package:klaverjasapp/widgets/ShowGameState.dart';
import 'package:provider/provider.dart';

class LoadGameScreen extends StatelessWidget {
  const LoadGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GameManager gameManager = context.watch<GameManager>();
    gameManager.loadGames();

    return ListView(
      children: gameManager.games.map((game) {
        return ShowGameState(gameState: game);
      }).toList(),
    );
  }
}
