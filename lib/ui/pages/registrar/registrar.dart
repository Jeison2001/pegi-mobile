import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/pages/consultar/estudiante/consultarPropuesta.dart';
import 'package:pegi/ui/pages/consultar/estudiante/consultarProyecto.dart';
import 'package:pegi/ui/pages/registrar/registrarPropuesta.dart';
import 'package:pegi/ui/pages/registrar/registrarProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Consulta.dart';

class Registrar extends StatefulWidget {
  const Registrar({super.key});

  @override
  State<Registrar> createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  @override
  Widget build(BuildContext context) {
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
                      icon: const Icon(Icons.mode_edit_outline_rounded,
                          color: Colors.white)),
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
                icon: Icons.add_to_photos_outlined,
                texto: 'Registrar \nPropuesta',
                colorBoton: const Color.fromRGBO(18, 180, 122, 1),
                onPressed: () {
                  Get.to(() => const RegistrarPropuesta());
                }),
            const SizedBox(height: 30),
            Consultar(
                icon: Icons.add_to_photos_outlined,
                texto: 'Registrar \nProyecto',
                colorBoton: const Color.fromRGBO(33, 153, 245, 1),
                onPressed: () {
                  Get.to(() => const RegistrarProyecto());
                }),
          ],
        ),
      ),
    );
  }
}
