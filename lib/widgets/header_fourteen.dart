import 'package:flutter/material.dart';

class HeaderFourteen extends StatelessWidget {
  final String text;
  const HeaderFourteen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      color: Color(0xFF343A40),
      fontWeight: FontWeight.w500,
      height: 18,
      fontSize: 12),
    );
  }
}