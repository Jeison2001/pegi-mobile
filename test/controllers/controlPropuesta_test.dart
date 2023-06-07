import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/domain/models/propuesta.dart';

// Mock de PeticionesPropuesta para simular su comportamiento
@GenerateMocks([PeticionesPropuesta])
import 'controlPropuesta_test.mocks.dart';

void main() {
  late ControlPropuesta controlPropuesta;
  late MockPeticionesPropuesta mockPeticionesPropuesta;
  var propuesta = <String, dynamic>{
    'titulo': 'Título de prueba',
    'estado': 'Estado de prueba',
    'idPropuesta': 'ID de prueba',
    'idDocente': 'ID de docente de prueba',
    'lineaInvestigacion': 'Línea de investigación de prueba',
    'sublineaInvestigacion': 'Sublínea de investigación de prueba',
    'areaTematica': 'Área temática de prueba',
    'grupoInvestigacion': 'Grupo de investigación de prueba',
    'planteamiento': 'Planteamiento de prueba',
    'justificacion': 'Justificación de prueba',
    'general': 'Objetivo general de prueba',
    'especificos': 'Objetivos específicos de prueba',
    'bibliografia': 'Bibliografía de prueba',
    'anexos': 'Anexos de prueba',
    'nombre': 'Nombre de prueba',
    'apellido': 'Apellido de prueba',
    'identificacion': 'Identificación de prueba',
    'numero': 'Número de prueba',
    'programa': 'Programa de prueba',
    'correo': 'Correo de prueba',
    'celular': 'Celular de prueba',
    'nombre2': 'Nombre 2 de prueba',
    'apellido2': 'Apellido 2 de prueba',
    'identificacion2': 'Identificación 2 de prueba',
    'numero2': 'Número 2 de prueba',
    'programa2': 'Programa 2 de prueba',
    'correo2': 'Correo 2 de prueba',
    'celular2': 'Celular 2 de prueba',
    'idEstudiante': 'ID de estudiante de prueba',
    'retroalimentacion': 'Retroalimentación de prueba',
    'calificacion': 'Calificación de prueba',
  };
  final PropuestaClase = Propuesta.desdeDoc(propuesta);
  setUp(() {
    mockPeticionesPropuesta = MockPeticionesPropuesta();
    controlPropuesta =
        ControlPropuesta(peticionesPropuesta: mockPeticionesPropuesta);
  });

  group('ControlPropuesta', () {
    test(
        'registrarPropuesta should call crearPropuesta with correct parameters',
        () async {
      final file = 'file.txt';
      final pickedFileextencion = 'txt';

      await controlPropuesta.registrarPropuesta(
          propuesta, file, pickedFileextencion);

      verify(mockPeticionesPropuesta.crearPropuesta(
              propuesta, file, pickedFileextencion))
          .called(1);
    });

    test('consultarPropuestas should set _propuestaFirestore value correctly',
        () async {
      final email = 'user@example.com';
      final propuestas = [PropuestaClase, PropuestaClase];

      when(mockPeticionesPropuesta.consultarPropuestas(email))
          .thenAnswer((_) async => propuestas);

      await controlPropuesta.consultarPropuestas(email);

      expect(controlPropuesta.getPropuestaEstudiante, propuestas);
    });

    test('consultarTodasPropuestas should set _todasPropuesta value correctly',
        () async {
      final propuestas = [PropuestaClase, PropuestaClase];

      when(mockPeticionesPropuesta.consultarTodasPropuestas())
          .thenAnswer((_) async => propuestas);

      await controlPropuesta.consultarTodasPropuestas();

      expect(controlPropuesta.getTodasPropuesta, propuestas);
    });

    test(
        'modificarPropuesta should call modificarPropuesta with correct parameter',
        () async {
      await controlPropuesta.modificarPropuesta(propuesta);

      verify(mockPeticionesPropuesta.modificarPropuesta(propuesta)).called(1);
    });

    test(
        'eliminarPropuesta should call eliminarPropuesta with correct parameter',
        () async {
      await controlPropuesta.eliminarPropuesta('ID de prueba');

      verify(mockPeticionesPropuesta.eliminarPropuesta('ID de prueba'))
          .called(1);
    });

    test(
        'consultarPropuestasDocente should set _propuestaIdDocente value correctly',
        () async {
      final id = '123';
      final propuestas = [PropuestaClase, PropuestaClase];

      when(mockPeticionesPropuesta.consultarPropuestaDocente(id))
          .thenAnswer((_) async => propuestas);

      await controlPropuesta.consultarPropuestasDocente(id);

      expect(controlPropuesta.getPropuestaDocente, propuestas);
    });
  });
}
