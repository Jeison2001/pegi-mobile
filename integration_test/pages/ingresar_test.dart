import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/ui/pages/autenticacion/ingresar.dart';
import 'package:pegi/ui/pages/autenticacion/registrar.dart';
import 'package:pegi/ui/pages/home.dart';

void main() {
  // Inicializar el controlador de usuario
  Get.put(ControlUsuario());
  Firebase.initializeApp();

  // Crear un widget de prueba para alojar la página de ingresar
  Widget createWidgetForTesting(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  // Grupo de pruebas para la página de ingresar
  group('Ingresar page integration tests', () {
    // Prueba para verificar que se navega a la página principal cuando se ingresa con datos válidos
    testWidgets('Navigate to home page when login with valid data',
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

      // Presionar el botón de ingresar y esperar a que se navegue a la página principal
      await tester.tap(loginButtonFinder);
      await tester.pumpAndSettle();

      // Verificar que se encuentra la página principal en el árbol de widgets
      expect(find.byType(HomePage), findsOneWidget);
    });

    // Prueba para verificar que se muestra un snackbar cuando se ingresa con datos inválidos
    testWidgets('Show snackbar when login with invalid data',
        (WidgetTester tester) async {
      // Crear la página de ingresar y hacerla visible
      await tester.pumpWidget(createWidgetForTesting(const Ingresar()));

      // Encontrar los campos de correo y contraseña por el tipo de widget
      final emailFieldFinder = find.byType(TextField).first;
      final passwordFieldFinder = find.byType(TextField).last;

      // Encontrar el botón de ingresar por el tipo de widget
      final loginButtonFinder = find.byType(ElevatedButton);

      // Ingresar un correo y una contraseña inválidos y esperar a que se actualice la interfaz
      await tester.enterText(emailFieldFinder, 'test@gmail.com');
      await tester.enterText(passwordFieldFinder, 'wrong');
      await tester.pump();

      // Presionar el botón de ingresar y esperar a que se muestre el snackbar
      await tester.tap(loginButtonFinder);
      await tester.pump();

      // Verificar que se encuentra el snackbar en el árbol de widgets
      expect(find.byType(SnackBar), findsOneWidget);
    });

    // Prueba para verificar que se navega a la página de registrarse cuando se presiona el botón de registrarse
    testWidgets('Navigate to register page when register button is pressed',
        (WidgetTester tester) async {
      // Crear la página de ingresar y hacerla visible
      await tester.pumpWidget(createWidgetForTesting(const Ingresar()));

      // Encontrar el botón de registrarse por el tipo de widget
      final registerButtonFinder = find.byType(TextButton);

      // Presionar el botón de registrarse y esperar a que se navegue a la página de registrarse
      await tester.tap(registerButtonFinder);
      await tester.pumpAndSettle();

      // Verificar que se encuentra la página de registrarse en el árbol de widgets
      expect(find.byType(Registrar), findsOneWidget);
    });
  });
}
