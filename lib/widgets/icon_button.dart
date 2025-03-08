import 'package:flutter/material.dart';

class IconImageButton extends StatelessWidget {
  final String url;
  const IconImageButton({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Container(
      padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color.fromARGB(255, 221, 221, 221))),
      child:Image.asset(url,),
    ),);
  }
}