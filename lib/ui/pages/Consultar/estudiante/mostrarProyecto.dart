import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/proyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Input.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';
import 'package:pegi/ui/widgets/inputText.dart';

import '../../../../data/services/peticionesProyecto.dart';
import '../../../../domain/Controllers/controladorUsuario.dart';
import '../../Calificar/calificarProyecto.dart';

class MostrarProyecto extends StatefulWidget {
  final Proyecto proyecto;

  const MostrarProyecto({super.key, required this.proyecto});

  @override
  State<MostrarProyecto> createState() => _MostrarProyectoState();
}

class _MostrarProyectoState extends State<MostrarProyecto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensiones.screenHeight * 0.0001,
              horizontal: Dimensiones.screenWidth * 0.03),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Header(
                    icon: Icons.arrow_back_rounded,
                    texto: 'Consultar Proyecto'),
                MostrarTodo(
                  texto: widget.proyecto.titulo,
                  colorBoton:
                      widget.proyecto.estado.toLowerCase() == 'pendiente'
                          ? const Color.fromRGBO(91, 59, 183, 1)
                          : const Color.fromRGBO(18, 180, 122, 1),
                  estado: true,
                  tipo: widget.proyecto.estado,
                  onPressed: () {},
                  color: Colors.black,
                  fijarIcon: false,
                  icon: Icons.mode_edit_outline_rounded,
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensiones.screenHeight * 0.0001,
                      horizontal: Dimensiones.screenWidth * 0.03),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.04),
                  child: Container(
                    height: Dimensiones.screenHeight * 0.0001,
                    width: Dimensiones.width90,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 4, color: Color.fromRGBO(30, 30, 30, 1)),
                      ),
                    ),
                  ),
                ),
                InputText(
                    false,
                    widget.proyecto.titulo,
                    "Titulo del proyecto",
                    EdgeInsets.only(right: Dimensiones.screenWidth * 0.08),
                    const EdgeInsets.only(bottom: 8),
                    const Color.fromRGBO(30, 30, 30, 1),
                    const Color.fromARGB(255, 221, 221, 221)),
                InputDownload(
                    texto: "Descargar documento",
                    icon: Icons.download_rounded,
                    color: const Color.fromRGBO(30, 30, 30, 1),
                    onPressed: () {}),
              ]),
        ),
      ),
    );
  }
}
