import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/domain/models/proyecto.dart';

void main() {
  group('Proyecto', () {
    test('desdeDoc crea una instancia de Proyecto correctamente', () {
      final data = {
        'titulo': 'Título del proyecto',
        'idEstudiante': '1',
        'anexos': 'Anexos del proyecto',
        'estado': 'En progreso',
        'calificacion': 'Aprobado',
        'idProyecto': '123',
        'idDocente': '456',
        'retroalimentacion': 'Retroalimentación del proyecto',
      };

      final proyecto = Proyecto.desdeDoc(data);

      expect(proyecto.titulo, equals('Título del proyecto'));
      expect(proyecto.idEstudiante, equals('1'));
      expect(proyecto.anexos, equals('Anexos del proyecto'));
      expect(proyecto.estado, equals('En progreso'));
      expect(proyecto.calificacion, equals('Aprobado'));
      expect(proyecto.idProyecto, equals('123'));
      expect(proyecto.idDocente, equals('456'));
      expect(
          proyecto.retroalimentacion, equals('Retroalimentación del proyecto'));
    });

    test('toMap devuelve un mapa con los valores correctos', () {
      final proyecto = Proyecto(
        titulo: 'Título del proyecto',
        idEstudiante: '1',
        anexos: 'Anexos del proyecto',
        estado: 'En progreso',
        calificacion: 'Aprobado',
        idProyecto: '123',
        idDocente: '456',
        retroalimentacion: 'Retroalimentación del proyecto',
      );

      final mapa = proyecto.toMap();

      expect(mapa['titulo'], equals('Título del proyecto'));
      expect(mapa['idEstudiante'], equals('1'));
      expect(mapa['anexos'], equals('Anexos del proyecto'));
      expect(mapa['estado'], equals('En progreso'));
      expect(mapa['calificacion'], equals('Aprobado'));
      expect(mapa['idProyecto'], equals('123'));
      expect(mapa['idDocente'], equals('456'));
      expect(
          mapa['retroalimentacion'], equals('Retroalimentación del proyecto'));
    });

    test('fromMap crea una instancia de Proyecto correctamente', () {
      final mapa = {
        'titulo': 'Título del proyecto',
        'idEstudiante': '1',
        'anexos': 'Anexos del proyecto',
        'estado': 'En progreso',
        'calificacion': 'Aprobado',
        'idProyecto': '123',
        'idDocente': '456',
        'retroalimentacion': 'Retroalimentación del proyecto',
      };

      final proyecto = Proyecto.fromMap(mapa);

      expect(proyecto.titulo, equals('Título del proyecto'));
      expect(proyecto.idEstudiante, equals('1'));
      expect(proyecto.anexos, equals('Anexos del proyecto'));
      expect(proyecto.estado, equals('En progreso'));
      expect(proyecto.calificacion, equals('Aprobado'));
      expect(proyecto.idProyecto, equals('123'));
      expect(proyecto.idDocente, equals('456'));
      expect(
          proyecto.retroalimentacion, equals('Retroalimentación del proyecto'));
    });

    test('toJson devuelve una cadena JSON válida', () {
      final proyecto = Proyecto(
        titulo: 'Título del proyecto',
        idEstudiante: '1',
        anexos: 'Anexos del proyecto',
        estado: 'En progreso',
        calificacion: 'Aprobado',
        idProyecto: '123',
        idDocente: '456',
        retroalimentacion: 'Retroalimentación del proyecto',
      );

      final json = proyecto.toJson();

      final mapa = jsonDecode(json) as Map<String, dynamic>;
      expect(mapa['titulo'], equals('Título del proyecto'));
      expect(mapa['idEstudiante'], equals('1'));
      expect(mapa['anexos'], equals('Anexos del proyecto'));
      expect(mapa['estado'], equals('En progreso'));
      expect(mapa['calificacion'], equals('Aprobado'));
      expect(mapa['idProyecto'], equals('123'));
      expect(mapa['idDocente'], equals('456'));
      expect(
          mapa['retroalimentacion'], equals('Retroalimentación del proyecto'));
    });

    test('fromJson crea una instancia de Proyecto correctamente', () {
      final json = '''
        {
          "titulo": "Título del proyecto",
          "idEstudiante": "1",
          "anexos": "Anexos del proyecto",
          "estado": "En progreso",
          "calificacion": "Aprobado",
          "idProyecto": "123",
          "idDocente": "456",
          "retroalimentacion": "Retroalimentación del proyecto"
        }
      ''';

      final proyecto = Proyecto.fromJson(json);

      expect(proyecto.titulo, equals('Título del proyecto'));
      expect(proyecto.idEstudiante, equals('1'));
      expect(proyecto.anexos, equals('Anexos del proyecto'));
      expect(proyecto.estado, equals('En progreso'));
      expect(proyecto.calificacion, equals('Aprobado'));
      expect(proyecto.idProyecto, equals('123'));
      expect(proyecto.idDocente, equals('456'));
      expect(
          proyecto.retroalimentacion, equals('Retroalimentación del proyecto'));
    });
  });
}
