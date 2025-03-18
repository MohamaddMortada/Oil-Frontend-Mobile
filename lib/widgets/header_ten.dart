import 'package:flutter/material.dart';

class HeaderTen extends StatelessWidget {
  final String text;
  const HeaderTen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color:Color(0xFF1F2024)),
    );
  }
}