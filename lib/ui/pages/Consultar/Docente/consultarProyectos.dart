import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/data/services/peticionesProyecto.dart';
import 'package:pegi/domain/Controllers/controlProyecto.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/domain/models/proyecto.dart';
import 'package:pegi/ui/pages/Calificar/calificarProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Filter.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

class ConsultarProyectoDocente extends StatefulWidget {
  const ConsultarProyectoDocente({super.key});

  @override
  State<ConsultarProyectoDocente> createState() =>
      _ConsultarProyectoDocenteState();
}

class _ConsultarProyectoDocenteState extends State<ConsultarProyectoDocente> {
  ControlProyecto controlp = Get.find();

  ControlUsuario controlu = Get.find();

  late Future<List<Proyecto>> listaProyecto =
      PeticionesProyecto.consultarProyectoDocente(controlu.emailf);
  TextEditingController controlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensiones.screenHeight * 0.02,
                horizontal: Dimensiones.screenWidth * 0.02),
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Header(
                        icon: Icons.arrow_back_rounded,
                        texto: 'Consultar Proyectos'),
                    Filter(controlador: controlador, texto: 'Filtrar'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  height: Dimensiones.screenHeight * 0.55,
                  width: Dimensiones.screenWidth * 0.89,
                  child: mostrarLista(),
                )
              ],
            )),
      ),
    );
  }

  Widget mostrarLista() {
    return ListView.builder(
      itemCount: controlp.getproyectosDocentes?.isEmpty == true
          ? 0
          : controlp.getproyectosDocentes!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Proyecto>>(
          future: listaProyecto,
          builder: (context, posicion) {
            if (posicion.hasData) {
              return MostrarTodo(
                texto: posicion.data![index].titulo.toString(),
                tipo: posicion.data![index].estado.toString(),
                estado: true,
                colorBoton:
                    posicion.data![index].estado.toString().toLowerCase() ==
                            'pendiente'
                        ? const Color.fromRGBO(91, 59, 183, 1)
                        : const Color.fromRGBO(18, 180, 122, 1),
                onPressed: () async {
                  await controlp
                      .consultarProyectosDocentes(controlu.emailf)
                      .then((value) => log("consulta Proyecto Docente"));
                  Get.to(
                      () => CalificarProyecto(proyecto: posicion.data![index]));
                },
                color: const Color.fromRGBO(30, 30, 30, 1),
                fijarIcon: true,
                icon: Icons.edit_outlined,
                padding: EdgeInsets.only(
                    left: Dimensiones.screenWidth * 0.05,
                    right: Dimensiones.screenWidth * 0.05,
                    top: Dimensiones.screenHeight * 0.03),
              );
            } else if (posicion.hasError) {
              return Text('${posicion.error}');
            }
            return const CircularProgressIndicator();
          },
        );
      },
    );
  }
}
