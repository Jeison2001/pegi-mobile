import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/ui/widgets/Button.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Button muestra el texto y llama a onPressed al hacer clic',
      (WidgetTester tester) async {
    bool onPressedCalled = false;
    final button = Button(
      texto: 'Mi botón',
      color: Colors.blue,
      colorTexto: Colors.white,
      onPressed: () => onPressedCalled = true,
    );

    await tester.pumpWidget(GetMaterialApp(home: Scaffold(body: button)));

    expect(find.text('Mi botón'), findsOneWidget);
    expect(onPressedCalled, false);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(onPressedCalled, true);
  });
}
