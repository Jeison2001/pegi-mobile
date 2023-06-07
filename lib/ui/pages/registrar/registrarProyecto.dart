import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/widgets/Input.dart';

import '../../../domain/Controllers/controlProyecto.dart';
import '../../../domain/Controllers/controladorIndex.dart';
import '../../../domain/Controllers/controladorUsuario.dart';
import '../../utils/Dimensiones.dart';
import '../../widgets/Button.dart';
import '../../widgets/Header.dart';
import '../home.dart';

class RegistrarProyecto extends StatefulWidget {
  const RegistrarProyecto({Key? key}) : super(key: key);

  @override
  State<RegistrarProyecto> createState() => _RegistrarProyectoState();
}

class _RegistrarProyectoState extends State<RegistrarProyecto> {
  TextEditingController controlAnexo = TextEditingController();
  TextEditingController controlTitulo = TextEditingController();

  ControlProyecto controlp = Get.find();
  ControlUsuario controlu = Get.find();
  ControlIndex controlI = Get.find();
  static PlatformFile? file;

  String? pickedFilePath = "";
  String? pickedFileExtension = "";
  static String pickedFileName = "";
  Future<void> selectFile() async {
    final fileSelect = await FilePicker.platform.pickFiles();
    if (fileSelect == null) return;
    pickedFilePath = fileSelect.files.first.path;
    pickedFileExtension = fileSelect.files.first.extension;
    pickedFileName = fileSelect.files.first.name;
    log('Archivo seleccionado: $pickedFileName');
    setState(() {});
  }

  String? titulo;
  String? anexo;
  int validInputsCount = 0;
  bool isButtonEnabled = false;

  String? validateString0a50(String value) {
    if (value.isEmpty) {
      return 'El campo no puede estar vacío.';
    }
    if (value.length > 50) {
      return 'El campo debe tener entre 1 y 50 caracteres.';
    }
    return null;
  }

  String? validateString0a499(String value) {
    if (value.isEmpty) {
      return 'El campo no puede estar vacío.';
    }
    if (value.length >= 500) {
      return 'El campo debe tener entre 1 y 499 caracteres.';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    controlTitulo.addListener(validateForm);
    controlAnexo.addListener(validateForm);
  }

  @override
  void dispose() {
    controlTitulo.dispose();
    controlAnexo.dispose();
    super.dispose();
  }

  void validateForm() {
    setState(() {
      validInputsCount = 0;
      titulo = validateString0a50(controlTitulo.text);
      print('$titulo y $anexo');
      if (titulo == null) {
        isButtonEnabled = true;
      } else {
        isButtonEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header(
                  icon: Icons.arrow_back_rounded, texto: 'Registrar Proyecto'),
              const SizedBox(height: 5),
              Input(
                false,
                controlTitulo,
                "Titulo del proyecto",
                EdgeInsets.only(
                  left: Dimensiones.screenWidth * 0.04,
                  right: Dimensiones.screenWidth * 0.04,
                  top: Dimensiones.buttonHeight * 0.40,
                  bottom: Dimensiones.buttonHeight * 0.03,
                ),
                const EdgeInsets.only(bottom: 8),
                const Color.fromRGBO(30, 30, 30, 1),
                const Color.fromARGB(255, 221, 221, 221),
              ),
              if (pickedFileName == "")
                InputDownload(
                  texto: "Añadir anexo",
                  icon: Icons.add_to_photos_outlined,
                  color: const Color.fromRGBO(30, 30, 30, 1),
                  onPressed: () {
                    selectFile();
                  },
                ),
              if (pickedFileName != "")
                InputDownload(
                  texto: pickedFileName,
                  icon: Icons.add_to_photos_outlined,
                  color: const Color.fromRGBO(30, 30, 30, 1),
                  onPressed: () {
                    selectFile();
                  },
                  validationFunction: () {
                    if (pickedFileExtension?.toLowerCase() == 'pdf') {
                      return '';
                    } else {
                      return 'El archivo debe ser de tipo PDF.';
                    }
                  },
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensiones.height2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      texto: "Cancelar",
                      color: Colors.black,
                      colorTexto: Colors.white,
                      onPressed: () async {},
                    ),
                    SizedBox(width: Dimensiones.screenWidth * 0.1),
                    Button(
                      texto: "Enviar",
                      color: const Color.fromRGBO(91, 59, 183, 1),
                      colorTexto: Colors.white,
                      onPressed: isButtonEnabled &&
                              pickedFileExtension?.toLowerCase() == 'pdf'
                          ? () async {
                              String index = await controlI.consultarIndex();
                              var proyecto = <String, dynamic>{
                                'idProyecto': index,
                                'titulo': controlTitulo.text,
                                'anexos': "",
                                'idEstudiante': controlu.emailf,
                                'estado': "Pendiente",
                                'retroalimentacion': '',
                                'calificacion': '',
                                'idDocente': '',
                              };
                              controlp
                                  .registrarProyecto(proyecto, pickedFilePath,
                                      pickedFileExtension)
                                  .then((value) => {
                                        Get.showSnackbar(
                                          GetSnackBar(
                                            titleText: Text(
                                                'Datos registrados correctamente'),
                                            messageText: Text(
                                                'Datos registrados correctamente'),
                                            duration: Duration(seconds: 5),
                                            backgroundColor: Colors.greenAccent,
                                          ),
                                        ),
                                        Get.offAll(
                                            () => HomePage(rol: "estudiante")),
                                      })
                                  .catchError((e) {
                                Get.showSnackbar(
                                  GetSnackBar(
                                    titleText:
                                        Text('Error al registrar proyecto'),
                                    messageText:
                                        Text('Error al registrar proyecto'),
                                    duration: Duration(seconds: 5),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              });
                            }
                          : () async {
                              Get.showSnackbar(
                                GetSnackBar(
                                  titleText:
                                      Text('Por favor verifique los campos'),
                                  messageText:
                                      Text('Por favor verifique los campos'),
                                  duration: Duration(seconds: 5),
                                  backgroundColor:
                                      Color.fromARGB(255, 202, 118, 92),
                                ),
                              );
                            },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
