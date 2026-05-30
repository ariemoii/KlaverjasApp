import 'package:flutter/material.dart';
import 'package:klaverjasapp/screens/ScoreScreen.dart';
import 'package:klaverjasapp/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class AllPlayers extends StatelessWidget {
  const AllPlayers({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Wrap(children: [for (int i = 0; i < 4; i++) PlayerCard()]),
    );
  }
}

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      elevation: 5,
      child: Text('ballz', style: style),
    );
  }
}
