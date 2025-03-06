import 'package:flutter/material.dart';

class HeaderTwo extends StatelessWidget {
  final String text;
  const HeaderTwo({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
    child:
    Text(text, 
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    )));
  }
}