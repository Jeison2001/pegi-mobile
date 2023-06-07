// Importar los paquetes necesarios
import 'package:test/test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

// Importar el archivo que se quiere probar
import 'package:pegi/data/services/peticionesIndex.dart';

void main() {
  // Declarar las variables globales
  late FakeFirebaseFirestore firestore;

  // Inicializar las variables antes de cada prueba
  setUp(() {
    firestore = FakeFirebaseFirestore();
  });

  // Escribir las pruebas unitarias
  test('consultarIndex devuelve el valor del índice', () async {
    // Crear una instancia de la clase que se quiere probar
    final peticionesIndex = PeticionesIndex(db: firestore);

    // Agregar datos falsos a la base de datos
    await firestore.collection('PropuestaIndex').doc('campo').set({'index': 0});

    // Llamar al método que se quiere probar
    final resultado = await peticionesIndex.consultarIndex();

    // Verificar que el resultado sea el esperado
    expect(resultado, '1');
  });
}
