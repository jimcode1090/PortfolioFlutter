import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Color.fromARGB(255, 161, 161, 161),
      child: Stack(
        children: [
          Container(color: Colors.red, width: 100, height: 100),
          Container(color: Colors.blue, width: 80, height: 80),
          Positioned(right: 10, bottom: 10,child: Container(color: Colors.green, width: 40, height: 40),),
        ],
      ),
    );
  }
}
