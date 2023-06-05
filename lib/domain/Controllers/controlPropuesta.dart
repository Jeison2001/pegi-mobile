import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/propuesta.dart';

class ControlPropuesta extends GetxController {
  final Rxn<List<Propuesta>> _propuestaFirestore = Rxn<List<Propuesta>>();
  final Rxn<List<Propuesta>> _propuestaIdDocente = Rxn<List<Propuesta>>();
  final Rxn<List<Propuesta>> _todasPropuesta = Rxn<List<Propuesta>>();
  final PeticionesPropuesta peticionesPropuesta = PeticionesPropuesta();
  Future<void> consultarPropuestas(email) async {
    _propuestaFirestore.value =
        await peticionesPropuesta.consultarPropuestas(email);
  }

  Future<void> consultarTodasPropuestas() async {
    _todasPropuesta.value =
        await peticionesPropuesta.consultarTodasPropuestas();
  }

  Future<void> modificarPropuesta(propuesta) async {
    await peticionesPropuesta.modificarPropuesta(propuesta);
  }

  Future<void> eliminarPropuesta(propuesta) async {
    await peticionesPropuesta.eliminarPropuesta(propuesta);
  }

  Future<void> consultarPropuestasDocente(id) async {
    _propuestaIdDocente.value =
        await peticionesPropuesta.consultarPropuestaDocente(id);
  }

  List<Propuesta>? get getPropuestaEstudiante => _propuestaFirestore.value;

  List<Propuesta>? get getPropuestaDocente => _propuestaIdDocente.value;

  List<Propuesta>? get getTodasPropuesta => _todasPropuesta.value;

  Future<void> registrarPropuesta(Map<String, dynamic> propuesta, String? file,
      String? pickedFileextencion) async {
    try {
      await peticionesPropuesta.crearPropuesta(
          propuesta, file, pickedFileextencion);
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
