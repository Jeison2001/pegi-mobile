import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/proyecto.dart';

import 'package:pegi/data/services/peticionesProyecto.dart';

class ControlProyecto extends GetxController {
  final Rxn<List<Proyecto>> _proyectoFirestore = Rxn<List<Proyecto>>();
  final Rxn<List<Proyecto>> _proyectoDocenteFirestore = Rxn<List<Proyecto>>();
  final Rxn<List<Proyecto>> _todosProyectos = Rxn<List<Proyecto>>();
  final PeticionesProyecto _peticionesProyecto;
  ControlProyecto({PeticionesProyecto? peticionesProyecto})
      : _peticionesProyecto = peticionesProyecto ?? PeticionesProyecto();
  Future<void> consultarProyectos(email) async {
    _proyectoFirestore.value =
        await _peticionesProyecto.consultarProyectos(email);
  }

  Future<void> consultarTodosProyectos() async {
    _todosProyectos.value = await _peticionesProyecto.consultarTodosProyectos();
  }

  Future<void> consultarProyectosDocentes(id) async {
    _proyectoDocenteFirestore.value =
        await _peticionesProyecto.consultarProyectoDocente(id);
  }

  Future<void> eliminarProyecto(proyecto) async {
    await _peticionesProyecto.eliminarProyecto(proyecto);
  }

  List<Proyecto>? get getproyectosGral => _proyectoFirestore.value;
  List<Proyecto>? get getproyectosDocentes => _proyectoDocenteFirestore.value;
  List<Proyecto>? get getTodosproyectos => _todosProyectos.value;

  Future<void> modificarProyecto(proyecto) async {
    await _peticionesProyecto.modificarProyecto(proyecto);
  }

  Future<void> registrarProyecto(Map<String, dynamic> proyecto,
      String? pickedFilePath, String? pickedFileextencion) async {
    try {
      await _peticionesProyecto.crearProyecto(
          proyecto, pickedFilePath, pickedFileextencion);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }
}
