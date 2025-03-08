import 'package:flutter/material.dart';

class HeaderOne extends StatelessWidget {
  final String text;
  const HeaderOne({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
      }
}