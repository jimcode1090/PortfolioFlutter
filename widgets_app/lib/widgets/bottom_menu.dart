import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomMenuItem {
  final String iconPath, label;
  const BottomMenuItem({required this.iconPath, required this.label});
}

class BottomMenu extends StatelessWidget {
  final List<BottomMenuItem> items;

  const BottomMenu({super.key, required this.items}) : assert(items.length > 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff0f0f0),
      padding: const EdgeInsets.all(10),
      child: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {

          final BottomMenuItem item = items[index];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(item.iconPath, width: 25,), 
              const SizedBox(height: 3),
              Text(item.label, style: const TextStyle(fontSize: 12),)
              ],
          );
        }),
      )),
    );
  }
}
