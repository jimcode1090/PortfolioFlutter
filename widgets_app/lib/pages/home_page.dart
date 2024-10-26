import 'package:flutter/material.dart';
import 'package:widgets_app/widgets/avartar.dart';
import 'package:widgets_app/widgets/bottom_menu.dart';
import 'package:widgets_app/widgets/circle_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomMenu(items: const [
          BottomMenuItem(iconPath: 'assets/icons/menu.svg', label: 'Inicio'),
          BottomMenuItem(iconPath: 'assets/icons/history.svg', label: 'Noticias'),
          BottomMenuItem(iconPath: 'assets/icons/notice.svg', label: 'Historial'),
          BottomMenuItem(iconPath: 'assets/icons/profile.svg', label: 'Mi Perfil'),
        ],
      ),
      body: SafeArea(
          top: true,
          bottom: true,
          child: Container(
            width: double.infinity,
            color: const Color(0xffeeeeee),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Avatar(),
                const SizedBox(height: 20),
                const Text("Bienvenido"),
                const Text(
                  "Jimmy Niels Paytan Villavicencio",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 1,
                  width: 100,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  color: const Color(0Xffaaaaaa),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleContainer(
                      width: 55,
                      height: 55,
                      child: Icon(Icons.add),
                    ),
                    CircleContainer(
                      width: 55,
                      height: 55,
                      child: Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
