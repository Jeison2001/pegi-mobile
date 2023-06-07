import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesIndex.dart';
import 'package:get/get.dart';

class ControlIndex extends GetxController {
  final PeticionesIndex _peticionesIndex;
  ControlIndex({PeticionesIndex? peticionesIndex})
      : _peticionesIndex = peticionesIndex ?? PeticionesIndex();
  Future consultarIndex() async {
    try {
      return await _peticionesIndex.consultarIndex();
    } on FirebaseAuthException catch (e) {
      return e; // aquí devuelves un valor por defecto
    }
  }
}
