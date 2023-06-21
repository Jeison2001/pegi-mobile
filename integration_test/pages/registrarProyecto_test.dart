import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pegi/data/services/peticionesIndex.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:pegi/data/services/peticionesProyecto.dart';
import 'package:pegi/data/services/peticionesUsuario.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/domain/Controllers/controlProyecto.dart';
import 'package:pegi/domain/Controllers/controladorIndex.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/domain/models/proyecto.dart';
import 'package:pegi/ui/pages/consultar/estudiante/consultarEstudiante.dart';
import 'package:pegi/ui/pages/consultar/estudiante/consultarProyecto.dart';
import 'package:pegi/ui/pages/home.dart';
import 'package:pegi/ui/pages/registrar/registrarProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock de PeticionesProyecto para simular su comportamiento

@GenerateMocks([DocumentReference])
void main() {
  // Get.testMode = true;

  // Deshabilitar las fuentes de Google Fonts en las pruebas
  setUp(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });
  Firebase.initializeApp();
  late PeticionesProyecto servicio;
  // late PeticionesPropuesta serviciopropuesta;

  late FakeFirebaseFirestore firestore;
  late MockFirebaseStorage storage;
  late ControlProyecto controlp;
  // late ControlPropuesta controlpropuesta;

  late MockFirebaseAuth auth;

  firestore = FakeFirebaseFirestore();
  storage = MockFirebaseStorage();
  auth = MockFirebaseAuth();
  final peticionesUsuario = PeticionesUsuario(db: firestore, auth: auth);
  final peticionesIndex = PeticionesIndex(db: firestore);
  servicio = PeticionesProyecto(db: firestore, storage: storage);
  // serviciopropuesta = PeticionesPropuesta(db: firestore, storage: storage);
  controlp = ControlProyecto(peticionesProyecto: servicio);
  // controlpropuesta = ControlPropuesta(peticionesPropuesta: serviciopropuesta);
  final controlI = ControlIndex(peticionesIndex: peticionesIndex);
  final controlU = ControlUsuario(peticionesUsuario: peticionesUsuario);

  final pickedFilePath = 'file.pdf';
  final pickedFileextencion = 'pdf';
  Get.put(controlp);
  Get.put(servicio);
  Get.put(controlU);
  Get.put(controlI);
  // Get.put(controlpropuesta);
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
    final indexDoc = firestore.collection('PropuestaIndex').doc('campo');
    await indexDoc.set({'index': 0});
    var proyecto = <String, dynamic>{
      'titulo': 'ProyectoTest',
      'idEstudiante': 'jeisondfuentes@unicesar.edu.co',
      'anexos':
          'https://firebasestorage.googleapis.com/v0/b/pegi-7ed4c.appspot.com/o/anexo%2F199.pdf?alt=media&token=f252efcd-1b4e-4c97-8425-79ad2ebab423',
      'estado': 'Calificado',
      'calificacion': '5',
      'idProyecto': '1',
      'idDocente': 'json@unicesar.edu.co',
      'retroalimentacion': 'Excelente'
    };
    // Iniciar la aplicación
    await tester.pumpWidget(createWidgetForTesting(const RegistrarProyecto()));

    // Encontrar el widget de entrada del título
    final titleInput = find.byType(TextField);

    // Ingresar un título válido
    await tester.enterText(titleInput, 'ProyectoTest');
    await tester.pumpAndSettle();

    // Encontrar el widget del botón para añadir anexo
    final fileButton = find.byType(MaterialButton);

    // Pulsar el botón para seleccionar un archivo PDF
    await tester.tap(fileButton);
    await tester.pumpAndSettle();

    // Encontrar el widget del botón para enviar el proyecto
    final submitButton = find.text('Enviar');

    // Pulsar el botón para enviar el proyecto
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    // Verificar que se llama al método registrarProyecto del controlador
    expect(
      controlp.registrarProyecto(proyecto, pickedFilePath, pickedFileextencion),
      isA<Future<void>>(),
    );

    expect(
      servicio.crearProyecto(proyecto, pickedFilePath, pickedFileextencion),
      isA<Future<void>>(),
    );
  });
}
