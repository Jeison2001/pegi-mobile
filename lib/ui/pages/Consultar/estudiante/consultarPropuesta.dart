import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/domain/models/propuesta.dart';
import 'package:pegi/ui/pages/Consultar/estudiante/mostrarPropuesta.dart';
import 'package:pegi/ui/pages/home.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Consulta.dart';
import 'package:pegi/ui/widgets/Header.dart';

import '../../../../data/services/peticionesPropuesta.dart';
import '../../../../domain/Controllers/controladorUsuario.dart';

class ConsultarPropuestas extends StatefulWidget {
  const ConsultarPropuestas({super.key});

  @override
  State<ConsultarPropuestas> createState() => _ConsultarPropuestasState();
}

class _ConsultarPropuestasState extends State<ConsultarPropuestas> {
  PeticionesPropuesta peticionesPropuesta = PeticionesPropuesta();
  ControlPropuesta controlp = Get.find();

  ControlUsuario controlu = Get.find();

  late Future<List<Propuesta>> listaPropuesta =
      peticionesPropuesta.consultarPropuestas(controlu.emailf);
  TextEditingController controlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controlp.consultarPropuestas(controlu.emailf).then((value) => null);

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
                          texto: 'Consultar Propuestas'),
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
                    ],
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
        ));
  }

  Widget mostrarLista() {
    return ListView.builder(
      itemCount: controlp.getPropuestaEstudiante?.isEmpty == true
          ? 0
          : controlp.getPropuestaEstudiante!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Propuesta>>(
          future: listaPropuesta,
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
                    _eliminarPropuesta(
                        context, posicion.data![index], controlp);
                  },
                  onPressed: () {
                    Get.to(() =>
                        MostrarPropuesta(propuesta: posicion.data![index]));
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

  _eliminarPropuesta(context, propuestaActual, controlp) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
              title: const Text(
                'Eliminar Propuesta',
                style: TextStyle(color: Colors.white),
              ),
              content: Text(
                'Desea Realmente Eliminar a "${propuestaActual!.titulo}"',
                style: const TextStyle(color: Colors.white),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      controlp.eliminarPropuesta(propuestaActual!.idPropuesta);
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
