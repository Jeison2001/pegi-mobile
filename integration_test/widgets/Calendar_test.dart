import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pegi/ui/widgets/Calendar.dart';

void main() {
  testWidgets('Calendario muestra fechas correctas',
      (WidgetTester tester) async {
    // Crea el widget Calendar y lo agrega a la jerarquía de widgets
    await tester.pumpWidget(
      GetMaterialApp(
        home: MaterialApp(
          home: Calendar(),
        ),
      ),
    );

    // Encuentra los widgets Text que muestran las fechas
    final yesterdayFinder = find.text(DateFormat.d()
        .format(DateTime.now().subtract(const Duration(days: 1))));
    final todayFinder = find.text(DateFormat.d().format(DateTime.now()));
    final tomorrowFinder = find.text(
        DateFormat.d().format(DateTime.now().add(const Duration(days: 1))));

    // Verifica que los widgets Text se encuentren en la jerarquía de widgets
    expect(yesterdayFinder, findsOneWidget);
    expect(todayFinder, findsOneWidget);
    expect(tomorrowFinder, findsOneWidget);
  });
}
