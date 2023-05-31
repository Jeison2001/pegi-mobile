import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/Controllers/controlProyecto.dart';
import 'package:pegi/domain/models/proyecto.dart';
import 'package:pegi/ui/pages/Calificar/asignarEvaluadorProyecto.dart';
import 'package:pegi/ui/widgets/Filter.dart';
import 'package:pegi/ui/widgets/Header.dart';
import '../../../../data/services/peticionesProyecto.dart';
import '../../../../domain/Controllers/controladorUsuario.dart';
import '../../../utils/Dimensiones.dart';
import '../../../widgets/Mostrar.dart';

class EvaluadorProyecto extends StatefulWidget {
  const EvaluadorProyecto({super.key});

  @override
  State<EvaluadorProyecto> createState() => _EvaluadorProyectoState();
}

class _EvaluadorProyectoState extends State<EvaluadorProyecto> {
  TextEditingController controlador = TextEditingController();
  ControlProyecto controlp = Get.find();
  late Future<List<Proyecto>> listaProyecto =
      PeticionesProyecto.consultarTodosProyectos();
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
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Header(
                      icon: Icons.arrow_back_rounded,
                      texto: 'Evaluadores Proyecto'),
                  Filter(controlador: controlador, texto: 'Filtrar'),
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
          ),
        ));
  }

  Widget mostrarLista() {
    return ListView.builder(
      itemCount: controlp.getTodosproyectos?.isEmpty == true
          ? 0
          : controlp.getTodosproyectos!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Proyecto>>(
          future: listaProyecto,
          builder: (context, posicion) {
            if (posicion.hasData) {
              return MostrarTodo(
                  texto: posicion.data![index].titulo.toString(),
                  tipo: posicion.data![index].idDocente
                              .toString()
                              .toLowerCase() ==
                          ''
                      ? 'Pendiente'
                      : 'Asignado',
                  estado: true,
                  colorBoton: posicion.data![index].idDocente == ''
                      ? const Color.fromRGBO(91, 59, 183, 1)
                      : const Color.fromRGBO(18, 180, 122, 1),
                  color: const Color.fromRGBO(30, 30, 30, 1),
                  fijarIcon: true,
                  icon: posicion.data![index].idDocente == ''
                      ? Icons.person_add_alt_rounded
                      : Icons.person_remove_rounded,
                  padding: EdgeInsets.only(
                      left: Dimensiones.screenWidth * 0.05,
                      right: Dimensiones.screenWidth * 0.05,
                      top: Dimensiones.screenHeight * 0.03),
                  onPressed: () async {
                    await controlu.consultarListaDocentes();
                    await controlu.consultarNombresDocentes();
                    Get.to(() => AsignarEvaluadorProyecto(
                        proyecto: posicion.data![index],
                        user: controlu.getListaDocentes!));
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
}
