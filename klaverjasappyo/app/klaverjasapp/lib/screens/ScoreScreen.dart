import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

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

                _chair(constraints, 0.2, 0.15),
                _chair(constraints, 0.8, 0.15),
                _chair(constraints, 0.2, 0.85),
                _chair(constraints, 0.8, 0.85),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _chair(BoxConstraints constraints, double dx, double dy) {
  return Positioned(
    left: constraints.maxWidth * dx - 50,
    top: constraints.maxHeight * dy - 20,
    child: const _EnterName(),
  );
}

class _EnterName extends StatelessWidget {
  const _EnterName();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Enter Text',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          isDense: true,
        ),
      ),
    );
  }
}
