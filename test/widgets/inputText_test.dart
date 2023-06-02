import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/ui/widgets/InputText.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

void main() {
  testWidgets('Verifica el comportamiento del botón al presionarlo',
      (WidgetTester tester) async {
    // Asigna valores de prueba para Dimensiones.screenHeight y Dimensiones.screenWidth
    Dimensiones.screenWidth = 360.0;
    Dimensiones.screenHeight = 640.0;

    // Variable para controlar si se presionó el botón
    bool buttonPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Center(
            child: Builder(
              builder: (BuildContext context) {
                return InputTextDownload(
                  texto: 'Descargar',
                  icon: Icons.download,
                  color: Colors.blue,
                  onPressed: () {
                    // Marca el botón como presionado
                    buttonPressed = true;
                  },
                );
              },
            ),
          ),
        ),
      ),
    );

    // Verifica si el botón no se ha presionado al principio
    expect(buttonPressed, isFalse);

    // Simula el evento de presionar el botón de descarga
    await tester.tap(find.byType(InputTextDownload));
    await tester.pumpAndSettle();

    // Verifica si el botón se marcó como presionado después de presionarlo
    expect(buttonPressed, isTrue);
  });

  testWidgets('Muestra el texto ingresado en el InputText',
      (WidgetTester tester) async {
    // Asigna valores de prueba para Dimensiones.screenHeight y Dimensiones.screenWidth
    Dimensiones.screenHeight = 800;
    Dimensiones.screenWidth = 400;
    // Crea el widget InputText
    final InputText inputText = InputText(
      true,
      'password',
      'Contraseña',
      EdgeInsets.all(10),
      EdgeInsets.all(10),
      Colors.grey,
      Colors.black,
    );

    // Construye el widget InputText
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: inputText)));

    // Verifica si se muestra el texto ingresado
    expect(find.text('Contraseña'), findsOneWidget);
  });

  testWidgets('Muestra el texto ingresado en el InputTextMedium',
      (WidgetTester tester) async {
    // Asigna valores de prueba para Dimensiones.screenHeight y Dimensiones.screenWidth
    Dimensiones.screenHeight = 800;
    Dimensiones.screenWidth = 400;
    // Crea el widget InputTextMedium
    final InputTextMedium inputTextMedium = InputTextMedium(
      'contenido',
      'Texto Mediano',
      EdgeInsets.all(10),
      Colors.black,
      Colors.grey,
    );

    // Construye el widget InputTextMedium
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: inputTextMedium)));

    // Verifica si se muestra el texto ingresado
    expect(find.text('Texto Mediano'), findsOneWidget);
  });
}
