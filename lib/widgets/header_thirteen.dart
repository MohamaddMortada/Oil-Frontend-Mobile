import 'package:flutter/material.dart';

class HeaderThirteen extends StatelessWidget {
  final String text;
  const HeaderThirteen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    child:
    Text(text, 
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Color(0xFF222538),
      fontWeight: FontWeight.w700,
      fontSize: 12,
    )));
  }
}