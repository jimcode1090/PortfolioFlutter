import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Home Page',
      style: TextStyle(
          color: Color(0xff0000ff),
          fontSize: 25,
          letterSpacing: 2,
          fontWeight: FontWeight.w300,
          shadows: [
            Shadow(
              color: Colors.blue,
              blurRadius: 10.0,
              offset: Offset(5.0, 5.0),
            ),
          ]),
    );
  }
}
