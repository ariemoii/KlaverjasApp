import 'package:flutter/material.dart';
import 'package:klaverjasapp/state/GameState.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:provider/provider.dart';
import 'package:klaverjasapp/widgets/ScorePanel.dart';
import 'package:klaverjasapp/widgets/RoundScore.dart';
import 'package:klaverjasapp/widgets/TeamSelectDialog.dart';
import 'package:klaverjasapp/widgets/EnterNumberDialog.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GameState gameState = context.watch<GameState>();

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
                                      gameState: gameState,
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
                                      gameState: gameState,
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
                            gameState.addRound(
                              selectedTeam,
                              biddedScore: geboden,
                            );
                            return;
                          }
                          gameState.addRound(selectedTeam);
                        },
                        child: Text('Add Round'),
                      ),
                      ElevatedButton(
                        onPressed: () => gameState.removeSelectedRound(),
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
                      gameState.finalizeSelectedRound(countingTeam, score);
                      final round = gameState.selectedRound;
                      if (round == null) return;
                      gameState.selectRound(round);
                    },
                    child: Text('Finalize selected round'),
                  ),
                ],
              ),
            ),

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
