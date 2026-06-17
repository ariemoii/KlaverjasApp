import 'package:flutter/material.dart';
import 'package:klaverjasapp/GameState/GameState.dart';
import 'package:provider/provider.dart';

class ShowGameState extends StatelessWidget {
  final GameState gameState;

  const ShowGameState({super.key, required this.gameState});

  @override
  Widget build(BuildContext context) {
    GameManager gameManager = context.watch<GameManager>();

    final bool isSelected = gameManager.activeGame == gameState;

    final color;
    if (isSelected) {
      color = Colors.blueGrey;
    } else {
      color = Colors.white;
    }

    return InkWell(
      onTap: () {
        gameManager.setActiveGame(gameState);
      },
      child: Card(
        color: color,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Met bieden
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Met bieden',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    gameState.metBieden ? 'Yes' : 'No',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              // Teams
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(gameState.team1Name),
                  Text(gameState.team2Name),
                ],
              ),

              const SizedBox(height: 6),

              // Scores
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Score: ${gameState.team1Score}'),
                  Text('Score: ${gameState.team2Score}'),
                ],
              ),

              const SizedBox(height: 6),

              // Rounds
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Rounds',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text('${gameState.numRounds}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
