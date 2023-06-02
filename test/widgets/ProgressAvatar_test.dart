import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/ui/widgets/progressAvatar.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

void main() {
  testWidgets('Muestra correctamente el ProgressAvatar',
      (WidgetTester tester) async {
    // Establecer valores constantes para Dimensiones.screenWidth y Dimensiones.screenHeight
    // según tus necesidades de prueba
    Dimensiones.screenWidth = 300;
    Dimensiones.screenHeight = 600;

    await tester.pumpWidget(
      MaterialApp(
        home: ProgressAvatar(
          label: '50%',
          seguimiento: 'Seguimiento',
          porcentaje: 0.5,
          color: Colors.blue,
          texto: 'Texto',
        ),
      ),
    );

    final labelFinder = find.text('50%');
    final seguimientoFinder = find.text('Seguimiento');
    final textoFinder = find.text('Texto');

    expect(labelFinder, findsOneWidget);
    expect(seguimientoFinder, findsOneWidget);
    expect(textoFinder, findsOneWidget);
  });
  testWidgets('Verifica que se muestre la fecha si tieneFecha es verdadero',
      (WidgetTester tester) async {
    // Crea un widget ProgressAvatar de prueba con tieneFecha establecido en verdadero
    final progressAvatar = ProgressAvatar(
      label: '50%',
      seguimiento: 'Seguimiento',
      porcentaje: 0.5,
      color: Colors.blue,
      texto: 'Texto de prueba',
      tieneFecha: true,
      fecha: '01/01/2022',
    );

    // Establece las dimensiones de la pantalla para la prueba
    Dimensiones.screenWidth = 300;
    Dimensiones.screenHeight = 600;

    // Agrega el widget ProgressAvatar a la jerarquía de widgets
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: progressAvatar,
        ),
      ),
    );

    // Verifica si se muestra la fecha
    final fechaFinder = find.text('01/01/2022');
    expect(fechaFinder, findsOneWidget);
  });
}
