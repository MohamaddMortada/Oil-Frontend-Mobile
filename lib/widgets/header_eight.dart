import 'package:flutter/material.dart';

class HeaderEight extends StatelessWidget {
  final String text;
  const HeaderEight({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      color: Color(0xFF495057),
      fontSize: 14,
      fontWeight: FontWeight.bold),
    );
  }
}