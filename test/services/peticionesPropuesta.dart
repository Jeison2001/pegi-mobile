import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pegi/domain/models/propuesta.dart';

class PeticionesPropuesta {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static UploadTask? uploadTask;

  static Future<void> crearPropuesta(Map<String, dynamic> propuesta,
      String? file, String? pickedFileextencion) async {
    var url;
    if (file != null) {
      url = await uploadFile(
          file, propuesta['idPropuesta'], uploadTask, pickedFileextencion);
    } else {
      log("es null");

      url = '';
    }

    propuesta['anexos'] = url.toString();

    await _db
        .collection('Propuesta')
        .doc(propuesta['Campo'])
        .set(propuesta)
        .catchError((e) {});
    //return "true";
  }

  // static Future<dynamic> cargaranexos(var anexos, var idArt) async {
  //   final fs.Reference storageReference =
  //       fs.FirebaseStorage.instance.ref().child("Propuesta");

  //   fs.TaskSnapshot taskSnapshot =
  //       await storageReference.child(idArt).putFile(anexos);

  //   var url = await taskSnapshot.ref.getDownloadURL();

  //   return url.toString();
  // }

  static Future<dynamic> uploadFile(String? file, idPropuesta,
      UploadTask? uploadTask, String? pickedFileextencion) async {
    String? r;
    final path = 'anexo/$idPropuesta.$pickedFileextencion';
    if (file != null) {
      final ref = FirebaseStorage.instance.ref().child(path);
      log(file.toString());
      uploadTask = ref.putFile(File(file));
      final snaphot = await uploadTask.whenComplete(() {});

      final urlDownload = await snaphot.ref.getDownloadURL();
      r = urlDownload;
      log('Link de descarga: $urlDownload');
    }

    return r;
  }

  // static Future<void> actualizarArticulo(
  //     String id, Map<String, dynamic> propuesta) async {
  //   await _db.collection('Articulos').doc(id).update(propuesta).catchError((e) {
  //     log(e);
  //   });
  //   //return true;
  // }

  // static Future<void> eliminarpropuesta(String id) async {
  //   await _db.collection('Articulos').doc(id).delete().catchError((e) {
  //     log(e);
  //   });
  //   //return true;
  // }

  // static Future<List<Propuesta>> consultarGral() async {
  //   List<Propuesta> lista = [];
  //   await _db.collection("Articulos").get().then((respuesta) {
  //     for (var doc in respuesta.docs) {
  //       log(doc.data().toString());
  //       lista.add(Propuesta.desdeDoc(doc.data()));
  //     }
  //   });

  //   return lista;
  // }

  // static Future<List<Propuesta>> consultarG(String id) async {
  //   List<Propuesta> lista = [];
  //   await _db.collection("Usuarios").get().then((respuesta) {
  //     for (var doc in respuesta.docs) {
  //       log(doc.data().toString());
  //       lista.add(Propuesta.desdeDoc(doc.data()));
  //     }
  //   });

  //   return lista;
  // }
  static Future<List<Propuesta>> consultarTodasPropuestas() async {
    List<Propuesta> lista = [];
    await _db.collection("Propuesta").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        lista.add(Propuesta.desdeDoc(doc.data()));
      }
    });
    return lista;
  }

  static Future<List<Propuesta>> consultarPropuestas(email) async {
    List<Propuesta> lista = [];
    await _db.collection("Propuesta").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idEstudiante'] == email) {
          lista.add(Propuesta.desdeDoc(doc.data()));
        }
      }
    });
    return lista;
  }

  static Future<List<Propuesta>> consultarPropuestaDocente(docente) async {
    List<Propuesta> lista = [];
    await _db.collection("Propuesta").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idDocente'] == docente) {
          lista.add(Propuesta.desdeDoc(doc.data()));
        }
      }
    });
    return lista;
  }

  static Future<void> modificarPropuesta(Map<String, dynamic> propuesta) async {
    await _db.collection("Propuesta").get().then((respuesta) async {
      for (var doc in respuesta.docs) {
        if (doc.data()['idPropuesta'] == propuesta['idPropuesta']) {
          await _db
              .collection('Propuesta')
              .doc(doc.id)
              .update(propuesta)
              .catchError((e) {
            log(e);
          });
        }
      }
    });
  }

  static Future<void> asignarEvaluadorPropuesta(
      Map<String, dynamic> propuesta) async {
    await _db.collection("Propuesta").get().then((respuesta) async {
      for (var doc in respuesta.docs) {
        if (doc.data()['idPropuesta'] == propuesta['idPropuesta']) {
          await _db
              .collection('Propuesta')
              .doc(doc.id)
              .update(propuesta)
              .catchError((e) {
            log(e);
          });
        }
      }
    });
  }

  Future contadorPropuesta(id, String estado) async {
    var contador = 0;
    await _db.collection("Propuesta").get().then((respuesta) {
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

  Future contadorProp(id) async {
    var contador = 0;
    await _db.collection("Propuesta").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idDocente'] == id) {
          contador += 1;
        }
      }
    });
    return contador;
  }

  Future contadorPropAdmin() async {
    var contador = 0;
    await _db.collection("Propuesta").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['estado'] == 'Calificado') {
          contador += 1;
        }
      }
    });
    return contador;
  }

  Future contadorPropAdm() async {
    var contador = 0;
    await _db.collection("Propuesta").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        contador += 1;
      }
    });
    return contador;
  }

  static Future<void> eliminarPropuesta(String idPropuesta) async {
    await _db.collection("Propuesta").get().then((respuesta) async {
      for (var doc in respuesta.docs) {
        if (doc.data()['idPropuesta'] == idPropuesta) {
          await _db
              .collection('Propuesta')
              .doc(doc.id)
              .delete()
              .catchError((e) {
            log(e);
          });
        }
      }
    });
  }

  Future coPropEst(email) async {
    var contador = 0;
    await _db.collection("Propuesta").get().then((respuesta) {
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

  Future conPropE(email) async {
    var contador = 0;
    await _db.collection("Propuesta").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idEstudiante'] == email) {
          contador += 1;
        }
      }
    });
    return contador;
  }

  Future conPropuEst(email, String estado) async {
    var contador = 0;
    await _db.collection("Propuesta").get().then((respuesta) {
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
}
