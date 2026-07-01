import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'GameState.dart';
import 'dart:developer';

class SaveGameService {
  static Future<void> saveGame(GameState gameState) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/saved_games.json');

      List<Map<String, dynamic>> games = [];

      if (await file.exists()) {
        final content = await file.readAsString();

        if (content.isNotEmpty) {
          final decoded = jsonDecode(content);
          games = List<Map<String, dynamic>>.from(decoded);
        }
      }

      games.removeWhere((g) => g['id'] == gameState.id);

      games.add(gameState.toJson());

      await file.writeAsString(jsonEncode(games));

      print("Saved ${games.length} games");
    } catch (e) {
      log('failed to save, error: $e');
    }
  }

  static Future<List<GameState>> loadAllGames() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/saved_games.json');

    List<Map<String, dynamic>> gamesAsJson = [];

    if (await file.exists()) {
      final content = await file.readAsString();

      if (content.isNotEmpty) {
        final decoded = jsonDecode(content);
        gamesAsJson = List<Map<String, dynamic>>.from(decoded);
      }
    }

    List<GameState> games = gamesAsJson
        .map((asJson) => GameState.fromJson(asJson))
        .toList();

    return games;
  }

  static Future<void> resetGames() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/saved_games.json');
    file.writeAsString('');
  }
}
