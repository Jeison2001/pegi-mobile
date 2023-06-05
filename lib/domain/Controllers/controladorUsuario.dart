import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesUsuario.dart';
import 'package:get/get.dart';
import '../models/usuario.dart';

class ControlUsuario extends GetxController {
  final Rx<dynamic> _usuarior = "Sin Registro".obs;
  static final Rx<dynamic> _uid = "".obs;
  static final Rx<dynamic> _rol = "".obs;
  final Rxn<List<UsuarioFirebase>> _listaDocentes =
      Rxn<List<UsuarioFirebase>>();
  final Rxn<List<String>> _nombresDocentes = Rxn<List<String>>();
  final PeticionesUsuario peticionesUsuario = PeticionesUsuario();
  static final Rx<dynamic> _mensajes = "".obs;

  String get emailf => _usuarior.value;
  String get uid => _uid.value;
  String get rol => _rol.value;
  List<UsuarioFirebase>? get getListaDocentes => _listaDocentes.value;
  List<String>? get getNombresDocentes => _nombresDocentes.value;

  Future<void> enviarDatos(String user, String contrasena) async {
    try {
      UserCredential usuario =
          await peticionesUsuario.iniciarSesion(user, contrasena);
      String rolUser = await peticionesUsuario.obtenerRol(user);
      _rol.value = rolUser;
      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      // if (e.code == 'user-not-found') {
      //   return Future.error('Usuario no Existe');
      // } else if (e.code == 'wrong-password') {
      //   return Future.error('Contraseña Incorrecta');
      // }
    }
  }

  Future<void> RegistrarDatos(String user, String contrasena) async {
    try {
      bool checkUser = await peticionesUsuario.verificacionUser(user);
      if (checkUser) {
        UserCredential usuario =
            await peticionesUsuario.registrar(user, contrasena);
        _uid.value = usuario.user!.uid;
        _usuarior.value = usuario.user!.email;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('The account already exists for that email.');
      }
    }
  }

  Future<void> consultarListaDocentes() async {
    _listaDocentes.value = await peticionesUsuario.obtenerDocentes();
  }

  Future<void> consultarNombresDocentes() async {
    _nombresDocentes.value = await peticionesUsuario.obtenerNombresDocentes();
  }
}
