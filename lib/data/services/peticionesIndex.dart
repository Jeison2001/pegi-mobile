import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PeticionesIndex {
  final FirebaseFirestore _db;
  final UploadTask? uploadTask;

  PeticionesIndex({FirebaseFirestore? db, this.uploadTask})
      : _db = db ?? FirebaseFirestore.instance;

  Future consultarIndex() async {
    var response;
    int indice = 0;
    await _db.collection("PropuestaIndex").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        response = doc.data().values;
        for (var doc in respuesta.docs) {
          indice = (doc.data()['index']);
          response = (doc.data()['index']);
        }
      }
      indice = (indice + 1);
    });
    await actualizarIndex({'index': indice});
    return response?.toString() ?? '';
  }

  Future<void> actualizarIndex(Map<String, dynamic> propuesta) async {
    await _db
        .collection('PropuestaIndex')
        .doc('campo')
        .update(propuesta)
        .catchError((e) {
      log(e);
    });
  }
}
