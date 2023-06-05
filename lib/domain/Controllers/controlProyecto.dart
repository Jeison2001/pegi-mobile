import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/proyecto.dart';

import '../../data/services/peticionesProyecto.dart';

class ControlProyecto extends GetxController {
  final Rxn<List<Proyecto>> _proyectoFirestore = Rxn<List<Proyecto>>();
  final Rxn<List<Proyecto>> _proyectoDocenteFirestore = Rxn<List<Proyecto>>();
  final Rxn<List<Proyecto>> _todosProyectos = Rxn<List<Proyecto>>();
  final PeticionesProyecto peticionesProyecto = PeticionesProyecto();

  Future<void> consultarProyectos(email) async {
    _proyectoFirestore.value =
        await peticionesProyecto.consultarProyectos(email);
  }

  Future<void> consultarTodosProyectos() async {
    _todosProyectos.value = await peticionesProyecto.consultarTodosProyectos();
  }

  Future<void> consultarProyectosDocentes(id) async {
    _proyectoDocenteFirestore.value =
        await peticionesProyecto.consultarProyectoDocente(id);
  }

  Future<void> eliminarProyecto(proyecto) async {
    await peticionesProyecto.eliminarProyecto(proyecto);
  }

  List<Proyecto>? get getproyectosGral => _proyectoFirestore.value;
  List<Proyecto>? get getproyectosDocentes => _proyectoDocenteFirestore.value;
  List<Proyecto>? get getTodosproyectos => _todosProyectos.value;

  Future<void> modificarProyecto(proyecto) async {
    await peticionesProyecto.modificarProyecto(proyecto);
  }

  Future<void> registrarProyecto(Map<String, dynamic> proyecto,
      String? pickedFilePath, String? pickedFileextencion) async {
    try {
      await peticionesProyecto.crearProyecto(
          proyecto, pickedFilePath, pickedFileextencion);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      // if (e.code == 'user-not-found') {
      //   return Future.error('Usuario no Existe');
      // } else if (e.code == 'wrong-password') {
      //   return Future.error('Contraseña Incorrecta');
      // }
    }
  }
}
