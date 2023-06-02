import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/domain/models/usuario.dart';

void main() {
  group('Usuario', () {
    test('Constructor creates an instance with the correct values', () {
      final usuario = Usuario(
        id: '1',
        nombre: 'John Doe',
        usuario: 'johndoe',
        contrasena: 'password',
        rol: 'user',
      );

      expect(usuario.id, '1');
      expect(usuario.nombre, 'John Doe');
      expect(usuario.usuario, 'johndoe');
      expect(usuario.contrasena, 'password');
      expect(usuario.rol, 'user');
    });

    test('fromJson creates an instance with the correct values', () {
      final json = {
        'id': '1',
        'nombre': 'John Doe',
        'usuario': 'johndoe',
        'contrasena': 'password',
        'rol': 'user',
      };

      final usuario = Usuario.desdeJson(json);

      expect(usuario.id, '1');
      expect(usuario.nombre, 'John Doe');
      expect(usuario.usuario, 'johndoe');
      expect(usuario.contrasena, 'password');
      expect(usuario.rol, 'user');
    });
  });

  group('UsuarioFirebase', () {
    test('Constructor creates an instance with the correct values', () {
      final usuario = UsuarioFirebase(
        nombre: 'John Doe',
        correo: 'johndoe@example.com',
        rol: 'user',
      );

      expect(usuario.nombre, 'John Doe');
      expect(usuario.correo, 'johndoe@example.com');
      expect(usuario.rol, 'user');
    });

    test('fromDoc creates an instance with the correct values', () {
      final data = {
        'nombre': 'John Doe',
        'correo': 'johndoe@example.com',
        'rol': 'user',
      };

      final usuario = UsuarioFirebase.desdeDoc(data);

      expect(usuario.nombre, 'John Doe');
      expect(usuario.correo, 'johndoe@example.com');
      expect(usuario.rol, 'user');
    });
  });
}
