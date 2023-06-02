import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/ui/widgets/bottom_menu.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('BottomMenu cambia el índice al hacer clic en un elemento',
      (WidgetTester tester) async {
    int currentIndex = 0;
    final bottomMenu = BottomMenu(
      currentIndex: (int i) => currentIndex = i,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      ],
    );

    await tester.pumpWidget(GetMaterialApp(home: Scaffold(body: bottomMenu)));

    expect(currentIndex, 0);

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    expect(currentIndex, 1);
  });
}
