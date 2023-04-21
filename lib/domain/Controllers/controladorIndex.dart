import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesIndex.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:get/get.dart';

class ControlIndex extends GetxController {
  Future consultarIndex() async {
    try {
      return await PeticionesIndex.consultarIndex();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }
}
