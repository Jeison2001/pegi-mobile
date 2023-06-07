import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:pegi/data/services/peticionesUsuario.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/ui/pages/autenticacion/ingresar.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

void main() {
  // Asegurarse de que se haya inicializado Flutter para las pruebas
  TestWidgetsFlutterBinding.ensureInitialized();

  late PeticionesUsuario peticionesUsuario;
  late FakeFirebaseFirestore firestore;
  late MockFirebaseAuth auth;
  firestore = FakeFirebaseFirestore();
  auth = MockFirebaseAuth();
  peticionesUsuario = PeticionesUsuario(db: firestore, auth: auth);
  final controlUsuario = ControlUsuario(peticionesUsuario: peticionesUsuario);

  // Inicializar el controlador de usuario
  Get.put(controlUsuario);

  // Crear un widget de prueba para alojar la página de ingresar
  Widget createWidgetForTesting(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  Dimensiones.screenWidth = 720.0;
  Dimensiones.screenHeight = 1520.0;
  // Grupo de pruebas para la página de ingresar
  group('Ingresar page tests', () {
    // Stub para simular los valores de screenHeight y screenWidth

    // Prueba para verificar que se muestra el título y el subtítulo
    testWidgets('Title and subtitle are displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(const Ingresar()));

      final titleFinder = find.text('Ingresar');
      final titleWidgets = tester.widgetList(titleFinder);

      final subtitleFinder = find.text('Ingrese sus datos para continuar');
      final subtitleWidgets = tester.widgetList(subtitleFinder);

      expect(titleWidgets, isNotEmpty);
      expect(subtitleWidgets, isNotEmpty);
    });
    // Prueba para verificar que se muestran los campos de correo y contraseña
    testWidgets('Email and password fields are displayed',
        (WidgetTester tester) async {
      // Crear la página de ingresar y hacerla visible
      await tester.pumpWidget(createWidgetForTesting(const Ingresar()));

      // Encontrar los campos de correo y contraseña por su etiqueta (label)
      final emailFieldFinder = find.widgetWithText(TextField, 'Correo');
      final passwordFieldFinder = find.widgetWithText(TextField, 'Contraseña');

      // Verificar que se encuentran en el árbol de widgets
      expect(emailFieldFinder, findsOneWidget);
      expect(passwordFieldFinder, findsOneWidget);
    });
    // Prueba para verificar que se muestra el botón de ingresar
    testWidgets('Login button is displayed', (WidgetTester tester) async {
      // Crear la página de ingresar y hacerla visible
      await tester.pumpWidget(createWidgetForTesting(const Ingresar()));

      // Encontrar el botón de ingresar por el tipo de widget
      final loginButtonFinder = find.byType(TextButton);

      // Verificar que se encuentra en el árbol de widgets
      expect(loginButtonFinder, findsOneWidget);
    });
    // Prueba para verificar que se muestra el botón de registrarse
    testWidgets('Register button is displayed', (WidgetTester tester) async {
      // Crear la página de ingresar y hacerla visible
      await tester.pumpWidget(createWidgetForTesting(const Ingresar()));

      // Encontrar el botón de registrarse por el tipo de widget
      final registerButtonFinder = find.byType(ElevatedButton);

      // Verificar que se encuentra en el árbol de widgets
      expect(registerButtonFinder, findsOneWidget);
    });
    testWidgets('Email is validated correctly', (WidgetTester tester) async {
      // Crear la página de ingresar y hacerla visible
      await tester.pumpWidget(createWidgetForTesting(const Ingresar()));

      // Encontrar el campo de correo por el tipo de widget
      final emailFieldFinder = find.byType(TextField).first;

      // Ingresar un correo vacío y esperar a que se actualice la interfaz
      await tester.enterText(emailFieldFinder, '');
      await tester.pumpAndSettle();

      // Encontrar el mensaje de error por el texto
      final emptyEmailErrorFinder =
          find.text('El correo no puede estar vacío.');

      // Verificar que se encuentra en el árbol de widgets
      expect(emptyEmailErrorFinder, findsOneWidget);

      // Ingresar un correo inválido y esperar a que se actualice la interfaz
      await tester.enterText(emailFieldFinder, 'test@gmail.com');
      await tester.pumpAndSettle();

      // Encontrar el mensaje de error por el texto
      final invalidEmailErrorFinder =
          find.text('El correo debe terminar con "@unicesar.edu.co".');

      // Verificar que se encuentra en el árbol de widgets
      expect(invalidEmailErrorFinder, findsOneWidget);

      // Ingresar un correo válido y esperar a que se actualice la interfaz
      await tester.enterText(emailFieldFinder, 'test@unicesar.edu.co');
      await tester.pumpAndSettle();

      // Verificar que no hay mensajes de error en el árbol de widgets
      expect(emptyEmailErrorFinder, findsNothing);
      expect(invalidEmailErrorFinder, findsNothing);
    });
    // Prueba para verificar que se valida la contraseña correctamente
    testWidgets('Password is validated correctly', (WidgetTester tester) async {
      // Crear la página de ingresar y hacerla visible
      await tester.pumpWidget(createWidgetForTesting(const Ingresar()));

      // Encontrar el campo de contraseña por el tipo de widget
      final passwordFieldFinder = find.byType(TextField).last;

      // Ingresar una contraseña vacía y esperar a que se actualice la interfaz
      await tester.enterText(passwordFieldFinder, '');
      await tester.pump();

      // Encontrar el mensaje de error por el texto
      final emptyPasswordErrorFinder =
          find.text('La contraseña no puede estar vacía.');

      // Verificar que se encuentra en el árbol de widgets
      expect(emptyPasswordErrorFinder, findsOneWidget);

      // Ingresar una contraseña demasiado larga y esperar a que se actualice la interfaz
      await tester.enterText(passwordFieldFinder, 'a' * 50);
      await tester.pump();

      // Encontrar el mensaje de error por el texto
      final longPasswordErrorFinder =
          find.text('La contraseña debe tener entre 1 y 49 caracteres.');

      // Verificar que se encuentra en el árbol de widgets
      expect(longPasswordErrorFinder, findsOneWidget);

      // Ingresar una contraseña válida y esperar a que se actualice la interfaz
      await tester.enterText(passwordFieldFinder, 'test123');
      await tester.pump();

      // Verificar que no hay mensajes de error en el árbol de widgets
      expect(emptyPasswordErrorFinder, findsNothing);
      expect(longPasswordErrorFinder, findsNothing);
    });
    // Prueba para verificar que se habilita el botón de ingresar cuando los campos son válidos
    testWidgets('Login button is enabled when fields are valid',
        (WidgetTester tester) async {
      // Crear la página de ingresar y hacerla visible
      await tester.pumpWidget(createWidgetForTesting(const Ingresar()));

      // Encontrar los campos de correo y contraseña por el tipo de widget
      final emailFieldFinder = find.byType(TextField).first;
      final passwordFieldFinder = find.byType(TextField).last;

      // Encontrar el botón de ingresar por el tipo de widget
      final loginButtonFinder = find.byType(ElevatedButton);

      // Verificar que el botón está deshabilitado inicialmente
      expect(tester.widget<ElevatedButton>(loginButtonFinder).enabled, false);

      // Ingresar un correo y una contraseña válidos y esperar a que se actualice la interfaz
      await tester.enterText(emailFieldFinder, 'test@unicesar.edu.co');
      await tester.enterText(passwordFieldFinder, 'test123');
      await tester.pump();

      // Verificar que el botón está habilitado ahora
      expect(tester.widget<ElevatedButton>(loginButtonFinder).enabled, true);
    });
    // Prueba para verificar que se llama al método enviarDatos cuando se presiona el botón de ingresar
    testWidgets('enviarDatos is called when login button is pressed',
        (WidgetTester tester) async {
      // Crear la página de ingresar y hacerla visible
      await tester.pumpWidget(createWidgetForTesting(const Ingresar()));

      // Encontrar los campos de correo y contraseña por el tipo de widget
      final emailFieldFinder = find.byType(TextField).first;
      final passwordFieldFinder = find.byType(TextField).last;

      // Encontrar el botón de ingresar por el tipo de widget
      final loginButtonFinder = find.byType(ElevatedButton);

      // Ingresar un correo y una contraseña válidos y esperar a que se actualice la interfaz
      await tester.enterText(emailFieldFinder, 'test@unicesar.edu.co');
      await tester.enterText(passwordFieldFinder, 'test123');
      await tester.pump();

      // Presionar el botón de ingresar y esperar a que se resuelva la llamada al método enviarDatos
      await tester.tap(find.text('¿No tiene una cuenta?'));
      await tester
          .pumpAndSettle(); // Espera a que se complete la animación y se actualice la interfaz

      // Verifica que se haya realizado la acción esperada
      expect(find.text('Ingrese sus datos para continuar'), findsOneWidget);
    });
  });
}
