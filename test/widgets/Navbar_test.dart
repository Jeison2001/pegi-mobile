import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Navbar.dart';

void main() {
  testWidgets('Navbar muestra correctamente los elementos',
      (WidgetTester tester) async {
    // Arrange
    final rol = 'Usuario';
    final icono = Icons.home;

    // Set a fixed screen size
    Dimensiones.screenHeight = 800;
    Dimensiones.screenWidth = 600;

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Navbar(rol, icono),
        ),
      ),
    );

    // Assert
    expect(find.byIcon(icono), findsOneWidget);
    expect(find.text('Hola, $rol'), findsOneWidget);
    expect(find.text('sé productivo hoy'), findsOneWidget);
  });
}
