import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final Widget child;
  final double width, height;

  const CircleContainer({super.key, required this.child, required this.width, required this.height})
  : assert(width >= 50, 'width must be greater than 50'),
  assert(height >= 50, 'height must be greater than 50');

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: const BoxDecoration(
          color: Color(0xfff0f0f0),
          // borderRadius: BorderRadius.circular(20),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(5.0, 5.0),
            ),
          ]),
      child: child,
    );
  }
}
