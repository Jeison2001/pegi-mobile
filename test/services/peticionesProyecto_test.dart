import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:test/test.dart';
import 'package:pegi/data/services/peticionesProyecto.dart';

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
  test('crear Proyecto, agrega un proyecto a la base de datos', () async {
    // Crear una instancia de la clase que se quiere probar
    final peticionesProyecto =
        PeticionesProyecto(db: firestore, storage: storage);

    // Llamar al método que se quiere probar
    await peticionesProyecto.crearProyecto(
        {'idProyecto': '1', 'Campo': 'campo'}, 'ruta_archivo', 'extencion');

    // Obtener la propuesta creada
    final documento =
        await firestore.collection('Proyectos').doc('campo').get();

    // Verificar que el documento exista y tenga los valores correctos
    expect(documento.exists, true);
    expect(documento['idProyecto'], '1');
    expect(documento['Campo'], 'campo');
  });

  test(
      'consultar Todos los proyectos devuelve una lista de proyectos agregados en registrar proyecto',
      () async {
    // Crear una instancia de la clase que se quiere probar
    final peticionesProyecto =
        PeticionesProyecto(db: firestore, storage: storage);

    // Agregar datos falsos a la base de datos
    await firestore.collection('Proyectos').doc('1').set({'idProyecto': '1'});
    await firestore.collection('Proyectos').doc('2').set({'idProyecto': '2'});

    // Llamar al método que se quiere probar
    final lista = await peticionesProyecto.consultarTodosProyectos();

    // Verificar que la lista tenga los elementos esperados
    expect(lista.length, 2);
    expect(lista[0].idProyecto, '1');
    expect(lista[1].idProyecto, '2');
  });

  group('PeticionesProyecto', () {
    test('consultarProyectos devuelve una lista de proyectos para un email',
        () async {
      // Crear una instancia de la clase que se quiere probar
      final peticionesProyecto =
          PeticionesProyecto(db: firestore, storage: storage);

      // Agregar datos falsos a la base de datos
      await firestore
          .collection('Proyectos')
          .doc('1')
          .set({'idProyecto': '1', 'idEstudiante': 'email1'});
      await firestore
          .collection('Proyectos')
          .doc('2')
          .set({'idProyecto': '2', 'idEstudiante': 'email2'});
      await firestore
          .collection('Proyectos')
          .doc('3')
          .set({'idProyecto': '3', 'idEstudiante': 'email1'});

      // Llamar al método que se quiere probar con el email 'email1'
      final lista = await peticionesProyecto.consultarProyectos('email1');

      // Verificar que la lista tenga los elementos esperados
      expect(lista.length, 2);
      expect(lista.map((proyectos) => proyectos.idProyecto),
          containsAll(['1', '3']));
      expect(
          lista.every((proyectos) => proyectos.idEstudiante == 'email1'), true);
    });

    test(
        'consultarProyectos devuelve una lista vacía si no hay proyectos para un email dado',
        () async {
      // Crear una instancia de la clase que se quiere probar
      final peticionesProyecto =
          PeticionesProyecto(db: firestore, storage: storage);

      // Agregar datos falsos a la base de datos
      await firestore
          .collection('Proyecto')
          .add({'idProyecto': '1', 'idEstudiante': 'email1'});
      await firestore
          .collection('Proyecto')
          .add({'idProyecto': '2', 'idEstudiante': 'email2'});
      await firestore
          .collection('Proyecto')
          .add({'idProyecto': '3', 'idEstudiante': 'email1'});

      // Llamar al método que se quiere probar con el email 'email3' (que no tiene proyectos asociados)
      final lista = await peticionesProyecto.consultarProyectos('email3');

      // Verificar que la lista esté vacía
      expect(lista.isEmpty, true);
    });
  });

  test('modificar Propuesta actualiza un proyecto en la base de datos',
      () async {
    // Crear una instancia de la clase que se quiere probar
    final peticionesProyecto =
        PeticionesProyecto(db: firestore, storage: storage);

    // Agregar datos falsos a la base de datos
    await firestore
        .collection('Proyectos')
        .doc('1')
        .set({'idProyecto': '1', 'Campo': 'campo1'});
    await firestore
        .collection('Proyectos')
        .doc('2')
        .set({'idProyecto': '2', 'Campo': 'campo2'});

    // Llamar al método que se quiere probar
    await peticionesProyecto
        .modificarProyecto({'idProyecto': '1', 'Campo': 'campo1_modificado'});

    // Obtener la propuesta modificada
    final documento = await firestore.collection('Proyectos').doc('1').get();

    // Verificar que el documento exista y tenga el valor actualizado
    expect(documento.exists, true);
    expect(documento['Campo'], 'campo1_modificado');
  });

  test('eliminarPropuesta elimina un proyecto de la base de datos', () async {
    // Crear una instancia de la clase que se quiere probar
    final peticionesProyecto =
        PeticionesProyecto(db: firestore, storage: storage);

    // Agregar datos falsos a la base de datos
    await firestore.collection('Proyectos').doc('1').set({'idProyecto': '1'});

    // Llamar al método que se quiere probar
    await peticionesProyecto.eliminarProyecto('1');

    // Obtener la propuesta eliminada
    final documento = await firestore.collection('Proyectos').doc('1').get();

    // Verificar que el documento no exista
    expect(documento.exists, false);
  });
}
