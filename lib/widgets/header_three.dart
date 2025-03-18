import 'package:flutter/material.dart';

class HeaderThree extends StatelessWidget {
  final String text;
  const HeaderThree({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(0, 0,0,0),
    child:
    Text(text, 
    //textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    )));
  }
}