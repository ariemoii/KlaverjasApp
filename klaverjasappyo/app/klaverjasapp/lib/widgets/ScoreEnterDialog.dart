import 'package:flutter/material.dart';

Future<int?> showScoreEntryDialog(BuildContext context) {
  final controller = TextEditingController();

  return showDialog<int>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Enter score'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Score'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final score = int.tryParse(controller.text);

              if (score == null) {
                return;
              }

              Navigator.pop(context, score);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
