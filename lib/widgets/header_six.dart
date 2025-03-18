import 'package:flutter/material.dart';

class HeaderSix extends StatelessWidget {
  final String text;
  const HeaderSix({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 18,
      fontWeight: FontWeight.bold),
    );
  }
}