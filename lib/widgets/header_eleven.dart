import 'package:flutter/material.dart';

class HeaderEleven extends StatelessWidget {
  final String text;
  const HeaderEleven({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color:Color.fromARGB(255, 0, 0, 0)),
    );
  }
}