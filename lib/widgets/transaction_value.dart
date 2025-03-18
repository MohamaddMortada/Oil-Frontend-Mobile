import 'package:flutter/material.dart';

class TransactionValue extends StatelessWidget {
  final String text;
  const TransactionValue({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    
    return Column(children: [
    if(text[0] == '-')
      Text(text,
      style: TextStyle(
        color: Color(0xFFDD2424),
        fontSize: 16,
        fontWeight: FontWeight.w400),
      ),
    if(text[0] != '-')
      Text(text,
      style: TextStyle(
        color: Color(0xFF009B40),
        fontSize: 16,
        fontWeight: FontWeight.w400),
      )]);
  }
}