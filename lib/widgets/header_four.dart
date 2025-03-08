import 'package:flutter/material.dart';

class HeaderFour extends StatelessWidget {
  final String text;
  const HeaderFour({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      color: Color(0xFF8F9098),
      fontSize: 14),
    );
  }
}