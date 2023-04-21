import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Proyecto {
  String titulo;
  String idEstudiante;
  String anexos;
  String estado;
  String calificacion;
  String idProyecto;
  String idDocente;
  String retroalimentacion;
  Proyecto(
      {required this.titulo,
      required this.idEstudiante,
      required this.anexos,
      required this.estado,
      required this.calificacion,
      required this.idProyecto,
      required this.idDocente,
      required this.retroalimentacion});

  factory Proyecto.desdeDoc(Map<String, dynamic> data) {
    return Proyecto(
      titulo: data['titulo'] ?? '',
      idEstudiante: data['idEstudiante'] ?? '',
      anexos: data['anexos'] ?? '',
      estado: data['estado'] ?? '',
      calificacion: data['calificacion'] ?? '',
      idDocente: data['idDocente'] ?? '',
      idProyecto: data['idProyecto'] ?? '',
      retroalimentacion: data['retroalimentacion'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'idEstudiante': idEstudiante,
      'anexos': anexos,
      'estado': estado,
      'calificacion': calificacion,
      'idProyecto': idProyecto,
      'idDocente': idDocente,
      'retroalimentacion': retroalimentacion,
    };
  }

  factory Proyecto.fromMap(Map<String, dynamic> map) {
    return Proyecto(
      titulo: map['titulo'] as String,
      idEstudiante: map['idEstudiante'] as String,
      anexos: map['anexos'] as String,
      estado: map['estado'] as String,
      calificacion: map['calificacion'] as String,
      idProyecto: map['idProyecto'] as String,
      idDocente: map['idDocente'] as String,
      retroalimentacion: map['retroalimentacion'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Proyecto.fromJson(String source) =>
      Proyecto.fromMap(json.decode(source) as Map<String, dynamic>);
}
