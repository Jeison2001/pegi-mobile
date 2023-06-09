// Mocks generated by Mockito 5.4.1 from annotations
// in pegi/test/controllers/controlProyecto_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:firebase_storage/firebase_storage.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pegi/data/services/peticionesProyecto.dart' as _i2;
import 'package:pegi/domain/models/proyecto.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [PeticionesProyecto].
///
/// See the documentation for Mockito's code generation for more information.
class MockPeticionesProyecto extends _i1.Mock
    implements _i2.PeticionesProyecto {
  MockPeticionesProyecto() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set uploadTask(_i3.UploadTask? _uploadTask) => super.noSuchMethod(
        Invocation.setter(
          #uploadTask,
          _uploadTask,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<void> crearProyecto(
    Map<String, dynamic>? proyecto,
    String? file,
    String? pickedFileextencion,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #crearProyecto,
          [
            proyecto,
            file,
            pickedFileextencion,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<dynamic> uploadFile(
    String? file,
    dynamic idProyecto,
    _i3.UploadTask? uploadTask,
    String? pickedFileextencion,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadFile,
          [
            file,
            idProyecto,
            uploadTask,
            pickedFileextencion,
          ],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<List<_i5.Proyecto>> consultarProyectos(dynamic email) =>
      (super.noSuchMethod(
        Invocation.method(
          #consultarProyectos,
          [email],
        ),
        returnValue: _i4.Future<List<_i5.Proyecto>>.value(<_i5.Proyecto>[]),
      ) as _i4.Future<List<_i5.Proyecto>>);
  @override
  _i4.Future<List<_i5.Proyecto>> consultarTodosProyectos() =>
      (super.noSuchMethod(
        Invocation.method(
          #consultarTodosProyectos,
          [],
        ),
        returnValue: _i4.Future<List<_i5.Proyecto>>.value(<_i5.Proyecto>[]),
      ) as _i4.Future<List<_i5.Proyecto>>);
  @override
  _i4.Future<List<_i5.Proyecto>> consultarProyectoDocente(dynamic id) =>
      (super.noSuchMethod(
        Invocation.method(
          #consultarProyectoDocente,
          [id],
        ),
        returnValue: _i4.Future<List<_i5.Proyecto>>.value(<_i5.Proyecto>[]),
      ) as _i4.Future<List<_i5.Proyecto>>);
  @override
  _i4.Future<void> modificarProyecto(Map<String, dynamic>? proyecto) =>
      (super.noSuchMethod(
        Invocation.method(
          #modificarProyecto,
          [proyecto],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> eliminarProyecto(String? idproyecto) => (super.noSuchMethod(
        Invocation.method(
          #eliminarProyecto,
          [idproyecto],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<dynamic> contadorProyecto(
    dynamic id,
    String? estado,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #contadorProyecto,
          [
            id,
            estado,
          ],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> contadorPro(dynamic id) => (super.noSuchMethod(
        Invocation.method(
          #contadorPro,
          [id],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> contadorProyec() => (super.noSuchMethod(
        Invocation.method(
          #contadorProyec,
          [],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> contadorProy() => (super.noSuchMethod(
        Invocation.method(
          #contadorProy,
          [],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> coProyeEst(dynamic email) => (super.noSuchMethod(
        Invocation.method(
          #coProyeEst,
          [email],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> conProyeEst(dynamic email) => (super.noSuchMethod(
        Invocation.method(
          #conProyeEst,
          [email],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
}
