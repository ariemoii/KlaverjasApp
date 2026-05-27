import 'package:flutter/material.dart';

class TeamScoreCard extends StatelessWidget{
  final int score;
  final String teamName;

  const TeamScoreCard({
    super.key,
    required this.score,
    required this.teamName,
  });


  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      elevation: 5,
      child: Text(
        teamName,
        style: style,
      ),
    );
  }
}