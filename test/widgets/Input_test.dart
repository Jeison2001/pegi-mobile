import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/ui/widgets/Input.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

void main() {
  group('Input Widget', () {
    testWidgets('Muestra un mensaje de error cuando la entrada no es válida',
        (WidgetTester tester) async {
      // Crea un TextEditingController
      final TextEditingController controller = TextEditingController();

      // Crea el widget Input
      final Input input = Input(
        false,
        controller,
        'Prueba',
        null,
        null,
        Colors.white,
        Colors.black,
        validationFunction: (String value) {
          if (value != 'valido') {
            return 'Entrada no válida';
          }
          return null;
        },
      );

      // Construye el widget Input
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: input)));

      // Ingresa texto en el TextField
      await tester.enterText(find.byType(TextField), 'no valido');

      // Reconstruye el widget con el nuevo texto
      await tester.pump();

      // Verifica si se muestra el mensaje de error
      expect(find.text('Entrada no válida'), findsOneWidget);
    });

    testWidgets('No muestra mensaje de error cuando la entrada es válida',
        (WidgetTester tester) async {
      // Crea un TextEditingController
      final TextEditingController controller = TextEditingController();

      // Crea el widget Input
      final Input input = Input(
        false,
        controller,
        'Prueba',
        null,
        null,
        Colors.white,
        Colors.black,
        validationFunction: (String value) {
          if (value != 'valido') {
            return 'Entrada no válida';
          }
          return null;
        },
      );

      // Construye el widget Input
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: input)));

      // Ingresa texto válido en el TextField
      await tester.enterText(find.byType(TextField), 'valido');

      // Reconstruye el widget con el nuevo texto
      await tester.pump();

      // Verifica que no se muestre el mensaje de error
      expect(find.text('Entrada no válida'), findsNothing);
    });
  });

  group('InputMedium Widget', () {
    testWidgets('Muestra un mensaje de error cuando la entrada no es válida',
        (WidgetTester tester) async {
      // Define la implementación de Dimensiones para el test
      Dimensiones.screenWidth = 360.0;
      Dimensiones.screenHeight = 640.0;

      final TextEditingController controller = TextEditingController();
      bool showError = false;

      final InputMedium inputMedium = InputMedium(
        controller,
        'Prueba',
        null,
        Colors.black,
        Colors.white,
        validationFunction: (String value) {
          if (value != 'valido') {
            showError = true;
            return 'Entrada no válida';
          }
          showError = false;
          return null;
        },
      );

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: inputMedium)));

      await tester.enterText(find.byType(TextField), 'no valido');
      await tester.pump();

      expect(showError, true);
      expect(find.text('Entrada no válida'), findsOneWidget);
    });

    testWidgets('No muestra mensaje de error cuando la entrada es válida',
        (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();
      bool showError = false;

      final InputMedium inputMedium = InputMedium(
        controller,
        'Prueba',
        null,
        Colors.black,
        Colors.white,
        validationFunction: (String value) {
          if (value != 'valido') {
            showError = true;
            return 'Entrada no válida';
          }
          showError = false;
          return null;
        },
      );

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: inputMedium)));

      await tester.enterText(find.byType(TextField), 'valido');
      await tester.pump();

      expect(showError, false);
      expect(find.text('Entrada no válida'), findsNothing);
    });
  });
  group('InputDownload Widget', () {
    testWidgets('Muestra un mensaje de error cuando la descarga falla',
        (WidgetTester tester) async {
      // Asigna valores de prueba para Dimensiones.screenHeight y Dimensiones.screenWidth
      Dimensiones.screenHeight = 800;
      Dimensiones.screenWidth = 400;

      // Crea el widget InputDownload
      final InputDownload inputDownload = InputDownload(
        texto: 'Descargar',
        icon: Icons.download,
        color: Colors.blue,
        onPressed: () {},
        validationFunction: () {
          return 'Descarga fallida';
        },
      );

      // Construye el widget InputDownload
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: inputDownload)));

      // Verifica si se muestra el mensaje de error
      expect(find.text('Descarga fallida'), findsOneWidget);
    });

    testWidgets('No muestra mensaje de error cuando la descarga es exitosa',
        (WidgetTester tester) async {
      // Asigna valores de prueba para Dimensiones.screenHeight y Dimensiones.screenWidth
      Dimensiones.screenHeight = 800;
      Dimensiones.screenWidth = 400;

      // Crea el widget InputDownload
      final InputDownload inputDownload = InputDownload(
        texto: 'Descargar',
        icon: Icons.download,
        color: Colors.blue,
        onPressed: () {},
      );

      // Construye el widget InputDownload
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: inputDownload)));

      // Verifica que no se muestre el mensaje de error
      expect(find.text('Descarga fallida'), findsNothing);
    });
  });
}
