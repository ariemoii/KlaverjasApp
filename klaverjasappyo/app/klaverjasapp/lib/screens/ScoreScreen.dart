import 'package:flutter/material.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:klaverjasapp/widgets/EnterText.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
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
          content: TextField(controller: controller),
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
      setState(() {
        final teamState = context.watch<TeamState>();
        if (whatTeam == Teams.team1) {
          teamState.editTeam1TeamName(result);
        } else {
          teamState.editTeam2TeamName(result);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TeamState teamState = context.watch<TeamState>();

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
                  name: (value) => teamState.editTeam1FirstTeammateName(value),
                  hintText: teamState.team1.teamName,
                ),
                _chair(
                  constraints: constraints,
                  dx: 0.8,
                  dy: 0.15,
                  name: (value) => teamState.editTeam2FirstTeammateName(value),
                  hintText: teamState.team2.teamName,
                ),
                _chair(
                  constraints: constraints,
                  dx: 0.2,
                  dy: 0.85,
                  name: (value) => teamState.editTeam2SecondTeammateName(value),
                  hintText: teamState.team2.teamName,
                ),
                _chair(
                  constraints: constraints,
                  dx: 0.8,
                  dy: 0.85,
                  name: (value) => teamState.editTeam1SecondTeammateName(value),
                  hintText: teamState.team1.teamName,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
