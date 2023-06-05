import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pegi/domain/models/proyecto.dart';

class PeticionesProyecto {
  final FirebaseFirestore _db;
  final FirebaseStorage _storage;
  UploadTask? uploadTask;
  PeticionesProyecto(
      {FirebaseFirestore? db, FirebaseStorage? storage, this.uploadTask})
      : _db = db ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instance;

  Future<void> crearProyecto(Map<String, dynamic> proyecto, String? file,
      String? pickedFileextencion) async {
    var url;
    if (file != null) {
      url = await uploadFile(
          file, proyecto['idProyecto'], uploadTask, pickedFileextencion);
    } else {
      log("es null");

      url = '';
    }
    proyecto['anexos'] = url.toString();

    await _db
        .collection('Proyectos')
        .doc(proyecto['Campo'])
        .set(proyecto)
        .catchError((e) {});
  }

  Future<dynamic> uploadFile(String? file, idProyecto, UploadTask? uploadTask,
      String? pickedFileextencion) async {
    String? r;
    final path = 'anexo/$idProyecto.$pickedFileextencion';
    if (file != null) {
      final ref = _storage.ref().child(path);
      log(file.toString());
      uploadTask = ref.putFile(File(file));
      final snaphot = await uploadTask.whenComplete(() {});

      final urlDownload = await snaphot.ref.getDownloadURL();
      r = urlDownload;
      log('Link de descarga: $urlDownload');
    }

    return r;
  }

  Future<List<Proyecto>> consultarProyectos(email) async {
    List<Proyecto> lista = [];
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idEstudiante'] == email) {
          lista.add(Proyecto.desdeDoc(doc.data()));
        }
      }
    });
    return lista;
  }

  Future<List<Proyecto>> consultarTodosProyectos() async {
    List<Proyecto> lista = [];
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        lista.add(Proyecto.desdeDoc(doc.data()));
      }
    });

    return lista;
  }

  Future<List<Proyecto>> consultarProyectoDocente(id) async {
    List<Proyecto> lista = [];
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idDocente'] == id) {
          lista.add(Proyecto(
            titulo: doc.data()['titulo'],
            idEstudiante: doc.data()['idEstudiante'],
            anexos: doc.data()['anexos'],
            estado: doc.data()['estado'],
            calificacion: doc.data()['calificacion'],
            idDocente: doc.data()['idDocente'],
            idProyecto: doc.data()['idProyecto'],
            retroalimentacion: doc.data()['retroalimentacion'],
          ));
        }
      }
    });

    return lista;
  }

  Future<void> modificarProyecto(Map<String, dynamic> proyecto) async {
    await _db.collection("Proyectos").get().then((respuesta) async {
      for (var doc in respuesta.docs) {
        if (doc.data()['idProyecto'] == proyecto['idProyecto']) {
          await _db
              .collection('Proyectos')
              .doc(doc.id)
              .update(proyecto)
              .catchError((e) {
            log(e);
          });
        }
      }
    });
  }

  Future<void> eliminarProyecto(String idproyecto) async {
    await _db.collection("Proyectos").get().then((respuesta) async {
      for (var doc in respuesta.docs) {
        if (doc.data()['idProyecto'] == idproyecto) {
          await _db
              .collection('Proyectos')
              .doc(doc.id)
              .delete()
              .catchError((e) {
            log(e);
          });
        }
      }
    });
  }

  Future contadorProyecto(id, String estado) async {
    var contador = 0;
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idDocente'] == id) {
          if (doc.data()['estado'].toLowerCase() == estado.toLowerCase()) {
            contador += 1;
          }
        }
      }
    });
    return contador;
  }

  Future contadorPro(id) async {
    var contador = 0;
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idDocente'] == id) {
          contador += 1;
        }
      }
    });
    return contador;
  }

  Future contadorProyec() async {
    var contador = 0;
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['estado'] == 'Calificado') {
          contador += 1;
        }
      }
    });
    return contador;
  }

  Future contadorProy() async {
    var contador = 0;
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        contador += 1;
      }
    });
    return contador;
  }

  Future coProyeEst(email) async {
    var contador = 0;
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idDocente'] != '') {
          if (doc.data()['idEstudiante'] == email) {
            contador += 1;
          }
        }
      }
    });
    return contador;
  }

  Future conProyeEst(email) async {
    var contador = 0;
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idEstudiante'] == email) {
          contador += 1;
        }
      }
    });
    return contador;
  }

  Future conProyecEst(email, String estado) async {
    var contador = 0;
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idEstudiante'] == email) {
          if (doc.data()['estado'].toLowerCase() == estado.toLowerCase()) {
            contador += 1;
          }
        }
      }
    });
    return contador;
  }

  Future<void> actualizarIndex(Map<String, dynamic> propuesta) async {}
}
