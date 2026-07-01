import 'package:flutter/material.dart';
import 'package:klaverjasapp/GameState/GameState.dart';
import 'package:klaverjasapp/GameState/SaveGameService.dart';
import 'package:klaverjasapp/widgets/ShowGameState.dart';
import 'package:provider/provider.dart';

class LoadGameScreen extends StatelessWidget {
  const LoadGameScreen({super.key});

  Future<bool> _showConfirmDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Remove games"),
        content: const Text(
          "Are you sure you want to remove all saved games? This action cannot be undone.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("Remove"),
          ),
        ],
      ),
    );

    return result == true;
  }

  void _resetGames(GameManager gameManager) {
    SaveGameService.resetGames();
    gameManager.loadGames();
  }

  @override
  Widget build(BuildContext context) {
    final gameManager = context.watch<GameManager>();

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: gameManager.games
                .map((game) => ShowGameState(gameState: game))
                .toList()
                .reversed
                .toList(),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final confirmed = await _showConfirmDialog(context);

                    if (confirmed) {
                      _resetGames(gameManager);
                    }
                  },
                  child: const Text("Remove Games"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final bool confirmed = await _showConfirmDialog(context);

                    if (confirmed) {
                      await SaveGameService.deleteGame(gameManager.activeGame);
                      await gameManager.loadGames();
                    }
                  },
                  child: const Text("Remove selected game"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                gameManager.playNewGame();
                await SaveGameService.saveGame(gameManager.activeGame);
                await gameManager.loadGames();
              },
              child: const Text("New Game"),
            ),
          ],
        ),
      ],
    );
  }
}
