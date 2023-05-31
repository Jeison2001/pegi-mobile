
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/domain/models/propuesta.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Button.dart';

import '../../../domain/Controllers/controladorUsuario.dart';
import '../../../domain/models/usuario.dart';
import '../../utils/Dimensiones.dart';
import '../../widgets/Mostrar.dart';
import '../home.dart';

ControlUsuario controlu = Get.find();

List<String>? list = controlu.getNombresDocentes;

class AsignarEvaluadorPropuesta extends StatefulWidget {
  final Propuesta propuesta;
  final List<UsuarioFirebase> user;

  const AsignarEvaluadorPropuesta(
      {super.key, required this.propuesta, required this.user});

  @override
  State<AsignarEvaluadorPropuesta> createState() =>
      _AsignarEvaluadorPropuestaState();
}

class _AsignarEvaluadorPropuestaState extends State<AsignarEvaluadorPropuesta> {
  String dropdownValue = list!.first;
  ControlPropuesta controlp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.screenHeight * 0.06,
            horizontal: Dimensiones.screenWidth * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(icon: Icons.arrow_back_rounded, texto: 'Asignar Evaluador'),
            MostrarTodo(
                texto: widget.propuesta.titulo.toString(),
                tipo: widget.propuesta.estado.toString(),
                estado: true,
                colorBoton: widget.propuesta.estado.toString().toLowerCase() ==
                        'pendiente'
                    ? const Color.fromRGBO(91, 59, 183, 1)
                    : const Color.fromRGBO(18, 180, 122, 1),
                color: Colors.black,
                fijarIcon: false,
                padding: EdgeInsets.only(
                    left: Dimensiones.screenWidth * 0.05,
                    right: Dimensiones.screenWidth * 0.05,
                    top: Dimensiones.screenHeight * 0.03),
                onPressed: () {}),
            Padding(
              padding: EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.08),
              child: Container(
                height: Dimensiones.screenHeight * 0.0001,
                width: Dimensiones.width90,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 4, color: Color.fromRGBO(30, 30, 30, 1)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Dimensiones.screenWidth * 0.03),
              child: Container(
                width: Dimensiones.width80,
                height: Dimensiones.screenHeight * 0.07,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Color.fromRGBO(30, 30, 30, 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: Dimensiones.width10),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 16,
                  style: const TextStyle(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor: const Color.fromRGBO(30, 30, 30, 1),
                  underline: Container(
                    color: const Color.fromARGB(255, 119, 119, 119),
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list!.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: const Text("seleccione una opcion"),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensiones.screenHeight * 0.03,
                    horizontal: Dimensiones.screenWidth * 0.12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      texto: "Cancelar",
                      color: Colors.black,
                      colorTexto: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(width: Dimensiones.screenWidth * 0.02),
                    Button(
                      texto: "Confirmar",
                      color: const Color.fromRGBO(91, 59, 183, 1),
                      colorTexto: Colors.white,
                      onPressed: () {
                        for (var doc in widget.user) {
                          if (doc.nombre == dropdownValue) {
                            dropdownValue = doc.correo;
                          }
                        }
                        var Propuesta = <String, dynamic>{
                          'titulo': widget.propuesta.titulo,
                          'idEstudiante': widget.propuesta.idEstudiante,
                          'idPropuesta': widget.propuesta.idPropuesta,
                          'nombre': widget.propuesta.nombre,
                          'apellido': widget.propuesta.apellido,
                          'identificacion': widget.propuesta.identificacion,
                          'numero': widget.propuesta.numero,
                          'programa': widget.propuesta.programa,
                          'correo': widget.propuesta.correo,
                          'celular': widget.propuesta.celular,
                          'nombre2': widget.propuesta.nombre2,
                          'apellido2': widget.propuesta.apellido2,
                          'identificacion2': widget.propuesta.identificacion2,
                          'numero2': widget.propuesta.numero2,
                          'programa2': widget.propuesta.programa2,
                          'correo2': widget.propuesta.correo2,
                          'celular2': widget.propuesta.celular2,
                          'lineaInvestigacion': widget.propuesta.titulo,
                          'sublineaInvestigacion':
                              widget.propuesta.sublineaInvestigacion,
                          'areaTematica': widget.propuesta.areaTematica,
                          'grupoInvestigacion':
                              widget.propuesta.grupoInvestigacion,
                          'planteamiento': widget.propuesta.planteamiento,
                          'justificacion': widget.propuesta.justificacion,
                          'general': widget.propuesta.general,
                          'especificos': widget.propuesta.especificos,
                          'bibliografia': widget.propuesta.bibliografia,
                          'anexos': widget.propuesta.anexos,
                          'estado': widget.propuesta.estado,
                          'retroalimentacion':
                              widget.propuesta.retroalimentacion,
                          'calificacion': widget.propuesta.calificacion,
                          'idDocente': dropdownValue
                        };
                        controlp
                            .modificarPropuesta(Propuesta)
                            .then((value) => {
                                  Get.showSnackbar(const GetSnackBar(
                                    title: 'Asignacion de evaluador Exitosa',
                                    message:
                                        'El docente fue asignado a la propuesta',
                                    icon: Icon(Icons.gpp_good_outlined),
                                    duration: Duration(seconds: 5),
                                    backgroundColor: Colors.greenAccent,
                                  )),
                                  Get.offAll(() => HomePage(rol: "admi"))
                                })
                            .catchError((e) {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Asignacion de evaluador Erronea',
                            message: 'Error al asignar docente',
                            icon: Icon(Icons.warning),
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.red,
                          ));
                        });
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
