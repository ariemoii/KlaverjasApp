import 'package:flutter/material.dart';

class EnterText extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? hintText;

  const EnterText({required this.onChanged, super.key, this.hintText});

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
