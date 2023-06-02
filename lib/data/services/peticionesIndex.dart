import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:firebase_storage/firebase_storage.dart';

class PeticionesIndex {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  // Agrega este campo final para guardar la instancia de FirebaseFirestore
  final FirebaseFirestore firestore;
  UploadTask? uploadTask;
  // Agrega este parámetro al constructor y asignalo al campo
  PeticionesIndex({
    this.uploadTask,
    required this.firestore,
  });

  static Future<String> consultarIndex() async {
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
    return response.toString();
  }

  static Future<void> actualizarIndex(Map<String, dynamic> propuesta) async {
    await _db
        .collection('PropuestaIndex')
        .doc('campo')
        .update(propuesta)
        .catchError((e) {
      log(e);
    });
  }
}
