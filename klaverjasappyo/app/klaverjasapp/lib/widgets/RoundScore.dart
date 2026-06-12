import 'package:flutter/material.dart';
import 'package:klaverjasapp/models/Round.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/state/GameState.dart';
import 'package:provider/provider.dart';

class RoundScore extends StatelessWidget {
  final Round round;
  final Teams whatTeam;

  const RoundScore({super.key, required this.round, required this.whatTeam});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();

    final bool isSelected = gameState.selectedRound == round;

    final int score = whatTeam == Teams.team1
        ? round.team1Score
        : round.team2Score;

    final int roem = whatTeam == Teams.team1
        ? round.team1Roem
        : round.team2Roem;

    final int biddedScore = round.biddedScore;

    final String playingTeamText = round.playingTeam == Teams.team1
        ? gameState.team1Name
        : gameState.team2Name;

    Color? color;
    if (isSelected) {
      color = Colors.blueGrey;
    } else {
      color = Colors.white;
    }
    if (round.isFinalised) {
      color = Colors.white10;
    }

    return InkWell(
      onTap: () {
        gameState.selectRound(round);
      },
      child: Card(
        color: color,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'R${round.roundNumber}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    playingTeamText,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // SCORE ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Bidded',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        '$biddedScore',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

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
            ],
          ),
        ),
      ),
    );
  }
}
