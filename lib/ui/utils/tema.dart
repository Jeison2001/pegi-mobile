import 'package:flutter/material.dart';

Tema currentTheme = Tema();

class Tema with ChangeNotifier {
  static bool _esDarkTema = true;
  ThemeMode get currentTheme => _esDarkTema ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _esDarkTema = !_esDarkTema;
    notifyListeners();
  }

  static ThemeData get temaClaro {
    return ThemeData(
      primaryColor: Colors.lightBlue,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.black),
        displayMedium: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.white),
      ),
    );
  }

  static ThemeData get temaOscuro {
    return ThemeData(
      primaryColor: const Color.fromARGB(51, 255, 189, 244),
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: Colors.black,
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.black),
      ),
    );
  }
}
