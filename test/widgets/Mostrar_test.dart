import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';
import 'package:get/get.dart';

void main() {
  setUp(() {
    // Establecer valores constantes para Dimensiones.screenWidth y Dimensiones.screenHeight
    // según tus necesidades de prueba
    Dimensiones.screenWidth = 300;
    Dimensiones.screenHeight = 600;
  });
  // Inicializar el contexto de Get antes de los tests
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;
  });

  // Testear que el widget se crea correctamente con los parámetros requeridos
  testWidgets('El widget se crea correctamente', (WidgetTester tester) async {
    // Crear un widget MostrarTodo de ejemplo
    final mostrarTodo = MostrarTodo(
      texto: 'Hola',
      colorBoton: Colors.blue,
      onPressed: () {},
      color: Colors.white,
      fijarIcon: true,
      icon: Icons.add,
      padding: EdgeInsets.all(10),
    );

    // Añadir el widget al árbol de widgets
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: mostrarTodo)));

    // Encontrar el widget por tipo
    final mostrarTodoFinder = find.byType(MostrarTodo);

    // Comprobar que el widget se encuentra
    expect(mostrarTodoFinder, findsOneWidget);
  });

  // Testear que el widget muestra el texto y el icono correctos
  testWidgets('El widget muestra el texto y el icono correctos',
      (WidgetTester tester) async {
    // Crear un widget MostrarTodo de ejemplo
    final mostrarTodo = MostrarTodo(
      texto: 'Hola',
      colorBoton: Colors.blue,
      onPressed: () {},
      color: Colors.white,
      fijarIcon: true,
      icon: Icons.add,
      padding: EdgeInsets.all(10),
    );

    // Añadir el widget al árbol de widgets
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: mostrarTodo)));

    // Encontrar el texto y el icono por tipo
    final textFinder = find.text('Hola');
    final iconFinder = find.byIcon(Icons.add);

    // Comprobar que el texto y el icono se encuentran
    expect(textFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
  });

  // Testear que el widget llama a la función onPressed cuando se pulsa
  testWidgets('El widget llama a la función onPressed cuando se pulsa',
      (WidgetTester tester) async {
    // Crear una variable para contar las veces que se llama a la función
    var counter = 0;

    // Crear un widget MostrarTodo de ejemplo
    final mostrarTodo = MostrarTodo(
      texto: 'Hola',
      colorBoton: Colors.blue,
      onPressed: () {
        counter++; // Incrementar el contador cada vez que se llama a la función
      },
      color: Colors.white,
      fijarIcon: true,
      icon: Icons.add,
      padding: EdgeInsets.all(10),
    );

    // Añadir el widget al árbol de widgets
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: mostrarTodo)));

    // Encontrar el icono por tipo
    final iconFinder = find.byIcon(Icons.add);

    // Pulsar el icono una vez
    await tester.tap(iconFinder);

    // Comprobar que el contador se ha incrementado en uno
    expect(counter, equals(1));
  });

  testWidgets('Verifica que los íconos se muestren correctamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MostrarTodo(
            texto: 'Texto de prueba',
            tipo: 'Tipo',
            calificacion: '9.5',
            estado: true,
            colorBoton: Colors.blue,
            onPressed: () {},
            color: Colors.red,
            fijarIcon: true,
            icon: Icons.add,
            icon2: Icons.remove,
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );

    final iconFinder = find.byIcon(Icons.add);
    final icon2Finder = find.byIcon(Icons.remove);

    expect(iconFinder, findsOneWidget);
    expect(icon2Finder, findsOneWidget);
  });
}
