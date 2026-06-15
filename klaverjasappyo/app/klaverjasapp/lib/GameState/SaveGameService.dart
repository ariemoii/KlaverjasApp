import 'GameState.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:developer';

class Savegameservice {
  static Future<void> save(GameState gameState) async {
    print('called!');
    try {
      final Directory appDocDirectory =
          await getApplicationDocumentsDirectory();
      final File file = File('${appDocDirectory.path}/game_state.json');
      print('filepath = ${file.path}');

      final String jsonString = jsonEncode(gameState.toJson());

      await file.writeAsString(jsonString);
    } catch (e) {
      log('failed to save, error: $e');
    }
  }

  static Future<GameState?> load() async {}
}
