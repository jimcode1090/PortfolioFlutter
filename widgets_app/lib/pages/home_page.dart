import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgets_app/widgets/circle_container.dart';
import 'package:widgets_app/widgets/text_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCustom(),
            SizedBox(
              height: 30,
            ),
            CircleContainer(width: 100, height: 100,child: Text("Hola", style: TextStyle(fontSize: 30)),),
            CircleContainer(width: 100, height: 100,child: Icon(Icons.phone, size: 60, color: Colors.green,)),
            CircleContainer(width: 100, height: 100,child: Icon(CupertinoIcons.phone, size: 60, color: Colors.green,)),
          ],
        ),
      ),
    );
  }
}
