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
              stops: [0.1, 0.4],
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
                  const Color.fromARGB(255, 206, 255, 236).withOpacity(0.8),
                  const Color.fromARGB(255, 186, 253, 159).withOpacity(0.8),
                  const Color.fromARGB(255, 183, 255, 155).withOpacity(0.8),
                  const Color.fromARGB(255, 185, 248, 160).withOpacity(0.8),
                  const Color.fromARGB(255, 230, 255, 220).withOpacity(0.8),
                ],
                stops: [0.0, 0.4, 0.5, 0.7, 0.9],
              ),
            ),
          ),
        );
  }
}