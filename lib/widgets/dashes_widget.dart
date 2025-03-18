import 'package:flutter/material.dart';

class DashesWidget extends StatelessWidget {
  const DashesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '—' * 20, 
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xFFE4E4E4)),
              overflow: TextOverflow.ellipsis, 
            ),
          ),
        );
  }
}