import 'package:flutter/material.dart';

class GreyLine extends StatelessWidget {
  const GreyLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 5,
      color: Color.fromARGB(255, 247, 247, 247),
    );
  }
}