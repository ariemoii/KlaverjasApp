import 'package:flutter/material.dart';
import 'package:klaverjasapp/models/Round.dart';
import 'package:klaverjasapp/models/Team.dart';

class RoundScore extends StatelessWidget {
  final Round round;
  final Teams whatTeam;

  const RoundScore({super.key, required this.round, required this.whatTeam});

  @override
  Widget build(BuildContext context) {
    final int score = whatTeam == Teams.team1
        ? round.team1Score
        : round.team2Score;

    final int roem = whatTeam == Teams.team1
        ? round.team1Roem
        : round.team2Roem;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Round number
            Text(
              'R${round.roundNumber}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),

            // Score
            Column(
              children: [
                const Text(
                  'Score',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  '$score',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Roem
            Column(
              children: [
                const Text(
                  'Roem',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  '$roem',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
