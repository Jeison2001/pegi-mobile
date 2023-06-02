import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/domain/models/index.dart';

void main() {
  group('PropuestaIndex', () {
    test('Constructor crea una instancia válida', () {
      final propuestaIndex = PropuestaIndex(index: 10);

      expect(propuestaIndex.index, 10);
    });

    test('desdeDoc crea una instancia válida a partir de un mapa', () {
      final data = {'index': 5};

      final propuestaIndex = PropuestaIndex.desdeDoc(data);

      expect(propuestaIndex.index, 5);
    });

    test('toJson devuelve un mapa con los valores correctos', () {
      final propuestaIndex = PropuestaIndex(index: 8);

      final json = propuestaIndex.toJson();

      expect(json['index'], 8);
    });
  });
}
