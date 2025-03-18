import 'package:flutter/material.dart';

class CustomedTextfieldTwo extends StatelessWidget {
  final String text;
  const CustomedTextfieldTwo({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(child:
        TextField(
        maxLines: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF6C757D)),
        ),
      ));
  }
}