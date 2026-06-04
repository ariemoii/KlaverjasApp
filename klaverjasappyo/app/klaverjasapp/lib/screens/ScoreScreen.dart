import 'package:flutter/material.dart';
import 'package:klaverjasapp/models/RoemValue.dart';
import 'package:klaverjasapp/state/GameState.dart';
import 'package:klaverjasapp/models/Team.dart';
import 'package:provider/provider.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: _RoemButtons(gameState, Teams.team1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  VerticalDivider(color: Colors.black, thickness: 2, width: 2),

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
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: _RoemButtons(gameState, Teams.team2),
                            ),
                          ),
                        ),
                      ],
                    ),
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

Widget _RoemButtons(GameState gameState, Teams whatTeam) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Divider(color: Colors.black, thickness: 2, height: 2),
      Row(
        children: [
          _AddRoemButton(RoemValue.twenty, gameState, whatTeam),
          _AddRoemButton(RoemValue.fifty, gameState, whatTeam),
        ],
      ),
      Row(
        children: [
          _RemoveRoemButton(RoemValue.twenty, gameState, whatTeam),
          _RemoveRoemButton(RoemValue.fifty, gameState, whatTeam),
        ],
      ),
    ],
  );
}

Widget _RemoveRoemButton(
  RoemValue amountRoem,
  GameState gameState,
  Teams whatTeam,
) {
  return Expanded(
    child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white54,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            gameState.removeRoem(whatTeam, amountRoem);
          },
          child: Text('-${amountRoem.value}'),
        ),
      ),
    ),
  );
}

Widget _AddRoemButton(
  RoemValue amountRoem,
  GameState gameState,
  Teams whatTeam,
) {
  return Expanded(
    child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white54,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            gameState.addRoem(whatTeam, amountRoem);
          },
          child: Text('+${amountRoem.value}'),
        ),
      ),
    ),
  );
}
