import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pegi/data/services/peticionesUsuario.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/domain/models/usuario.dart';
@GenerateMocks([PeticionesUsuario, UserCredential])
import 'ControlUsuario_test.mocks.dart';

void main() {
  // Crea un objeto ControlUsuario con un mock de PeticionesUsuario
  final mockPeticionesUsuario = MockPeticionesUsuario();
  final controlUsuario =
      ControlUsuario(peticionesUsuario: mockPeticionesUsuario);

  // Define el usuario y la contraseña que quieres usar para el test
  final user = 'test';
  final contrasena = '123456';

  // Define el rol y el uid que esperas que te devuelva el método
  final rolEsperado = 'administrador';
  final uidEsperado = 'abc123';

  // Configura el mock de PeticionesUsuario para que devuelva los valores esperados
  when(mockPeticionesUsuario.iniciarSesion(user, contrasena)).thenAnswer(
      (_) async =>
          MockUserCredential(user: MockUser(uid: uidEsperado, email: user)));
  when(mockPeticionesUsuario.obtenerRol(user))
      .thenAnswer((_) async => rolEsperado);
  // Configura el mock de PeticionesUsuario para devolver true al llamar a verificacionUser
  when(mockPeticionesUsuario.verificacionUser(user))
      .thenAnswer((_) async => true);

  // Escribe el test usando la función testWidgets
  testWidgets('enviarDatos devuelve el rol y el uid del usuario',
      (WidgetTester tester) async {
    // Llama al método enviarDatos con el usuario y la contraseña del test
    await controlUsuario.enviarDatos(user, contrasena);

    // Comprueba que el rol y el uid del controlUsuario son los esperados
    expect(controlUsuario.rol, rolEsperado);
    expect(controlUsuario.uid, uidEsperado);
  });
  group('RegistrarDatos', () {
    test('debería registrar un nuevo usuario con email y contraseña', () async {
      // Arrange
      final mockPeticionesUsuario = MockPeticionesUsuario();
      final controlUsuario =
          ControlUsuario(peticionesUsuario: mockPeticionesUsuario);
      final userCredential =
          MockUserCredential(user: MockUser(uid: uidEsperado, email: user));
      when(mockPeticionesUsuario.verificacionUser(user))
          .thenAnswer((_) async => true);
      when(mockPeticionesUsuario.registrar(user, contrasena))
          .thenAnswer((_) async => userCredential);
      // Act
      await controlUsuario.RegistrarDatos(user, contrasena);
      // Assert
      expect(controlUsuario.uid, uidEsperado);
      expect(controlUsuario.emailf, user);
    });

    test('debería lanzar un error si la contraseña es débil', () async {
      // Arrange
      final mockPeticionesUsuario = MockPeticionesUsuario();
      final controlUsuario =
          ControlUsuario(peticionesUsuario: mockPeticionesUsuario);
      when(mockPeticionesUsuario.verificacionUser(user))
          .thenAnswer((_) async => true);
      when(mockPeticionesUsuario.registrar(user, contrasena)).thenThrow(
          FirebaseAuthException(
              code: 'weak-password', message: 'Contraseña débil'));
      // Act
      final result = controlUsuario.RegistrarDatos(user, contrasena);
      // Assert
      expectLater(result, throwsA(isA<String>()));
    });
  });

  test('debería lanzar un error si el correo electrónico ya existe', () async {
    // Arrange
    final mockPeticionesUsuario = MockPeticionesUsuario();
    final controlUsuario =
        ControlUsuario(peticionesUsuario: mockPeticionesUsuario);
    when(mockPeticionesUsuario.verificacionUser(user))
        .thenAnswer((_) async => true);
    when(mockPeticionesUsuario.registrar(user, contrasena)).thenThrow(
        FirebaseAuthException(
            code: 'email-already-in-use',
            message: 'Correo electrónico en uso'));
    // Act
    final result = controlUsuario.RegistrarDatos(user, contrasena);
    // Assert
    expectLater(result, throwsA(isA<String>()));
  });
  test('debería obtener una lista de profesores desde la base de datos',
      () async {
    // Arrange
    final mockPeticionesUsuario = MockPeticionesUsuario();
    final controlUsuario =
        ControlUsuario(peticionesUsuario: mockPeticionesUsuario);
    final listaDocentes = [
      UsuarioFirebase(nombre: 'Juan', rol: 'docente', correo: 's'),
      UsuarioFirebase(nombre: 'Ana', rol: 'docente', correo: 'a'),
      UsuarioFirebase(nombre: 'Pedro', rol: 'docente', correo: 'p'),
    ];
    when(mockPeticionesUsuario.obtenerDocentes())
        .thenAnswer((_) async => listaDocentes);
    // Act
    await controlUsuario.consultarListaDocentes();
    // Assert
    expect(controlUsuario.getListaDocentes, equals(listaDocentes));
  });
  test(
      'debería obtener una lista de nombres de profesores desde la base de datos',
      () async {
    // Arrange
    final mockPeticionesUsuario = MockPeticionesUsuario();
    final controlUsuario =
        ControlUsuario(peticionesUsuario: mockPeticionesUsuario);
    final nombresDocentes = ['Juan', 'Ana', 'Pedro'];
    when(mockPeticionesUsuario.obtenerNombresDocentes())
        .thenAnswer((_) async => nombresDocentes);
    // Act
    await controlUsuario.consultarNombresDocentes();
    // Assert
    expect(controlUsuario.getNombresDocentes, equals(nombresDocentes));
  });
}
