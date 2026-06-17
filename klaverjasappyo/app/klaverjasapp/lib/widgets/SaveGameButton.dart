import 'package:flutter/material.dart';
import 'package:klaverjasapp/GameState/GameState.dart';
import 'package:klaverjasapp/GameState/SaveGameService.dart';
import 'package:provider/provider.dart';

class SaveGameButton extends StatelessWidget {
  const SaveGameButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white38,
        iconSize: 32,
      ),
      onPressed: () async {
        await SaveGameService.saveGame(context.read<GameManager>().activeGame);
      },
      icon: Icon(Icons.save),
    );
  }
}
