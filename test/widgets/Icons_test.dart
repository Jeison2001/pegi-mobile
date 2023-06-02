import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/ui/widgets/Icons.dart';

void main() {
  testWidgets('AppIcon muestra icono correctamente',
      (WidgetTester tester) async {
    // Crea el widget AppIcon y lo agrega a la jerarquía de widgets
    await tester.pumpWidget(
      MaterialApp(
        home: AppIcon(
          iconD: Icons.ac_unit,
          iconColor: Colors.red,
        ),
      ),
    );

    // Encuentra el widget Icon que muestra el icono
    final iconFinder = find.byIcon(Icons.ac_unit);

    // Verifica que el widget Icon se encuentre en la jerarquía de widgets
    expect(iconFinder, findsOneWidget);
  });
}
