import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/data/services/peticionesProyecto.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/ui/pages/Consultar/estudiante/consultarEstudiante.dart';
import 'package:pegi/ui/pages/Consultar/estudiante/consultarPropuesta.dart';
import 'package:pegi/ui/pages/Consultar/estudiante/mostrarProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Consulta.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../../../../domain/Controllers/controlProyecto.dart';
import '../../../../domain/models/proyecto.dart';
import '../../home.dart';

class ConsultarProyecto extends StatefulWidget {
  const ConsultarProyecto({super.key});

  @override
  State<ConsultarProyecto> createState() => _ConsultarProyectoState();
}

class _ConsultarProyectoState extends State<ConsultarProyecto> {
  PeticionesProyecto peticionesPropuesta = PeticionesProyecto();
  ControlProyecto controlp = Get.find();

  ControlUsuario controlu = Get.find();

  late Future<List<Proyecto>> listaProyecto =
      PeticionesProyecto.consultarProyectos(controlu.emailf);
  TextEditingController controlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controlp.consultarProyectos(controlu.emailf).then((value) => null);
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensiones.screenHeight * 0.02,
                horizontal: Dimensiones.screenWidth * 0.02),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensiones.height2),
                  child: Column(
                    children: [
                      Header(
                          icon: Icons.arrow_back_rounded,
                          texto: 'Consultar Proyecto'),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: Dimensiones.screenHeight * 0.00000001),
                        child: Container(
                          height: Dimensiones.height5,
                          width: Dimensiones.width90,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 4,
                                  color: Color.fromRGBO(30, 30, 30, 1)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        height: Dimensiones.screenHeight * 0.65,
                        width: Dimensiones.screenWidth * 0.89,
                        child: mostrarLista(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget mostrarLista() {
    return ListView.builder(
      itemCount: controlp.getproyectosGral?.isEmpty == true
          ? 0
          : controlp.getproyectosGral!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Proyecto>>(
          future: listaProyecto,
          builder: (context, posicion) {
            if (posicion.hasData) {
              return Mostrar(
                  texto: posicion.data![index].titulo.toString(),
                  tipo: posicion.data![index].estado.toString(),
                  colorTipo:
                      posicion.data![index].estado.toString().toLowerCase() ==
                              'pendiente'
                          ? const Color.fromRGBO(91, 59, 183, 1)
                          : const Color.fromRGBO(18, 180, 122, 1),
                  colorBoton: const Color.fromRGBO(30, 30, 30, 1),
                  onLongPress: () {
                    _eliminarProyecto(context, posicion.data![index], controlp);
                  },
                  onPressed: () {
                    Get.to(
                        () => MostrarProyecto(proyecto: posicion.data![index]));
                  });
            } else if (posicion.hasError) {
              return Text('${posicion.error}');
            }
            return const CircularProgressIndicator();
          },
        );
      },
    );
  }

  _eliminarProyecto(context, propuestaActual, controlp) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
              title: const Text(
                'Eliminar Proyecto',
                style: TextStyle(color: Colors.white),
              ),
              content: Text(
                'Desea Realmente Eliminar a "${propuestaActual.titulo}"',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      controlp.eliminarProyecto(propuestaActual.idProyecto);
                      Get.offAll(() => HomePage(rol: "estudiante"));
                    },
                    child: const Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Color.fromRGBO(33, 150, 243, 1)),
                    ))
              ],
            ));
  }
}
