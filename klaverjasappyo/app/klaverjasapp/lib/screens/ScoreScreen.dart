import 'package:flutter/material.dart';
import 'package:klaverjasapp/models/Round.dart';
import 'package:klaverjasapp/state/GameState.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:provider/provider.dart';
import 'package:klaverjasapp/widgets/ScorePanel.dart';
import 'package:klaverjasapp/widgets/RoundScore.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameState gameState = context.watch<GameState>();

    return Scaffold(
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

                  ElevatedButton(
                    onPressed: () {
                      gameState.addRound();
                    },
                    child: Text('Add Round'),
                  ),
                ],
              ),
            ),

            //the back button, leave for last
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                iconSize: 32,
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
