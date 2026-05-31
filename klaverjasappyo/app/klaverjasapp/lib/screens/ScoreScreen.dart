import 'package:flutter/material.dart';
import 'package:klaverjasapp/models/Team.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  final List<Team> teams = [
    Team(firstTeammate: '', secondTeammate: ''),
    Team(firstTeammate: '', secondTeammate: ''),
  ];

  Widget _chair({
    required BoxConstraints constraints,
    required double dx,
    required double dy,
    required ValueChanged<String> name,
    String? hintText,
  }) {
    return Positioned(
      left: constraints.maxWidth * dx - 50,
      top: constraints.maxHeight * dy - 20,
      child: _EnterName(
        name: name.toString(),
        onChanged: (value) {
          setState(() {
            name(value);
          });
        },
        hintText: hintText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/table_with_playing_cards.png',
                    fit: BoxFit.cover, // better for background tables
                  ),
                ),

                _chair(
                  constraints: constraints,
                  dx: 0.2,
                  dy: 0.15,
                  name: (value) => teams[0].firstTeammate = value,
                  hintText: "team 1",
                ),
                _chair(
                  constraints: constraints,
                  dx: 0.8,
                  dy: 0.15,
                  name: (value) => teams[1].firstTeammate = value,
                  hintText: "team 2",
                ),
                _chair(
                  constraints: constraints,
                  dx: 0.2,
                  dy: 0.85,
                  name: (value) => teams[1].secondTeammate = value,
                  hintText: "team 2",
                ),
                _chair(
                  constraints: constraints,
                  dx: 0.8,
                  dy: 0.85,
                  name: (value) => teams[0].secondTeammate = value,
                  hintText: "team 1",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _EnterName extends StatelessWidget {
  final String name;
  final ValueChanged<String> onChanged;
  final String? hintText;

  const _EnterName({
    required this.name,
    required this.onChanged,
    super.key,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText ?? 'Enter Text',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          isDense: true,
        ),
      ),
    );
  }
}
