import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pegi/data/services/peticionesIndex.dart';

import 'peticionesIndex_test.mocks.dart';

// Usa la anotación @GenerateMocks para especificar las clases que quieres simular
@GenerateMocks([
  FirebaseFirestore,
  QuerySnapshot,
  QueryDocumentSnapshot,
  CollectionReference
])
void main() async {
// Inicializa el binding de servicios de Flutter
  TestWidgetsFlutterBinding.ensureInitialized();

  // Inicializa Firebase con los parámetros del emulador
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'fake-api-key',
      appId: 'fake-app-id',
      messagingSenderId: 'fake-messaging-sender-id',
      projectId: 'fake-project-id',
    ),
    name: 'test',
  );

  // Obtiene la instancia inicializada de Firebase
  final app = Firebase.app('test');

  // Obtiene la instancia inicializada de FirebaseFirestore
  final firestore = FirebaseFirestore.instanceFor(app: app);

  // Configura los parámetros del host y puerto del emulador para FirebaseFirestore
  firestore.settings = const Settings(
    host: 'localhost:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );

  // Crea una instancia de la clase PeticionesIndex pasando la instancia inicializada como argumento
  final peticionesIndex = PeticionesIndex(firestore: firestore);
  // Crea una instancia de la clase simulada MockCollectionReference
  final mockCollectionReference = MockCollectionReference();

  // Define un grupo de pruebas con un nombre descriptivo
  group('PeticionesIndex', () {
    // Define una prueba con un nombre descriptivo
    test('consultarIndex devuelve el índice actualizado de propuestas',
        () async {
      // Crea una instancia de la clase simulada MockQuerySnapshot
      final mockQuerySnapshot = MockQuerySnapshot();

      // Crea una instancia de la clase simulada MockQueryDocumentSnapshot
      final mockQueryDocumentSnapshot = MockQueryDocumentSnapshot();

      // Define el comportamiento esperado de la instancia inicializada de FirebaseFirestore cuando se llama al método collection()
      when(firestore.collection('PropuestaIndex')).thenReturn(
          mockCollectionReference as CollectionReference<Map<String, dynamic>>);

      // Define el comportamiento esperado de la instancia simulada de CollectionReference cuando se llama al método get()
      when(mockCollectionReference.get())
          .thenAnswer((_) async => mockQuerySnapshot);

      // Define el comportamiento esperado de la instancia simulada de QuerySnapshot cuando se accede a la propiedad docs
      when(mockQuerySnapshot.docs).thenReturn([mockQueryDocumentSnapshot]);

      // Define el comportamiento esperado de la instancia simulada de QueryDocumentSnapshot cuando se llama al método data()
      when(mockQueryDocumentSnapshot.data()).thenReturn({'index': 1});

      // Define el comportamiento esperado de la instancia simulada de CollectionReference cuando se llama al método doc().update()
      when(mockCollectionReference.doc('campo').update({'index': 2}))
          .thenAnswer((_) async => null);

      // Llama al método consultarIndex() de la instancia real de PeticionesIndex y guarda el resultado en una variable
      final result = await PeticionesIndex.consultarIndex();

      // Verifica que el resultado sea el esperado
      expect(result, '2');

      // Verifica que se hayan hecho las llamadas esperadas a las instancias simuladas
      verify(firestore.collection('PropuestaIndex')).called(1);
      verify(mockCollectionReference.get()).called(1);
      verify(mockCollectionReference.doc('campo').update({'index': 2}))
          .called(1);
    });
  });
}
