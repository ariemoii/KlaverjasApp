import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:klaverjasapp/GameState/GameState.dart';

class MetBiedenSwitch extends StatelessWidget {
  const MetBiedenSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final GameManager gameManager = context.watch<GameManager>();
    final GameState gameState = gameManager.activeGame;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Met Bieden'),
          ),
        ),
        const SizedBox(width: 16),
        Switch(
          value: gameState.metBieden,
          onChanged: (bool val) => gameManager.setBiedenAtActiveGame(val),
        ),
      ],
    );
  }
}
