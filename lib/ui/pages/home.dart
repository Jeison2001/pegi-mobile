import 'package:flutter/material.dart';
import '../../domain/models/routes.dart';
import '../widgets/bottom_menu.dart';

class HomePage extends StatefulWidget {
  final String rol; // Asegúrate de que el tipo de dato del rol sea String
  HomePage({required this.rol, Key? key})
      : super(key: key); // Añade el parámetro key

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  BottomMenu? menu;
  BottomMenu? menuEstudiante;

  @override
  void initState() {
    menu = BottomMenu(
      currentIndex: (i) {
        setState(() {
          index = i;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.space_dashboard), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight_outlined), label: ""),
      ],
    );
    menuEstudiante = BottomMenu(
      currentIndex: (i) {
        setState(() {
          index = i;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.space_dashboard), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.mode_edit_outline_rounded), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight_outlined), label: ""),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.rol == "estudiante" ? menuEstudiante : menu,
      body: Routes(
        index: index,
        rutaElejida: widget.rol,
      ),
    );
  }
}
