import 'package:flutter/material.dart';
import 'package:klaverjasapp/GameState/GameState.dart';
import 'package:klaverjasapp/GameState/SaveGameService.dart';
import 'package:klaverjasapp/widgets/ShowGameState.dart';
import 'package:provider/provider.dart';

class LoadGameScreen extends StatelessWidget {
  const LoadGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GameManager gameManager = context.watch<GameManager>();

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: gameManager.games
                .map((game) {
                  return ShowGameState(gameState: game);
                })
                .toList()
                .reversed
                .toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SaveGameService.resetGames();
              },
              child: Text("Remove Games"),
            ),
          ],
        ),
      ],
    );
  }
}
