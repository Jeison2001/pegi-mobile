import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/domain/models/propuesta.dart';

void main() {
  group('Propuesta', () {
    test('desdeDoc crea una instancia de Propuesta correctamente', () {
      final data = {
        'idEstudiante': 1,
        'titulo': 'Título de la propuesta',
        'estado': 'En progreso',
        // ... otros campos y valores de ejemplo ...
      };

      final propuesta = Propuesta.desdeDoc(data);

      expect(propuesta.idEstudiante, equals(1));
      expect(propuesta.titulo, equals('Título de la propuesta'));
      expect(propuesta.estado, equals('En progreso'));
      // ... realizar más comprobaciones para otros campos ...
    });
  });
}
