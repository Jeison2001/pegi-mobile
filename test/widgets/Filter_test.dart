import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Filter.dart';

void main() {
  testWidgets('Filter muestra correctamente el contenido',
      (WidgetTester tester) async {
    // Establecer los valores predeterminados para las dimensiones de pantalla en el test
    Dimensiones.screenHeight = 800;
    Dimensiones.screenWidth = 600;

    // Variables de prueba
    final TextEditingController controller = TextEditingController();
    final String texto = 'Filtro';

    // Construir widget Filter y agregarlo a la jerarquía de widgets
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Filter(
            controlador: controller,
            texto: texto,
          ),
        ),
      ),
    );

    // Verificar que el texto y el TextField se muestren correctamente en la pantalla
    expect(find.text(texto), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}
