import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/domain/models/usuario.dart';

class PeticionesUsuario {
  final FirebaseFirestore _db;
  final FirebaseAuth _auth;
  PeticionesUsuario({FirebaseFirestore? db, FirebaseAuth? auth})
      : _db = db ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;
  Future<UserCredential> iniciarSesion(String user, String contrasena) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: user, password: contrasena);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('Usuario no Existe');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña Incorrecta');
      }
    }
    return Future.error('Error');
  }

  Future<UserCredential> registrar(String user, String contrasena) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: user, password: contrasena);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('The account already exists for that email.');
      }
    }
    return Future.error('Error');
  }

  Future<String> obtenerRol(user) async {
    var response = "";

    await _db.collection("Usuarios").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['correo'] == user) {
          response = (doc.data()['rol']);
          log(doc.data()['rol'].toString());
        }
      }
    });
    return response;
  }

  Future<List<UsuarioFirebase>> obtenerDocentes() async {
    List<UsuarioFirebase> docentes = [];

    await _db.collection("Usuarios").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['rol'] == 'docente') {
          log(doc.data()["nombre"]);
          docentes.add(UsuarioFirebase.desdeDoc(doc.data()));
        }
      }
    });
    return docentes;
  }

  Future<List<String>> obtenerNombresDocentes() async {
    List<String> docentes = [];

    await _db.collection("Usuarios").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['rol'] == 'docente') {
          log(doc.data()["nombre"]);
          docentes.add(doc.data()["nombre"]);
        }
      }
    });
    return docentes;
  }

  Future<bool> verificacionUser(user) async {
    bool correoCheck = false;
    await _db.collection("Usuarios").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['correo'] == user) {
          correoCheck = true;
        }
      }
    });
    return correoCheck;
  }
}
