import 'package:flutter/material.dart';
import 'package:klaverjasapp/GameState/GameState.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:provider/provider.dart';
import 'package:klaverjasapp/widgets/ScorePanel.dart';
import 'package:klaverjasapp/widgets/RoundScore.dart';
import 'package:klaverjasapp/widgets/TeamSelectDialog.dart';
import 'package:klaverjasapp/widgets/EnterNumberDialog.dart';
import 'package:klaverjasapp/widgets/SaveGameButton.dart';

//for debugging
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GameManager gameManager = context.watch<GameManager>();
    final GameState gameState = gameManager.activeGame;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        bottom: true,
        child: Stack(
          children: [
            Positioned.fill(
              //background
              child: Image.asset(
                'assets/table_with_playing_cards.png',
                fit: BoxFit.cover,
              ),
            ),

            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Text(
                                  gameState.team1Name,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              const Divider(color: Colors.black, thickness: 10),

                              Expanded(
                                child: ListView(
                                  children: gameState.rounds.map((round) {
                                    return RoundScore(
                                      round: round,
                                      whatTeam: Teams.team1,
                                    );
                                  }).toList(),
                                ),
                              ),

                              _showBottom(
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Divider(
                                      color: Colors.black,
                                      height: 2,
                                      thickness: 2,
                                    ),

                                    ShowScore(
                                      gameState: gameState,
                                      team: Teams.team1,
                                    ),

                                    Divider(
                                      color: Colors.black,
                                      height: 2,
                                      thickness: 2,
                                    ),

                                    RoemButtons(
                                      gameManager: gameManager,
                                      team: Teams.team1,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                height: 2,
                                thickness: 2,
                              ),
                            ],
                          ),
                        ),

                        VerticalDivider(
                          color: Colors.black,
                          thickness: 2,
                          width: 2,
                        ),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Text(
                                  gameState.team2Name,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              const Divider(color: Colors.black, thickness: 10),

                              Expanded(
                                child: ListView(
                                  children: gameState.rounds.map((round) {
                                    return RoundScore(
                                      round: round,
                                      whatTeam: Teams.team2,
                                    );
                                  }).toList(),
                                ),
                              ),

                              _showBottom(
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Divider(
                                      color: Colors.black,
                                      height: 2,
                                      thickness: 2,
                                    ),

                                    Divider(
                                      color: Colors.black,
                                      height: 2,
                                      thickness: 2,
                                    ),

                                    ShowScore(
                                      gameState: gameState,
                                      team: Teams.team2,
                                    ),

                                    Divider(
                                      color: Colors.black,
                                      height: 2,
                                      thickness: 2,
                                    ),

                                    RoemButtons(
                                      gameManager: gameManager,
                                      team: Teams.team2,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                height: 2,
                                thickness: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final Teams? selectedTeam =
                              await showTeamSelectDialog(
                                context,
                                "What team is playing?",
                              );
                          if (selectedTeam == null) return;
                          if (gameState.metBieden) {
                            final int? geboden;
                            //you should be able to bied
                            if (!context.mounted) return;
                            geboden = await showEnterNumberDialog(
                              context,
                              "Give your bod",
                            );
                            gameManager.addRound(
                              selectedTeam,
                              biddedScore: geboden,
                            );
                            return;
                          }
                          gameManager.addRound(selectedTeam);
                        },
                        child: Text('Add Round'),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            gameManager.removeSelectedRoundAtActiveGame(),
                        child: Text('Remove selected round'),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (gameState.selectedRound == null) return;
                      final int? score = await showEnterNumberDialog(
                        context,
                        "Enter score",
                      );

                      if (!context.mounted) return;

                      final Teams? countingTeam = await showTeamSelectDialog(
                        context,
                        "What team is counting?",
                      );

                      if (!context.mounted) return;

                      if (score == null) return;
                      if (countingTeam == null) return;
                      gameManager.finalizeSelectedRoundAtActiveGame(
                        countingTeam,
                        score,
                      );
                      final round = gameState.selectedRound;
                      if (round == null) return;
                      gameManager.selectRoundAtActiveGame(round);
                    },
                    child: Text('Finalize selected round'),
                  ),
                ],
              ),
            ),

            //back button
            Positioned(
              left: 20,
              top: 20,
              child: SafeArea(
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white24,
                    iconSize: 32,
                  ),
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                ),
              ),
            ),

            Positioned(
              right: 20,
              bottom: 20,
              child: SafeArea(child: SaveGameButton()),
            ),

            //debug button, remove in prod
            Positioned(
              right: 20,
              bottom: 300,
              child: ElevatedButton(
                onPressed: () async {
                  final dir = await getApplicationDocumentsDirectory();
                  final file = File('${dir.path}/saved_games.json');
                  await file.writeAsString('[]');
                },
                child: Text('Reset saves'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _showBottom(Widget widget) {
  return Align(
    alignment: FractionalOffset.bottomCenter,
    child: Padding(padding: const EdgeInsets.only(bottom: 10.0), child: widget),
  );
}
