import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart'; // Importa esta librería para usar la anotación @GenerateMocks
import 'package:mockito/mockito.dart';
import 'package:pegi/domain/Controllers/controladorIndex.dart';
import 'package:test/test.dart';
import 'package:pegi/data/services/peticionesIndex.dart';
import 'ControlIndex_test.mocks.dart';
// Crea un mock de PeticionesIndex

// Usa la anotación @GenerateMocks para generar un mock de FirebaseAuth
@GenerateMocks([PeticionesIndex])
// Crea un mock de FirebaseAuth
void main() {
  // Crea los mocks que vas a usar
  final mockPeticionesIndex = MockPeticionesIndex();

  // Crea una instancia de ControlIndex pasando los mocks como argumentos
  final controlIndex = ControlIndex(peticionesIndex: mockPeticionesIndex);

  // Escribe una prueba para cada caso que quieras verificar
  test('consultarIndex devuelve el resultado esperado', () async {
    // Configura el mock de PeticionesIndex para que devuelva un valor cuando se llama al método consultarIndex
    when(mockPeticionesIndex.consultarIndex()).thenAnswer((_) async => 'OK');

    // Llama al método consultarIndex de la instancia de ControlIndex
    final resultado = await controlIndex.consultarIndex();

    // Verifica que el resultado sea el esperado
    expect(resultado, 'OK');

    // Verifica que se llama al método consultarIndex del mock
    verify(mockPeticionesIndex.consultarIndex()).called(1);
  });

  // Define una prueba para el caso de error
  test('debería devolver una FirebaseAuthException cuando la petición falla',
      () async {
    // Arregla el escenario: define lo que debe devolver el mock cuando se llama al método consultarIndex
    when(mockPeticionesIndex.consultarIndex())
        .thenThrow(FirebaseAuthException(code: 'error'));

    // Actúa: llama al método consultarIndex del controlador
    final resultado = await controlIndex.consultarIndex();

    // Aserción: verifica que el resultado sea una FirebaseAuthException con el código esperado
    expect(resultado, isA<FirebaseAuthException>());
    expect((resultado as FirebaseAuthException).code, 'error');
  });
}
