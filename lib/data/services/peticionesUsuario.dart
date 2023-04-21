import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/usuario.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pegi/ui/pages/autenticacion/registrar.dart';

class PeticionesUsuario {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final FirebaseAuth authf = FirebaseAuth.instance;

  static Future<UserCredential> iniciarSesion(
      String user, String contrasena) async {
    try {
      return await authf.signInWithEmailAndPassword(
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

  static Future<UserCredential> registrar(
      String user, String contrasena) async {
    try {
      return await authf.createUserWithEmailAndPassword(
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

  static Future<String> obtenerRol(user) async {
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

  static Future<List<UsuarioFirebase>> obtenerDocentes() async {
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

  static Future<List<String>> obtenerNombresDocentes() async {
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

  static Future<bool> verificacionUser(user) async {
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

 

  // static Future<List<Usuario>> validarUsuario(
  //     String usuario, String contrasena) async {
  //   var url = Uri.parse("");
  //   final respuesta =
  //       await http.post(url, body: {'Usuario': usuario, 'pass': contrasena});
  //   return compute(convertir, respuesta.body);
  // }

  // static List<Usuario> convertir(String respuestaBody) {
  //   final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

  //   return pasar.map<Usuario>((json) => Usuario.desdeJson(json)).toList();
  // }

