import 'package:flutter/material.dart';
import 'package:klaverjasapp/state/GameState.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/widgets/EnterText.dart';
import 'package:provider/provider.dart';
import 'package:klaverjasapp/screens/TestScreen.dart';
import 'dart:developer';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  Widget _chair({
    required BoxConstraints constraints,
    required double dx,
    required double dy,
    required ValueChanged<String> name,
    String? hintText,
  }) {
    return Positioned(
      left: constraints.maxWidth * dx - 50,
      top: constraints.maxHeight * dy - 20,
      child: EnterText(
        onChanged: (value) {
          setState(() {
            name(value);
          });
        },
        hintText: hintText,
      ),
    );
  }

  Future<void> _editTeamNameDialog(Teams whatTeam) async {
    final gameState = context.read<GameState>();

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
      gameState.editTeamName(whatTeam, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final GameState gameState = context.watch<GameState>();

    return Scaffold(
      body: SizedBox.expand(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned.fill(
                  //background
                  child: Image.asset(
                    'assets/table_with_playing_cards.png',
                    fit: BoxFit.cover, // better for background tables
                  ),
                ),

                _chair(
                  constraints: constraints,
                  dx: 0.2,
                  dy: 0.15,
                  name: (name) =>
                      gameState.editFirstTeammateName(Teams.team1, name),
                  hintText: gameState.team1Name,
                ),
                _chair(
                  constraints: constraints,
                  dx: 0.8,
                  dy: 0.15,
                  name: (name) =>
                      gameState.editFirstTeammateName(Teams.team2, name),
                  hintText: gameState.team2Name,
                ),
                _chair(
                  constraints: constraints,
                  dx: 0.2,
                  dy: 0.85,
                  name: (name) =>
                      gameState.editSecondTeammateName(Teams.team2, name),
                  hintText: gameState.team2Name,
                ),
                _chair(
                  constraints: constraints,
                  dx: 0.8,
                  dy: 0.85,
                  name: (name) =>
                      gameState.editSecondTeammateName(Teams.team1, name),
                  hintText: gameState.team1Name,
                ),

                Positioned(
                  left: constraints.maxWidth * 0.15 - 50,
                  top: constraints.maxHeight * 0.65 - 20,
                  child: ElevatedButton(
                    onPressed: () => _editTeamNameDialog(Teams.team1),
                    child: Text(
                      gameState.team1Name,
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ),
                ),

                Positioned(
                  left: constraints.maxWidth * 0.75 - 50,
                  top: constraints.maxHeight * 0.65 - 20,
                  child: ElevatedButton(
                    onPressed: () => _editTeamNameDialog(Teams.team2),
                    child: Text(
                      gameState.team2Name,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                ),

                //save names widget
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => TestScreen()),
                      );
                    },
                    child: const Text("Save  names and start game"),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
