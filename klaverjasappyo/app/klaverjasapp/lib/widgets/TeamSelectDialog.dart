import 'package:flutter/material.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/GameState/GameState.dart';
import 'package:provider/provider.dart';

Future<Teams?> showTeamSelectDialog(BuildContext context, String message) {
  GameManager gameManager = context.read<GameManager>();
  GameState gameState = gameManager.activeGame;

  return showDialog<Teams>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Select team"),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, Teams.team1);
            },
            child: Text(gameState.team1Name),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, Teams.team2);
            },
            child: Text(gameState.team2Name),
          ),
        ],
      );
    },
  );
}
