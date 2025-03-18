import 'package:flutter/material.dart';

class HeaderTwelve extends StatelessWidget {
  final String text;
  final double opacity;
  const HeaderTwelve({super.key, required this.text, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    child:
    Text(text, 
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Color(0xFF222538).withOpacity(opacity),
      fontWeight: FontWeight.w500,
      fontSize: 12,
    )));
  }
}