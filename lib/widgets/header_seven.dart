import 'package:flutter/material.dart';

class HeaderSeven extends StatelessWidget {
  final String text;
  const HeaderSeven({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      color: Color(0xFF71727A),
      fontSize: 18,
      fontWeight: FontWeight.w900),
    );
  }
}