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
  final GameState gameState;
  final Teams team;
  final RoemValue amountRoem;

  const AddRoemButton({
    required this.gameState,
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
        gameState.addRoem(team, amountRoem);
      },
      child: Text('+${amountRoem.value}'),
    );
  }
}

class RemoveRoemButton extends StatelessWidget {
  final GameState gameState;
  final Teams team;
  final RoemValue amountRoem;

  const RemoveRoemButton({
    required this.gameState,
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
        gameState.removeRoem(team, amountRoem);
      },
      child: Text('-${amountRoem.value}'),
    );
  }
}

class RoemButtons extends StatelessWidget {
  final GameState gameState;
  final Teams team;

  const RoemButtons({required this.gameState, required this.team, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            AddRoemButton(
              amountRoem: RoemValue.twenty,
              gameState: gameState,
              team: team,
            ),
            AddRoemButton(
              amountRoem: RoemValue.fifty,
              gameState: gameState,
              team: team,
            ),
          ],
        ),
        Row(
          children: [
            RemoveRoemButton(
              amountRoem: RoemValue.twenty,
              gameState: gameState,
              team: team,
            ),
            RemoveRoemButton(
              amountRoem: RoemValue.fifty,
              gameState: gameState,
              team: team,
            ),
          ],
        ),
      ],
    );
  }
}
