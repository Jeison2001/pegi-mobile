import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pegi/ui/pages/consultar/admi/consultarAdmin.dart';
import 'package:pegi/ui/pages/consultar/estudiante/consultarEstudiante.dart';
import 'package:pegi/ui/pages/dashboard/dashboardAdmin.dart';
import 'package:pegi/ui/pages/registrar/registrar.dart';
import 'package:pegi/ui/pages/Consultar/Docente/consultarDocente.dart';
import 'package:pegi/ui/pages/Dashboard/Dashboard.dart';
import 'package:pegi/ui/pages/dashboard/dashboardEst.dart';
import 'package:pegi/domain/models/routes.dart';

void main() {
  test('Verifica que se devuelva la ruta correcta para estudiante', () {
    final routes = Routes(index: 0, rutaElejida: 'estudiante');
    final widget = routes.build(MockBuildContext());

    expect(widget is DashboardEstudiante, true);
    expect(widget is Registrar, false);
    expect(widget is ConsultarEstudiante, false);
  });

  test('Verifica que se devuelva la ruta correcta para docente', () {
    final routes = Routes(index: 1, rutaElejida: 'docente');
    final widget = routes.build(MockBuildContext());

    expect(widget is Dashboard, false);
    expect(widget is ConsultarDocente, true);
  });

  test('Verifica que se devuelva la ruta correcta para admin', () {
    final routes = Routes(index: 0, rutaElejida: 'admi');
    final widget = routes.build(MockBuildContext());

    expect(widget is DashboardAdmin, true);
    expect(widget is ConsultarAdmin, false);
  });
}

class MockBuildContext extends Mock implements BuildContext {}
