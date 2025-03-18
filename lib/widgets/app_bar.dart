import 'package:flutter/material.dart';

class CustomedAppBar extends StatelessWidget {
  final String text;
  const CustomedAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Image.asset('assets/Left Button.png'),
      Text(text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700
      ),
      ),
      SizedBox(width: 10,),
    ],);
  }
}