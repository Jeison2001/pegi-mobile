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
  final PeticionesUsuario _peticionesUsuario;
  ControlUsuario({PeticionesUsuario? peticionesUsuario})
      : _peticionesUsuario = peticionesUsuario ?? PeticionesUsuario();

  String get emailf => _usuarior.value;
  String get uid => _uid.value;
  String get rol => _rol.value;
  List<UsuarioFirebase>? get getListaDocentes => _listaDocentes.value;
  List<String>? get getNombresDocentes => _nombresDocentes.value;

  Future<void> enviarDatos(String user, String contrasena) async {
    try {
      UserCredential usuario =
          await _peticionesUsuario.iniciarSesion(user, contrasena);
      String rolUser = await _peticionesUsuario.obtenerRol(user);
      _rol.value = rolUser;
      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email.toString();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  Future<void> RegistrarDatos(String user, String contrasena) async {
    try {
      bool checkUser = await _peticionesUsuario.verificacionUser(user);
      if (checkUser) {
        UserCredential usuario =
            await _peticionesUsuario.registrar(user, contrasena);
        _uid.value = usuario.user!.uid;
        _usuarior
          ..value = usuario.user!.email
          ..value ??= ''; // Asigna una cadena vacía solo si el valor es null
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
    _listaDocentes.value = await _peticionesUsuario.obtenerDocentes();
  }

  Future<void> consultarNombresDocentes() async {
    _nombresDocentes.value = await _peticionesUsuario.obtenerNombresDocentes();
  }
}
