import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/ui/pages/consultar/estudiante/consultarPropuesta.dart';
import 'package:pegi/ui/pages/consultar/estudiante/consultarProyecto.dart';
import '../../../../domain/Controllers/controlProyecto.dart';
import '../../../../domain/Controllers/controladorUsuario.dart';
import '../../../utils/Dimensiones.dart';
import '../../../widgets/Consulta.dart';

class ConsultarEstudiante extends StatefulWidget {
  const ConsultarEstudiante({super.key});

  @override
  State<ConsultarEstudiante> createState() => _ConsultarEstudianteState();
}

class _ConsultarEstudianteState extends State<ConsultarEstudiante> {
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
                      .consultarPropuestas(controlu.emailf)
                      .then((value) => log("consulta estudiante"));
                  Get.to(() => const ConsultarPropuestas());
                }),
            const SizedBox(height: 30),
            Consultar(
                icon: Icons.folder,
                texto: 'Consultar \nProyecto',
                colorBoton: const Color.fromRGBO(33, 153, 245, 1),
                onPressed: () async {
                  await controlp
                      .consultarProyectos(controlu.emailf)
                      .then((value) => log("consulta estudiante"));

                  Get.to(() => const ConsultarProyecto());
                }),
          ],
        ),
      ),
    );
  }
}
