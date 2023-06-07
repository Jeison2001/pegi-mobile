import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pegi/data/services/peticionesProyecto.dart';
import 'package:pegi/domain/Controllers/controlProyecto.dart';
import 'package:pegi/domain/models/proyecto.dart';

import 'controlProyecto_test.mocks.dart';

// Mock de PeticionesProyecto para simular su comportamiento
@GenerateMocks([PeticionesProyecto])
void main() {
  late ControlProyecto controlProyecto;
  late MockPeticionesProyecto mockPeticionesProyecto;
  var proyecto = <String, dynamic>{
    'titulo': 'titulo',
    'idEstudiante': 'idEstudiante',
    'anexos': 'anexos',
    'estado': 'estado',
    'calificacion': 'calificacion',
    'idProyecto': 'idProyecto',
    'idDocente': 'idDocente',
    'retroalimentacion': 'retroalimentacion'
  };
  setUp(() {
    mockPeticionesProyecto = MockPeticionesProyecto();
    controlProyecto =
        ControlProyecto(peticionesProyecto: mockPeticionesProyecto);
  });
  final proyectoClase = Proyecto.desdeDoc(proyecto);
  group('ControlProyecto', () {
    test('consultarProyectos should set _proyectoFirestore value correctly',
        () async {
      final email = 'user@example.com';
      final proyectos = [proyectoClase, proyectoClase];

      when(mockPeticionesProyecto.consultarProyectos(email))
          .thenAnswer((_) async => proyectos);

      await controlProyecto.consultarProyectos(email);

      expect(controlProyecto.getproyectosGral, proyectos);
    });

    test('consultarTodosProyectos should set _todosProyectos value correctly',
        () async {
      final proyectos = [proyectoClase, proyectoClase];

      when(mockPeticionesProyecto.consultarTodosProyectos())
          .thenAnswer((_) async => proyectos);

      await controlProyecto.consultarTodosProyectos();

      expect(controlProyecto.getTodosproyectos, proyectos);
    });

    test(
        'consultarProyectosDocentes should set _proyectoDocenteFirestore value correctly',
        () async {
      final id = '123';
      final proyectos = [proyectoClase, proyectoClase];

      when(mockPeticionesProyecto.consultarProyectoDocente(id))
          .thenAnswer((_) async => proyectos);

      await controlProyecto.consultarProyectosDocentes(id);

      expect(controlProyecto.getproyectosDocentes, proyectos);
    });

    test('eliminarProyecto should call eliminarProyecto with correct parameter',
        () async {
      await controlProyecto.eliminarProyecto('idProyecto');

      verify(mockPeticionesProyecto.eliminarProyecto('idProyecto')).called(1);
    });

    test(
        'modificarProyecto should call modificarProyecto with correct parameter',
        () async {
      await controlProyecto.modificarProyecto(proyecto);

      verify(mockPeticionesProyecto.modificarProyecto(proyecto)).called(1);
    });

    test('registrarProyecto should call crearProyecto with correct parameters',
        () async {
      final proyecto = {'proyecto': 'Ejemplo'};
      final pickedFilePath = 'file.txt';
      final pickedFileextencion = 'txt';

      await controlProyecto.registrarProyecto(
          proyecto, pickedFilePath, pickedFileextencion);

      verify(mockPeticionesProyecto.crearProyecto(
              proyecto, pickedFilePath, pickedFileextencion))
          .called(1);
    });
  });
}
