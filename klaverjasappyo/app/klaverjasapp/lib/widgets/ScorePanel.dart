import 'package:flutter/material.dart';
import 'package:klaverjasapp/models/RoemValue.dart';
import 'package:klaverjasapp/GameState/GameState.dart';
import 'package:klaverjasapp/models/Team.dart';

class ShowScore extends StatelessWidget {
  final GameState gameState;
  final Teams team;

  const ShowScore({required this.gameState, required this.team, super.key});

  @override
  Widget build(BuildContext context) {
    final score = team == Teams.team1
        ? gameState.team1Score
        : gameState.team2Score;

    return Text(
      'Total Score: $score',
      style: TextStyle(fontSize: 20, color: Colors.white),
    );
  }
}

class AddRoemButton extends StatelessWidget {
  final GameManager gameManager;
  final Teams team;
  final RoemValue amountRoem;

  const AddRoemButton({
    required this.gameManager,
    required this.team,
    required this.amountRoem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white54,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {
        gameManager.addRoemAtActiveGame(team, amountRoem);
      },
      child: Text('+${amountRoem.value}'),
    );
  }
}

class RemoveRoemButton extends StatelessWidget {
  final GameManager gameManager;
  final Teams team;
  final RoemValue amountRoem;

  const RemoveRoemButton({
    required this.gameManager,
    required this.team,
    required this.amountRoem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white54,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {
        gameManager.removeRoemAtActiveGame(team, amountRoem);
      },
      child: Text('-${amountRoem.value}'),
    );
  }
}

class RoemButtons extends StatelessWidget {
  final GameManager gameManager;
  final Teams team;

  const RoemButtons({required this.gameManager, required this.team, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            AddRoemButton(
              amountRoem: RoemValue.twenty,
              gameManager: gameManager,
              team: team,
            ),
            AddRoemButton(
              amountRoem: RoemValue.fifty,
              gameManager: gameManager,
              team: team,
            ),
          ],
        ),
        Row(
          children: [
            RemoveRoemButton(
              amountRoem: RoemValue.twenty,
              gameManager: gameManager,
              team: team,
            ),
            RemoveRoemButton(
              amountRoem: RoemValue.fifty,
              gameManager: gameManager,
              team: team,
            ),
          ],
        ),
      ],
    );
  }
}
