import 'package:flutter/material.dart';

Future<int?> showEnterNumberDialog(BuildContext context, String text) {
  final controller = TextEditingController();

  return showDialog<int>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(text),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(hintText: ''),
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
