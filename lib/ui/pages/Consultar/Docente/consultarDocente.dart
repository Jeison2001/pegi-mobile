import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/pages/consultar/Docente/ConsultarPropuestas.dart';
import 'package:pegi/ui/pages/consultar/Docente/consultarProyectos.dart';

import 'package:pegi/ui/utils/Dimensiones.dart';
import '../../../../domain/Controllers/controlPropuesta.dart';
import '../../../../domain/Controllers/controlProyecto.dart';
import '../../../../domain/Controllers/controladorUsuario.dart';
import '../../../widgets/Consulta.dart';

class ConsultarDocente extends StatefulWidget {
  const ConsultarDocente({super.key});

  @override
  State<ConsultarDocente> createState() => _ConsultarDocenteState();
}

class _ConsultarDocenteState extends State<ConsultarDocente> {
  @override
  Widget build(BuildContext context) {
    ControlProyecto controlp = Get.find();
    ControlUsuario controlu = Get.find();
    ControlPropuesta controlpropues = Get.find();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Row(children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage('assets/icons/archivo.png'),
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.sunny, color: Colors.white)),
                  IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.notifications, color: Colors.white))
                ]),
                const SizedBox(height: 15),
              ],
            ),
            const SizedBox(height: 30),
            Consultar(
                icon: Icons.folder,
                texto: 'Consultar \nPropuesta',
                colorBoton: const Color.fromRGBO(18, 180, 122, 1),
                onPressed: () async {
                  await controlpropues
                      .consultarPropuestasDocente(controlu.emailf)
                      .then((value) => log("consulta Docente"));

                  Get.to(() => const ConsultarPropuestaDocente());
                }),
            const SizedBox(height: 30),
            Consultar(
                icon: Icons.folder,
                texto: 'Consultar \nProyecto',
                colorBoton: const Color.fromRGBO(33, 153, 245, 1),
                onPressed: () async {
                  await controlp
                      .consultarProyectosDocentes(controlu.emailf)
                      .then((value) => log("consulta Docente"));
                  Get.to(() => const ConsultarProyectoDocente());
                }),
          ],
        ),
      ),
    );
  }
}
