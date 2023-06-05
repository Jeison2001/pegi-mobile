import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:test/test.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';

void main() {
  // Declarar las variables globales
  late FakeFirebaseFirestore firestore;
  late MockFirebaseStorage storage;

  // Inicializar las variables antes de cada prueba
  setUp(() {
    firestore = FakeFirebaseFirestore();
    storage = MockFirebaseStorage();
  });

  // Escribir las pruebas unitarias
  test('crearPropuesta agrega una propuesta a la base de datos', () async {
    // Crear una instancia de la clase que se quiere probar
    final peticionesPropuesta =
        PeticionesPropuesta(db: firestore, storage: storage);

    // Llamar al método que se quiere probar
    await peticionesPropuesta.crearPropuesta(
        {'idPropuesta': '1', 'Campo': 'campo'}, 'ruta_archivo', 'extencion');

    // Obtener la propuesta creada
    final documento =
        await firestore.collection('Propuesta').doc('campo').get();

    // Verificar que el documento exista y tenga los valores correctos
    expect(documento.exists, true);
    expect(documento['idPropuesta'], '1');
    expect(documento['Campo'], 'campo');
  });

  test('consultarTodasPropuestas devuelve una lista de propuestas', () async {
    // Crear una instancia de la clase que se quiere probar
    final peticionesPropuesta =
        PeticionesPropuesta(db: firestore, storage: storage);

    // Agregar datos falsos a la base de datos
    await firestore.collection('Propuesta').doc('1').set({'idPropuesta': '1'});
    await firestore.collection('Propuesta').doc('2').set({'idPropuesta': '2'});

    // Llamar al método que se quiere probar
    final lista = await peticionesPropuesta.consultarTodasPropuestas();

    // Verificar que la lista tenga los elementos esperados
    expect(lista.length, 2);
    expect(lista[0].idPropuesta, '1');
    expect(lista[1].idPropuesta, '2');
  });

  test(
      'consultarPropuestas devuelve una lista de propuestas para un email dado',
      () async {
    // Crear una instancia de la clase que se quiere probar
    final peticionesPropuesta =
        PeticionesPropuesta(db: firestore, storage: storage);

    // Agregar datos falsos a la base de datos
    await firestore
        .collection('Propuesta')
        .doc('1')
        .set({'idPropuesta': '1', 'idEstudiante': 'email1'});
    await firestore
        .collection('Propuesta')
        .doc('2')
        .set({'idPropuesta': '2', 'idEstudiante': 'email2'});
    await firestore
        .collection('Propuesta')
        .doc('3')
        .set({'idPropuesta': '3', 'idEstudiante': 'email1'});

    // Llamar al método que se quiere probar
    final lista = await peticionesPropuesta.consultarPropuestas('email1');

    // Verificar que la lista tenga los elementos esperados
    expect(lista.length, 2);
    expect(lista[0].idPropuesta, '1');
    expect(lista[1].idPropuesta, '3');
  });

  test('modificarPropuesta actualiza una propuesta en la base de datos',
      () async {
    // Crear una instancia de la clase que se quiere probar
    final peticionesPropuesta =
        PeticionesPropuesta(db: firestore, storage: storage);

    // Agregar datos falsos a la base de datos
    await firestore
        .collection('Propuesta')
        .doc('1')
        .set({'idPropuesta': '1', 'Campo': 'campo1'});
    await firestore
        .collection('Propuesta')
        .doc('2')
        .set({'idPropuesta': '2', 'Campo': 'campo2'});

    // Llamar al método que se quiere probar
    await peticionesPropuesta
        .modificarPropuesta({'idPropuesta': '1', 'Campo': 'campo1_modificado'});

    // Obtener la propuesta modificada
    final documento = await firestore.collection('Propuesta').doc('1').get();

    // Verificar que el documento exista y tenga el valor actualizado
    expect(documento.exists, true);
    expect(documento['Campo'], 'campo1_modificado');
  });

  test('eliminarPropuesta elimina una propuesta de la base de datos', () async {
    // Crear una instancia de la clase que se quiere probar
    final peticionesPropuesta =
        PeticionesPropuesta(db: firestore, storage: storage);

    // Agregar datos falsos a la base de datos
    await firestore.collection('Propuesta').doc('1').set({'idPropuesta': '1'});

    // Llamar al método que se quiere probar
    await peticionesPropuesta.eliminarPropuesta('1');

    // Obtener la propuesta eliminada
    final documento = await firestore.collection('Propuesta').doc('1').get();

    // Verificar que el documento no exista
    expect(documento.exists, false);
  });
}
