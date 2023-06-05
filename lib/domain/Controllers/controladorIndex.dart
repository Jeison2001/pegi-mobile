import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesIndex.dart';
import 'package:get/get.dart';

class ControlIndex extends GetxController {
  final PeticionesIndex _peticionesIndex;
  ControlIndex({PeticionesIndex? peticionesIndex})
      : _peticionesIndex = peticionesIndex ?? PeticionesIndex();
  Future<String> consultarIndex() async {
    try {
      return await _peticionesIndex.consultarIndex();
    } on FirebaseAuthException catch (e) {
      log(e.toString()); // aquí muestras el error en el log
      return e.toString(); // aquí devuelves un valor por defecto
    }
  }
}
