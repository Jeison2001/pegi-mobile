import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/domain/models/propuesta.dart';
import 'package:pegi/ui/pages/Calificar/calificarPropuesta.dart';
import 'package:pegi/ui/pages/Consultar/estudiante/mostrarPropuesta.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';
import '../../../widgets/Filter.dart';
import '../../../widgets/Header.dart';

class ConsultarPropuestaDocente extends StatefulWidget {
  const ConsultarPropuestaDocente({super.key});

  @override
  State<ConsultarPropuestaDocente> createState() =>
      _ConsultarPropuestaDocenteState();
}

class _ConsultarPropuestaDocenteState extends State<ConsultarPropuestaDocente> {
  TextEditingController controlador = TextEditingController();
  ControlPropuesta controlp = Get.find();
  late Future<List<Propuesta>> listaPropuesta =
      PeticionesPropuesta.consultarPropuestaDocente(controlu.emailf);
  ControlUsuario controlu = Get.find();
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
                        texto: 'Consultar Propuestas'),
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
            ),
          ),
        ));
  }

  Widget mostrarLista() {
    return ListView.builder(
      itemCount: controlp.getPropuestaDocente?.isEmpty == true
          ? 0
          : controlp.getPropuestaDocente!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Propuesta>>(
          future: listaPropuesta,
          builder: (context, posicion) {
            if (posicion.hasData) {
              return MostrarTodo(
                texto: posicion.data![index].titulo.toString(),
                tipo: posicion.data![index].estado.toString(),
                estado: true,
                calificacion: posicion.data![index].calificacion.toString(),
                colorBoton:
                    posicion.data![index].estado.toString().toLowerCase() ==
                            'pendiente'
                        ? const Color.fromRGBO(91, 59, 183, 1)
                        : const Color.fromRGBO(18, 180, 122, 1),
                onPressed: () {
                  Get.to(() =>
                      CalificarPropuesta(propuesta: posicion.data![index]));
                },
                onPressed2: () {
                  Get.to(
                      () => MostrarPropuesta(propuesta: posicion.data![index]));
                },
                color: const Color.fromRGBO(30, 30, 30, 1),
                fijarIcon: true,
                icon: Icons.edit_outlined,
                icon2: Icons.visibility,
                padding: EdgeInsets.only(
                    left: Dimensiones.screenWidth * 0.05,
                    right: Dimensiones.screenWidth * 0.05,
                    top: Dimensiones.screenHeight * 0.03,
                    bottom: Dimensiones.screenHeight * 0.03),
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
