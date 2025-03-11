import 'package:flutter/material.dart';

class GradientBar extends StatelessWidget {
  const GradientBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.white, Colors.transparent],
          stops: [0, 0.8],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFB1DCC4),
              Color(0xFF8AC987),
              Color(0xFF8FCB89),
              Color(0xFFB8DEAC),
              Color(0xFFBDE1C4),
            ],
            stops: [0.0, 0.3, 0.6, 0.8, 1],
          ),
        ),
      ),
    );
  }
}
