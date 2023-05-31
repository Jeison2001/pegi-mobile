// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:firebase_storage/firebase_storage.dart';


class PeticionesIndex {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  UploadTask? uploadTask;
  PeticionesIndex({
    this.uploadTask,
  });
  // static Future<String> consultarProyectos() async {
  //   await _db.collection('Proyectos').get().then((QuerySnapshot querySnapshot) {
  //     for (var doc in querySnapshot.docs) {
  //       log(doc.data().toString());
  //     }
  //   });
  //   return "1";
  // }

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
