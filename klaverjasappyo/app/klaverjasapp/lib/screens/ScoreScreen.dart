import 'package:flutter/material.dart';
import 'package:klaverjasapp/state/GameState.dart';
import 'package:provider/provider.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final GameState gameState = context.watch<GameState>();

    return Scaffold(
      body: Stack(
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
                      Text("Texttext"),

                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("test"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
    );
  }
}
