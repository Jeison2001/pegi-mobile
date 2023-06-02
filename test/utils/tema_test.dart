// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Importa la clase que deseas probar
import 'package:pegi/ui/utils/tema.dart';

void main() {
  group('Tema', () {
    test('El tema inicial es oscuro', () {
      expect(currentTheme.currentTheme, ThemeMode.dark);
    });

    test('Alternar el tema cambia el tema', () {
      currentTheme.toggleTheme();
      expect(currentTheme.currentTheme, ThemeMode.light);
      currentTheme.toggleTheme();
      expect(currentTheme.currentTheme, ThemeMode.dark);
    });
  });
}
