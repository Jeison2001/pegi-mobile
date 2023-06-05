import 'package:firebase_auth/firebase_auth.dart';
import 'package:test/test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:pegi/domain/models/usuario.dart';
import 'package:pegi/data/services/peticionesUsuario.dart';

void main() {
  group('PeticionesUsuario', () {
    late PeticionesUsuario peticionesUsuario;
    late FakeFirebaseFirestore firestore;
    late MockFirebaseAuth auth;

    setUp(() {
      firestore = FakeFirebaseFirestore();
      auth = MockFirebaseAuth();
      peticionesUsuario = PeticionesUsuario(db: firestore, auth: auth);
    });

    test(
        'iniciarSesion devuelve UserCredential si el usuario y la contraseña son correctos',
        () async {
      // Arrange
      final user = 'test@test.com';
      final password = '123456';
      await auth.createUserWithEmailAndPassword(
          email: user, password: password);

      // Act
      final result = await peticionesUsuario.iniciarSesion(user, password);

      // Assert
      expect(result, isA<UserCredential>());
      expect(result.user?.email, equals(user));
    });

    test('registrar devuelve UserCredential si se registra correctamente',
        () async {
      // Arrange
      final user = 'test@test.com';
      final password = '123456';

      // Act
      final result = await peticionesUsuario.registrar(user, password);

      // Assert
      expect(result, isA<UserCredential>());
      expect(result.user?.email, equals(user));
    });

    test('obtenerRol devuelve el rol correcto para un usuario existente',
        () async {
      // Arrange
      final user = 'test@test.com';
      final rol = 'docente';
      await firestore.collection('Usuarios').add({'correo': user, 'rol': rol});

      // Act
      final result = await peticionesUsuario.obtenerRol(user);

      // Assert
      expect(result, equals(rol));
    });

    test('obtenerDocentes devuelve una lista de docentes', () async {
      // Arrange
      final docentes = [
        {'nombre': 'Docente 1', 'rol': 'docente'},
        {'nombre': 'Docente 2', 'rol': 'docente'},
        {'nombre': 'Docente 3', 'rol': 'docente'},
      ];
      for (var docente in docentes) {
        await firestore.collection('Usuarios').add(docente);
      }

      // Act
      final result = await peticionesUsuario.obtenerDocentes();

      // Assert
      expect(result, hasLength(docentes.length));
      for (var i = 0; i < docentes.length; i++) {
        expect(result[i].nombre, equals(docentes[i]['nombre']));
        expect(result[i].rol, equals(docentes[i]['rol']));
      }
    });

    test('obtenerNombresDocentes devuelve una lista de nombres de docentes',
        () async {
      // Arrange
      final docentes = [
        {'nombre': 'Docente 1', 'rol': 'docente'},
        {'nombre': 'Docente 2', 'rol': 'docente'},
        {'nombre': 'Docente 3', 'rol': 'docente'},
      ];
      for (var docente in docentes) {
        await firestore.collection('Usuarios').add(docente);
      }

      // Act
      final result = await peticionesUsuario.obtenerNombresDocentes();

      // Assert
      expect(result, hasLength(docentes.length));
      for (var i = 0; i < docentes.length; i++) {
        expect(result[i], equals(docentes[i]['nombre']));
      }
    });

    test('verificacionUser devuelve true si el correo existe', () async {
      // Arrange
      final user = 'test@test.com';
      await firestore.collection('Usuarios').add({'correo': user});

      // Act
      final result = await peticionesUsuario.verificacionUser(user);

      // Assert
      expect(result, isTrue);
    });

    // Resto de las pruebas...
  });
}
