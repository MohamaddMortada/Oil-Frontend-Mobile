import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;
  const LogoutButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 85,
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        decoration: BoxDecoration(
          color: Color(0xFFFFF1F1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(children: [
          Image.asset('assets/Icon (4).png'),
          SizedBox(width: 5,),
          Text(
          'Logout',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFFDD2424),
            fontSize: 12,
          ),
        ),
        ],),
        
        
      ),
    );
  }
}