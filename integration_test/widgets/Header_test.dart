import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Header.dart';

void main() {
  testWidgets('Header muestra correctamente el contenido',
      (WidgetTester tester) async {
    // Establecer los valores predeterminados para las dimensiones de pantalla en el test
    Dimensiones.screenHeight = 800;
    Dimensiones.screenWidth = 600;

    // Variables de prueba
    final IconData icon = Icons.arrow_back;
    final String texto = 'Título';

    // Construir widget Header y agregarlo a la jerarquía de widgets
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Header(
            icon: icon,
            texto: texto,
          ),
        ),
      ),
    );

    // Verificar que los iconos y el texto se muestren correctamente en la pantalla
    expect(find.byIcon(icon), findsOneWidget);
    expect(find.text(texto), findsOneWidget);
  });
}
