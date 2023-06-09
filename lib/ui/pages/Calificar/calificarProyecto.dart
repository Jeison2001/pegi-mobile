import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/proyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Button.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Input.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../../../domain/Controllers/controlProyecto.dart';
import '../home.dart';

class CalificarProyecto extends StatefulWidget {
  final Proyecto proyecto;
  const CalificarProyecto({
    super.key,
    required this.proyecto,
  });

  @override
  State<CalificarProyecto> createState() => _CalificarProyectoState();
}

class _CalificarProyectoState extends State<CalificarProyecto> {
  TextEditingController controlCalificacion = TextEditingController();
  TextEditingController controlRetroalimentacion = TextEditingController();
  ControlProyecto controlp = Get.find();

  String? Retroalimentacion;
  String? Calificacion;
  bool areValuesSet = false;

  @override
  void initState() {
    super.initState();

    if (!areValuesSet) {
      controlRetroalimentacion.text = widget.proyecto.retroalimentacion;
      controlCalificacion.text = widget.proyecto.calificacion;
      areValuesSet = true;
    }

    controlCalificacion.addListener(validateForm);
    controlRetroalimentacion.addListener(validateForm);
  }

  @override
  void dispose() {
    controlCalificacion.dispose();
    controlRetroalimentacion.dispose();
    super.dispose();
  }

  String? validateString0a499(String value) {
    if (value.isEmpty && controlCalificacion.text.isEmpty) {
      return null;
    }
    if (value.isEmpty) {
      return 'El campo no puede estar vacío.';
    }
    if (value.isEmpty || value.length >= 500) {
      return 'El campo debe tener entre 1 y 499 caracteres.';
    }
    return null; // La validación es exitosa, no hay mensaje de error
  }

  String? validateNumber(String value) {
    if (value.isEmpty && controlRetroalimentacion.text.isEmpty) {
      return null;
    }
    if (value.isEmpty && controlRetroalimentacion.text.isNotEmpty) {
      return 'El campo no puede estar vacío. cuando incluye retroalimentacion';
    }

    // Verificar si el valor es un número válido
    if (double.tryParse(value) == null) {
      return 'Ingresa un número válido.';
    }

    // Verificar si el número cumple con la condición
    if (double.tryParse(value)! > 5 || double.tryParse(value)! < 0) {
      return 'El valor  debe tener entre 0 y 5.';
    }

    return null; // La validación es exitosa, no hay mensaje de error
  }

  int validInputsCount = 0;
  bool isButtonEnabled = false;
  void validateForm() {
    setState(() {
      Retroalimentacion = validateString0a499(controlRetroalimentacion.text);
      Calificacion = validateNumber(controlCalificacion.text);
      // Reiniciar el contador de inputs válidos
      validInputsCount = 0;
      if (Retroalimentacion == null && Calificacion == null) {
        // Todos los inputs están validados, habilitar el botón
        isButtonEnabled = true;
      } else {
        // Al menos uno de los inputs tiene un mensaje de error, deshabilitar el botón
        isButtonEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Header(
                    icon: Icons.arrow_back_rounded,
                    texto: 'Calificar Proyectos'),
                MostrarTodo(
                    texto: widget.proyecto.titulo,
                    colorBoton:
                        widget.proyecto.estado.toString().toLowerCase() ==
                                'pendiente'
                            ? const Color.fromRGBO(91, 59, 183, 1)
                            : const Color.fromRGBO(18, 180, 122, 1),
                    estado: true,
                    tipo: widget.proyecto.estado,
                    calificacion: widget.proyecto.calificacion.toString(),
                    onPressed: () {},
                    color: Colors.black,
                    fijarIcon: false,
                    padding: EdgeInsets.only(
                        left: Dimensiones.screenWidth * 0.05,
                        right: Dimensiones.screenWidth * 0.05,
                        top: Dimensiones.screenHeight * 0.03)),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Container(
                    height: 3,
                    width: 350,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 4, color: Color.fromRGBO(30, 30, 30, 1)),
                      ),
                    ),
                  ),
                ),
                InputMedium(
                  controlRetroalimentacion,
                  "Retroalimentacion",
                  EdgeInsets.symmetric(
                      vertical: Dimensiones.screenHeight * 0.02),
                  Colors.white,
                  const Color.fromRGBO(30, 30, 30, 1),
                  validationFunction: validateString0a499,
                ),
                Input(
                    false,
                    controlCalificacion,
                    "Calificacion",
                    const EdgeInsets.all(0),
                    const EdgeInsets.only(bottom: 8),
                    const Color.fromRGBO(30, 30, 30, 1),
                    Colors.white,
                    validationFunction: validateNumber),
                Button(
                  texto: "Enviar",
                  color: const Color.fromRGBO(91, 59, 183, 1),
                  colorTexto: Colors.white,
                  onPressed: isButtonEnabled
                      ? () {
                          var estado = "Calificado";
                          if (controlCalificacion.text.isEmpty &&
                              controlRetroalimentacion.text.isEmpty) {
                            estado = "Pendiente";
                          }
                          var Proyecto = <String, dynamic>{
                            'idProyecto': widget.proyecto.idProyecto,
                            'titulo': widget.proyecto.titulo,
                            'anexos': widget.proyecto.anexos,
                            'idEstudiante': widget.proyecto.idEstudiante,
                            'estado': estado,
                            'retroalimentacion': controlRetroalimentacion.text,
                            'calificacion': controlCalificacion.text,
                            'idDocente': widget.proyecto.idDocente,
                          };
                          controlp
                              .modificarProyecto(Proyecto)
                              .then((value) => {
                                    Get.showSnackbar(const GetSnackBar(
                                      title: 'Regristrar Calificacion',
                                      message:
                                          'Datos registrados Correctamente',
                                      icon: Icon(Icons.gpp_good_outlined),
                                      duration: Duration(seconds: 5),
                                      backgroundColor: Colors.greenAccent,
                                    )),
                                    Get.offAll(() => HomePage(rol: "docente"))
                                  })
                              .catchError((e) {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'Regristrar Calificacion',
                              message: 'Error al registrar calificacion',
                              icon: Icon(Icons.warning),
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.red,
                            ));
                          });
                        }
                      : () async {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Calificar Proyecto',
                            message: 'Por favor verifique los campos',
                            icon: Icon(Icons.gpp_good_outlined),
                            duration: Duration(seconds: 5),
                            backgroundColor: Color.fromARGB(255, 241, 63, 9),
                          ));
                        },
                ),
              ],
            ),
          )),
    );
  }
}
