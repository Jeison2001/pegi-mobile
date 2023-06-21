import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pegi/data/services/peticionesIndex.dart';
import 'package:pegi/data/services/peticionesProyecto.dart';
import 'package:pegi/data/services/peticionesUsuario.dart';
import 'package:pegi/domain/Controllers/controlProyecto.dart';
import 'package:pegi/domain/Controllers/controladorIndex.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/domain/models/proyecto.dart';
import 'package:pegi/ui/pages/registrar/registrarProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:flutter_test/flutter_test.dart';

import 'registrarProyecto_test.mocks.dart';

// Mock de PeticionesProyecto para simular su comportamiento

@GenerateMocks([DocumentReference])
void main() {
  // Deshabilitar las fuentes de Google Fonts en las pruebas
  setUp(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  late PeticionesProyecto servicio;
  late FakeFirebaseFirestore firestore;
  late MockFirebaseStorage storage;
  late ControlProyecto controlp;
  late MockFirebaseAuth auth;

  firestore = FakeFirebaseFirestore();
  storage = MockFirebaseStorage();
  auth = MockFirebaseAuth();
  final peticionesUsuario = PeticionesUsuario(db: firestore, auth: auth);
  final peticionesIndex = PeticionesIndex(db: firestore);
  servicio = PeticionesProyecto(db: firestore, storage: storage);
  controlp = ControlProyecto(peticionesProyecto: servicio);
  final controlI = ControlIndex(peticionesIndex: peticionesIndex);
  final controlU = ControlUsuario(peticionesUsuario: peticionesUsuario);

  final pickedFilePath = 'file.pdf';
  final pickedFileextencion = 'pdf';
  Get.put(controlp);
  Get.put(servicio);
  Get.put(controlU);
  Get.put(controlI);
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Widget createWidgetForTesting(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  // Tamaño de pantalla
  Dimensiones.screenWidth = 600.0;
  Dimensiones.screenHeight = 900.0;

  testWidgets('Registrar proyecto exitoso', (WidgetTester tester) async {
    // Iniciar la aplicación
    await tester.pumpWidget(createWidgetForTesting(const RegistrarProyecto()));

    var proyecto = <String, dynamic>{
      'titulo': 'Proyecto',
      'idEstudiante': 'jeisondfuentes@unicesar.edu.co',
      'anexos':
          'https://firebasestorage.googleapis.com/v0/b/pegi-7ed4c.appspot.com/o/anexo%2F199.pdf?alt=media&token=f252efcd-1b4e-4c97-8425-79ad2ebab423',
      'estado': 'Calificado',
      'calificacion': '5',
      'idProyecto': '1',
      'idDocente': 'json@unicesar.edu.co',
      'retroalimentacion': 'Excelente'
    };

    // Simular la carga de un archivo
    when(servicio.uploadFile(pickedFilePath, 'id', null, 'pdf')).thenAnswer(
        (_) async =>
            'https://firebasestorage.googleapis.com/v0/b/pegi-7ed4c.appspot.com/o/anexo%2F199.pdf?alt=media&token=f252efcd-1b4e-4c97-8425-79ad2ebab423');

    // Simular la creación del proyecto
    when(firestore.collection('proyectos'))
        .thenReturn(firestore.collection('proyectos'));
    when(firestore.collection('proyectos').add(proyecto)).thenAnswer(
      (_) async => MockDocumentReference(),
    );

    // Encontrar el widget de entrada del título
    final titleInput = find.byType(TextField);

    // Ingresar un título válido
    await tester.enterText(titleInput, 'Mi proyecto');
    await tester.pumpAndSettle();

    // Encontrar el widget del botón para añadir anexo
    final fileButton = find.byType(ElevatedButton);

    // Pulsar el botón para seleccionar un archivo PDF
    await tester.tap(fileButton);
    await tester.pumpAndSettle();

    // Encontrar el widget del botón para enviar el proyecto
    final submitButton = find.text('Enviar');

    // Pulsar el botón para enviar el proyecto
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    // Verificar que se llama al método registrarProyecto del controlador
    verify(controlp.registrarProyecto(
      proyecto,
      pickedFilePath,
      pickedFileextencion,
    )).called(1);

    // Verificar que se llama al método registrarProyecto del servicio
    verify(servicio.crearProyecto(
      proyecto,
      pickedFilePath,
      pickedFileextencion,
    )).called(1);
  });
}
