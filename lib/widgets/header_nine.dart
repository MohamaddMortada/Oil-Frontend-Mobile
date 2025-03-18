import 'package:flutter/material.dart';

class HeaderNine extends StatelessWidget {
  final String text;
  const HeaderNine({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xFF1F2024)),
    );
  }
}