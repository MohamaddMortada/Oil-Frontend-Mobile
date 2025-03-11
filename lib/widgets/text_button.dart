import 'package:flutter/material.dart';

class TextButtonGreen extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const TextButtonGreen({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
