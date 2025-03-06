import 'package:flutter/material.dart';

class ContinueWith extends StatelessWidget {
  const ContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 1,
                          color: Color.fromARGB(40, 0, 0, 0),
                        ),
                        Text(
                          '   Or Continue with   ',
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(136, 0, 0, 0),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 1,
                          color: const Color.fromARGB(40, 0, 0, 0),
                        ),
                      ],
                    ),
                  );
  }
}