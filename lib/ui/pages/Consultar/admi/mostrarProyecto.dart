import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/proyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Input.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../../../../data/services/peticionesProyecto.dart';
import '../../../../domain/Controllers/controladorUsuario.dart';
import '../../Calificar/asignarEvaluadorPropuesta.dart';
import '../../Calificar/calificarProyecto.dart';

class MostrarProyecto extends StatefulWidget {
  final Proyecto proyecto;
  const MostrarProyecto({super.key, required this.proyecto});

  @override
  State<MostrarProyecto> createState() => _MostrarProyectoState();
}

class _MostrarProyectoState extends State<MostrarProyecto> {
  PeticionesProyecto peticionesProyecto = PeticionesProyecto();
  ControlUsuario controlu = Get.find();
  late Future<List<Proyecto>> listaProyecto =
      PeticionesProyecto.consultarProyectos(controlu.emailf);
  TextEditingController controlDocumento = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Header(icon: Icons.arrow_back_rounded, texto: 'Consultar Proyecto'),
          MostrarTodo(
              texto: widget.proyecto.titulo,
              colorBoton: widget.proyecto.estado.toLowerCase() == 'pendiente'
                  ? const Color.fromRGBO(91, 59, 183, 1)
                  : const Color.fromRGBO(18, 180, 122, 1),
              estado: true,
              tipo: widget.proyecto.estado,
              onPressed: () {
                /*Get.to(() => const AsignarEvaluador());*/
              },
              color: Colors.black,
              fijarIcon: true,
              icon: Icons.person_add_alt_rounded,
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensiones.screenWidth * 0.06,
                  vertical: Dimensiones.screenHeight * 0.02)),
          Padding(
            padding: EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.0001),
            child: Container(
              height: 0.001,
              width: Dimensiones.width90,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 4, color: Color.fromRGBO(30, 30, 30, 1)),
                ),
              ),
            ),
          ),
          InputDownload(
              texto: "Descargar documento",
              icon: Icons.download_rounded,
              color: const Color.fromRGBO(30, 30, 30, 1),
              onPressed: () {}),
        ]),
      ),
    );
  }
}
