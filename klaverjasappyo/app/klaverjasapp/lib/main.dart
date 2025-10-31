import 'package:flutter/material.dart';

void main() {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("ballz"),
        ), 
        body: Container(
          child: Center(
            child: AllPlayers()
          ),
        ),
      ),
    );
  }
}

class AllPlayers extends StatelessWidget {
  const AllPlayers({super.key,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: Wrap(
        children: [
          for(int i = 0; i < 4; i++)
            PlayerCard(

            ),
        ],
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      elevation: 5,
      child: Text(
        'ballz', 
        style: style,
      ),
    );
  }
}