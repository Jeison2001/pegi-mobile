class Propuesta {
  var idEstudiante;
  var titulo;
  var estado;
  var idPropuesta;
  var idDocente;
  var nombre;
  var apellido;
  var identificacion;
  var numero;
  var programa;
  var correo;
  var celular;
  var nombre2;
  var apellido2;
  var identificacion2;
  var numero2;
  var programa2;
  var correo2;
  var celular2;
  var lineaInvestigacion;
  var sublineaInvestigacion;
  var areaTematica;
  var grupoInvestigacion;
  var planteamiento;
  var justificacion;
  var general;
  var especificos;
  var bibliografia;
  var anexos;
  var retroalimentacion;
  var calificacion;

  Propuesta(
      {required this.titulo,
      required this.estado,
      required this.idPropuesta,
      required this.idDocente,
      required this.lineaInvestigacion,
      required this.sublineaInvestigacion,
      required this.areaTematica,
      required this.grupoInvestigacion,
      required this.planteamiento,
      required this.justificacion,
      required this.general,
      required this.especificos,
      required this.bibliografia,
      required this.anexos,
      required this.nombre,
      required this.apellido,
      required this.identificacion,
      required this.numero,
      required this.programa,
      required this.correo,
      required this.celular,
      required this.nombre2,
      required this.apellido2,
      required this.identificacion2,
      required this.numero2,
      required this.programa2,
      required this.correo2,
      required this.celular2,
      required this.idEstudiante,
      this.retroalimentacion,
      this.calificacion});

  factory Propuesta.desdeDoc(Map<String, dynamic> data) {
    return Propuesta(
      idEstudiante: data['idEstudiante'] ?? '',
      titulo: data['titulo'] ?? '',
      estado: data['estado'] ?? '',
      anexos: data['anexos'] ?? '',
      apellido: data['apellido'] ?? '',
      apellido2: data['apellido2'] ?? '',
      areaTematica: data['areaTematica'] ?? '',
      bibliografia: data['bibliografia'] ?? '',
      calificacion: data['calificacion'] ?? '',
      celular: data['celular'] ?? '',
      celular2: data['celular2'] ?? '',
      correo: data['correo'] ?? '',
      correo2: data['correo2'] ?? '',
      especificos: data['especificos'] ?? '',
      general: data['general'] ?? '',
      grupoInvestigacion: data['grupoInvestigacion'] ?? '',
      idPropuesta: data['idPropuesta'] ?? '',
      idDocente: data['idDocente'] ?? '',
      identificacion: data['identificacion'] ?? '',
      identificacion2: data['identificacion2'] ?? '',
      justificacion: data['justificacion'] ?? '',
      lineaInvestigacion: data['lineaInvestigacion'] ?? '',
      nombre: data['nombre'] ?? '',
      nombre2: data['nombre2'] ?? '',
      numero: data['numero'] ?? '',
      numero2: data['numero2'] ?? '',
      retroalimentacion: data['retroalimentacion'] ?? '',
      planteamiento: data['plantamiento'] ?? '',
      programa: data['programa'] ?? '',
      programa2: data['programa2'] ?? '',
      sublineaInvestigacion: data['sublineaInvestigacion'] ?? '',
    );
  }
}
