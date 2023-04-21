import 'package:flutter/material.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class BottomMenu extends StatefulWidget {
  final Function currentIndex;
  final List<BottomNavigationBarItem> items;
  const BottomMenu(
      {super.key, required this.currentIndex, required this.items});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.02),
      height: Dimensiones.screenHeight * 0.087,
      decoration: const BoxDecoration(color: Colors.black),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.screenHeight * 0.002,
            horizontal: Dimensiones.screenWidth * 0.03),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.white,
            selectedItemColor: Color.fromRGBO(113, 77, 217, 1),
            currentIndex: index,
            onTap: (int i) {
              setState(() {
                index = i;
                widget.currentIndex(i);
              });
            },
            type: BottomNavigationBarType.fixed,
            items: widget.items,
          ),
        ),
      ),
    );
  }
}
