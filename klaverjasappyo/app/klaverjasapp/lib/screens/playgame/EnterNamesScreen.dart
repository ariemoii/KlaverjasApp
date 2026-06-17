import 'package:flutter/material.dart';
import 'package:klaverjasapp/GameState/GameState.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/widgets/EnterText.dart';
import 'package:klaverjasapp/widgets/MetBiedenSwitch.dart';
import 'package:provider/provider.dart';
import 'package:klaverjasapp/screens/playgame/ScoreScreen.dart';
import 'dart:developer';

class EnterNameScreen extends StatelessWidget {
  const EnterNameScreen({super.key});

  Widget _chair({
    required Size size,
    required double dx,
    required double dy,
    required ValueChanged<String> name,
    String? hintText,
  }) {
    return Positioned(
      left: size.width * dx - 50,
      top: size.height * dy - 20,
      child: EnterText(
        onChanged: (value) {
          name(value);
        },
        hintText: hintText,
      ),
    );
  }

  Future<void> _editTeamNameDialog(BuildContext context, Teams whatTeam) async {
    final GameManager gameManager = context.read<GameManager>();

    if (whatTeam == Teams.noTeam) {
      log(
        "There is no team passed to _editTeamNameDialog in file ScoreScreen.dart",
      );
    }

    final controller = TextEditingController();

    final String? result = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit team name'),
          content: TextField(controller: controller, maxLength: 10),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: Text("Save"),
            ),
          ],
        );
      },
    );

    if (result != null && result.isNotEmpty) {
      gameManager.editTeamNameAtActiveGame(whatTeam, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final GameManager gameManager = context.watch<GameManager>();
    final GameState gameState = gameManager.activeGame;
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/table_with_playing_cards.png',
              fit: BoxFit.cover,
            ),
          ),

          _chair(
            size: size,
            dx: 0.2,
            dy: 0.15,
            name: (name) => gameManager.editFirstTeammateNameAtActiveGame(
              Teams.team1,
              name,
            ),
            hintText: gameState.team1Name,
          ),
          _chair(
            size: size,
            dx: 0.8,
            dy: 0.15,
            name: (name) => gameManager.editFirstTeammateNameAtActiveGame(
              Teams.team2,
              name,
            ),
            hintText: gameState.team2Name,
          ),
          _chair(
            size: size,
            dx: 0.2,
            dy: 0.8,
            name: (name) => gameManager.editSecondTeammateNameAtActiveGame(
              Teams.team2,
              name,
            ),
            hintText: gameState.team2Name,
          ),
          _chair(
            size: size,
            dx: 0.8,
            dy: 0.8,
            name: (name) => gameManager.editSecondTeammateNameAtActiveGame(
              Teams.team1,
              name,
            ),
            hintText: gameState.team1Name,
          ),

          Positioned(
            left: size.width * 0.2 - 50,
            top: size.height * 0.6 - 20,
            child: ElevatedButton(
              onPressed: () => _editTeamNameDialog(context, Teams.team1),
              child: Text(
                gameState.team1Name,
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ),
          ),

          Positioned(
            left: size.width * 0.8 - 50,
            top: size.height * 0.6 - 20,
            child: ElevatedButton(
              onPressed: () => _editTeamNameDialog(context, Teams.team2),
              child: Text(
                gameState.team2Name,
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
          ),

          //save names widget
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MetBiedenSwitch(),

                ElevatedButton(
                  onPressed: () {
                    gameState.startGame();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScoreScreen()),
                    );
                  },
                  child: const Text("Save  names and start game"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
