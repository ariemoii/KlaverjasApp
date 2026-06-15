import 'package:flutter/material.dart';
import 'package:klaverjasapp/screens/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:klaverjasapp/GameState/GameState.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameState(),
      child: MaterialApp(title: 'Klaverjas App', home: HomeScreen()),
    );
  }
}
