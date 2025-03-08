import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  final Function(String) onChanged;

  const CustomTextfield({super.key, required this.label, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(84, 0, 0, 0)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        maxLines: 1,
        onChanged: onChanged, 
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
          hintStyle: const TextStyle(fontSize: 14, color: Color.fromARGB(103, 0, 0, 0)),
        ),
      ),
    );
  }
}
