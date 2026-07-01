import 'package:flutter/material.dart';

class EnterText extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? hintText;
  final String name;

  const EnterText({
    required this.onChanged,
    super.key,
    this.hintText,
    this.name = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: TextFormField(
        initialValue: name,
        maxLength: 10,
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
