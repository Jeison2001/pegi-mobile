import 'package:flutter/material.dart';
import 'package:pegi/ui/pages/home.dart';
import 'package:pegi/ui/pages/principal/principal.dart';
import 'package:pegi/ui/pages/autenticacion/ingresar.dart';
import 'package:pegi/ui/pages/autenticacion/registrar.dart';
import 'package:pegi/ui/utils/tema.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Tema.temaClaro,
      darkTheme: Tema.temaOscuro,
      themeMode: currentTheme.currentTheme,
      routes: {
        '/principal': (context) => const Principal(),
        '/ingresar': (context) => const Ingresar(),
        '/registrar': (context) => const Registrar(),
      },
      home: const Principal(),
    );
  }
}
