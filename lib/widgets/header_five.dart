import 'package:flutter/material.dart';

class HeaderFive extends StatelessWidget {
  final String text;
  const HeaderFive({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      color: Color(0xFF71727A),
      fontSize: 12),
    );
  }
}