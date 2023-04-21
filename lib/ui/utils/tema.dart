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
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.white),
      ),
    );
  }

  static ThemeData get temaOscuro {
    return ThemeData(
      primaryColor: Color.fromARGB(51, 255, 189, 244),
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.black),
      ),
    );
  }
}
