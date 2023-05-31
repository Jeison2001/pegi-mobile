import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/propuesta.dart';

class ControlPropuesta extends GetxController {
  final Rxn<List<Propuesta>> _propuestaFirestore = Rxn<List<Propuesta>>();
  final Rxn<List<Propuesta>> _propuestaIdDocente = Rxn<List<Propuesta>>();
  final Rxn<List<Propuesta>> _todasPropuesta = Rxn<List<Propuesta>>();

  Future<void> consultarPropuestas(email) async {
    _propuestaFirestore.value =
        await PeticionesPropuesta.consultarPropuestas(email);
  }

  Future<void> consultarTodasPropuestas() async {
    _todasPropuesta.value =
        await PeticionesPropuesta.consultarTodasPropuestas();
  }

  Future<void> modificarPropuesta(propuesta) async {
    await PeticionesPropuesta.modificarPropuesta(propuesta);
  }

  Future<void> eliminarPropuesta(propuesta) async {
    await PeticionesPropuesta.eliminarPropuesta(propuesta);
  }

  Future<void> consultarPropuestasDocente(id) async {
    _propuestaIdDocente.value =
        await PeticionesPropuesta.consultarPropuestaDocente(id);
  }

  List<Propuesta>? get getPropuestaEstudiante => _propuestaFirestore.value;

  List<Propuesta>? get getPropuestaDocente => _propuestaIdDocente.value;

  List<Propuesta>? get getTodasPropuesta => _todasPropuesta.value;

  Future<void> registrarPropuesta(Map<String, dynamic> propuesta, String? file,
      String? pickedFileextencion) async {
    try {
      await PeticionesPropuesta.crearPropuesta(
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
