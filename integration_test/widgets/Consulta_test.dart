import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Consulta.dart';

void main() {
  testWidgets('Mostrar muestra correctamente el contenido',
      (WidgetTester tester) async {
    // Establecer los valores predeterminados para las dimensiones de pantalla en el test
    Dimensiones.screenHeight = 800;
    Dimensiones.screenWidth = 600;

    // Variables de prueba
    final String texto = 'Consultar';
    final Color colorBoton = Colors.blue;
    final VoidCallback onPressed = () {};
    final IconData icon = Icons.search;

    // Construir widget Consultar y agregarlo a la jerarquía de widgets
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Consultar(
          texto: texto,
          colorBoton: colorBoton,
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    ));

    // Verificar que el botón Consultar se muestre correctamente en la pantalla
    expect(find.text(texto), findsOneWidget);
    expect(find.byIcon(icon), findsOneWidget);
    expect(find.byType(MaterialButton), findsOneWidget);
    expect(tester.widget<MaterialButton>(find.byType(MaterialButton)).color,
        colorBoton);
  });
  testWidgets('Mostrar muestra texto y tipo correctamente',
      (WidgetTester tester) async {
    // Crea el widget Mostrar y lo agrega a la jerarquía de widgets
    await tester.pumpWidget(
      MaterialApp(
        home: Mostrar(
          texto: 'Texto de prueba',
          tipo: 'Tipo de prueba',
          colorTipo: Colors.red,
          colorBoton: Colors.blue,
          onPressed: () {},
          onLongPress: () {},
        ),
      ),
    );

    // Encuentra los widgets Text que muestran el texto y el tipo
    final textFinder = find.text('Texto de prueba');
    final typeFinder = find.text('Tipo de prueba');

    // Verifica que los widgets Text se encuentren en la jerarquía de widgets
    expect(textFinder, findsOneWidget);
    expect(typeFinder, findsOneWidget);
  });
}
