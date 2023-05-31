import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/_html/_file_decoder_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/data/services/peticionesIndex.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/ui/pages/registrar/registrar.dart';
import 'package:pegi/ui/widgets/Input.dart';

import '../../../data/services/peticionesPropuesta.dart';
import '../../../domain/Controllers/controladorIndex.dart';
import '../../../domain/Controllers/controladorUsuario.dart';
import '../../utils/Dimensiones.dart';
import '../../widgets/Button.dart';
import '../../widgets/Header.dart';
import '../home.dart';

class RegistrarPropuesta extends StatefulWidget {
  const RegistrarPropuesta({super.key});

  @override
  State<RegistrarPropuesta> createState() => _RegistrarPropuestaState();
}

class _RegistrarPropuestaState extends State<RegistrarPropuesta> {
  ControlUsuario controlu = Get.find();
  ControlPropuesta controlp = Get.find();
  ControlIndex controlI = Get.find();
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlApellido = TextEditingController();
  TextEditingController controlIdentificacion = TextEditingController();
  TextEditingController controlNumero = TextEditingController();
  TextEditingController controlPrograma = TextEditingController();
  TextEditingController controlCorreo = TextEditingController();
  TextEditingController controlCelular = TextEditingController();
  TextEditingController controlNombre2 = TextEditingController();
  TextEditingController controlApellido2 = TextEditingController();
  TextEditingController controlIdentificacion2 = TextEditingController();
  TextEditingController controlNumero2 = TextEditingController();
  TextEditingController controlPrograma2 = TextEditingController();
  TextEditingController controlCorreo2 = TextEditingController();
  TextEditingController controlCelular2 = TextEditingController();
  TextEditingController controlLineaInvestigacion = TextEditingController();
  TextEditingController controlSublineaInvestigacion = TextEditingController();
  TextEditingController controlAreaTematica = TextEditingController();
  TextEditingController controlGrupoInvestigacion = TextEditingController();
  TextEditingController controlPlanteamiento = TextEditingController();
  TextEditingController controlJustificacion = TextEditingController();
  TextEditingController controlBibliografia = TextEditingController();

  TextEditingController controlGeneral = TextEditingController();
  TextEditingController controlEspecifico = TextEditingController();
  TextEditingController controlAnexo = TextEditingController();
  TextEditingController controlTitulo = TextEditingController();

  static PlatformFile? file;
  // static FilePickerResult? pickedFile;
  // Uint8List? pickedFilePath;
  // static String pickedFileName = "";

  // Future selectFile() async {
  //   if (kIsWeb) {
  //     pickedFile = await FilePicker.platform.pickFiles();
  //     if (pickedFile != null) {
  //       pickedFilePath = pickedFile!.files.first.bytes;
  //       pickedFileName = pickedFile!.files.first.name;
  //     }
  //     log('Archivo selecionado: $pickedFileName');
  //   } else {
  //     final fileSelect = await FilePicker.platform.pickFiles();

  //     if (fileSelect == null) return;
  //     setState(() {
  //       file = fileSelect.files.first;
  //     });
  //     log('Archivo selecionado: ${file!.name}');
  //   }
  // }

  String? pickedFilePath = "";
  String? pickedFileextencion = "";
  static String pickedFileName = "";
  Future selectFile() async {
    final fileSelect = await FilePicker.platform.pickFiles();
    if (fileSelect == null) return;
    pickedFilePath = fileSelect.files.first.path;
    pickedFileextencion = fileSelect.files.first.extension;
    pickedFileName = fileSelect.files.first.name;
    log('Archivo selecionado: $pickedFileName');
    setState(() {});
  }

  int _activeCurrentStep = 0;
  String? Titulo;
  String? Nombre;
  String? Apellido;
  String? Identificacion;
  String? Numero;
  String? Programa;
  String? Correo;
  String? Celular;
  String? Nombre2;
  String? Apellido2;
  String? Identificacion2;
  String? Numero2;
  String? Programa2;
  String? Correo2;
  String? Celular2;
  String? LineaInvestigacion;

  String? SublineaInvestigacion;
  String? AreaTematica;

  String? GrupoInvestigacion;
  String? Planteamiento;
  String? Justificacion;
  String? General;
  String? Especifico;
  String? Bibliografia;
  String? Anexo;
  int validInputsCount = 0;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    controlTitulo.addListener(validateForm);
    controlNombre.addListener(validateForm);
    controlApellido.addListener(validateForm);
    controlIdentificacion.addListener(validateForm);
    controlNumero.addListener(validateForm);
    controlPrograma.addListener(validateForm);
    controlCorreo.addListener(validateForm);
    controlCelular.addListener(validateForm);
    controlNombre2.addListener(validateForm);
    controlApellido2.addListener(validateForm);
    controlIdentificacion2.addListener(validateForm);
    controlNumero2.addListener(validateForm);
    controlPrograma2.addListener(validateForm);
    controlCorreo2.addListener(validateForm);
    controlCelular2.addListener(validateForm);
    controlLineaInvestigacion.addListener(validateForm);

    controlSublineaInvestigacion.addListener(validateForm);
    controlAreaTematica.addListener(validateForm);

    controlGrupoInvestigacion.addListener(validateForm);
    controlPlanteamiento.addListener(validateForm);
    controlJustificacion.addListener(validateForm);
    controlGeneral.addListener(validateForm);
    controlEspecifico.addListener(validateForm);
    controlBibliografia.addListener(validateForm);
    controlAnexo.addListener(validateForm);
  }

  @override
  void dispose() {
    controlTitulo.dispose();
    controlNombre.dispose();
    controlApellido.dispose();
    controlIdentificacion.dispose();
    controlNumero.dispose();
    controlPrograma.dispose();
    controlCorreo.dispose();
    controlCelular.dispose();
    controlNombre2.dispose();
    controlApellido2.dispose();
    controlIdentificacion2.dispose();
    controlNumero2.dispose();
    controlPrograma2.dispose();
    controlCorreo2.dispose();
    controlCelular2.dispose();
    controlLineaInvestigacion.dispose();

    controlSublineaInvestigacion.dispose();
    controlAreaTematica..dispose();

    controlGrupoInvestigacion..dispose();
    controlPlanteamiento.dispose();
    controlJustificacion.dispose();
    controlGeneral.dispose();
    controlEspecifico.dispose();
    controlBibliografia.dispose();
    controlAnexo.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (value == null || value.isEmpty) {
      return 'El correo no puede estar vacío.';
    }
    if (!value.endsWith("@unicesar.edu.co")) {
      return 'El correo debe terminar con "@unicesar.edu.co".';
    }
    return null; // La validación es exitosa, no hay mensaje de error
  }

  String? validateString0a49(String value) {
    if (value == null || value.isEmpty) {
      return 'El campo no puede estar vacío.';
    }
    if (value.length < 1 || value.length >= 50) {
      return 'El campo debe tener entre 1 y 49 caracteres.';
    }
    return null; // La validación es exitosa, no hay mensaje de error
  }

  String? validateString0a50(String value) {
    if (value == null || value.isEmpty) {
      return 'El campo no puede estar vacío.';
    }
    if (value.length < 1 || value.length > 50) {
      return 'El campo debe tener entre 1 y 50 caracteres.';
    }
    return null; // La validación es exitosa, no hay mensaje de error
  }

  String? validateString0a499(String value) {
    if (value == null || value.isEmpty) {
      return 'El campo no puede estar vacío.';
    }
    if (value.length < 1 || value.length >= 500) {
      return 'El campo debe tener entre 1 y 499 caracteres.';
    }
    return null; // La validación es exitosa, no hay mensaje de error
  }

  String? validateNumberID(String value) {
    if (value.isEmpty) {
      return 'El campo no puede estar vacío.';
    }

    // Verificar si el valor es un número válido
    if (double.tryParse(value) == null) {
      return 'Ingresa un número válido.';
    }

    // Verificar si el número cumple con la condición
    if (value.length < 5 || value.length > 10) {
      return 'El número debe tener entre 5 y 10 dígitos.';
    }

    return null; // La validación es exitosa, no hay mensaje de error
  }

  String? validateNumberCelular(String value) {
    if (value.isEmpty) {
      return 'El campo no puede estar vacío.';
    }

    // Verificar si el valor es un número válido
    if (double.tryParse(value) == null) {
      return 'Ingresa un número válido.';
    }

    // Convertir el valor a un número entero
    int number = int.parse(value);

    // Verificar si el número cumple con la condición
    if (value.length != 10) {
      return 'El número debe ser de 10 digitos.';
    }

    return null; // La validación es exitosa, no hay mensaje de error
  }

  void validateForm() {
    setState(() {
      // Reiniciar el contador de inputs válidos
      validInputsCount = 0;

      // Verificar la validez de los inputs

      Titulo = validateString0a50(controlTitulo.text);
      Nombre = validateString0a49(controlNombre.text);
      Apellido = validateString0a49(controlApellido.text);
      Identificacion = validateString0a49(controlIdentificacion.text);
      Numero = validateNumberID(controlNumero.text);
      Programa = validateString0a49(controlPrograma.text);
      Correo = validateEmail(controlCorreo.text);
      Celular = validateNumberCelular(controlCelular.text);
      Nombre2 = validateString0a49(controlNombre2.text);
      Apellido2 = validateString0a49(controlApellido2.text);
      Identificacion2 = validateString0a49(controlIdentificacion2.text);
      Numero2 = validateNumberID(controlNumero2.text);
      Programa2 = validateString0a49(controlPrograma2.text);
      Correo2 = validateEmail(controlCorreo2.text);
      Celular2 = validateNumberCelular(controlCelular2.text);
      LineaInvestigacion = validateString0a49(controlLineaInvestigacion.text);

      SublineaInvestigacion =
          validateString0a49(controlSublineaInvestigacion.text);
      AreaTematica = validateString0a49(controlAreaTematica.text);

      GrupoInvestigacion = validateString0a49(controlGrupoInvestigacion.text);
      Planteamiento = validateString0a499(controlPlanteamiento.text);
      Justificacion = validateString0a499(controlJustificacion.text);
      General = validateString0a499(controlGeneral.text);
      Especifico = validateString0a499(controlEspecifico.text);
      Bibliografia = validateString0a499(controlBibliografia.text);

      // Verificar si todos los inputs están validados correctamente
      if (controlTitulo == null &&
          Nombre == null &&
          Apellido == null &&
          Identificacion == null &&
          Numero == null &&
          Programa == null &&
          Correo == null &&
          Celular == null &&
          Nombre2 == null &&
          Apellido2 == null &&
          Identificacion2 == null &&
          Numero2 == null &&
          Programa2 == null &&
          Correo2 == null &&
          Celular2 == null &&
          LineaInvestigacion == null &&
          SublineaInvestigacion == null &&
          AreaTematica == null &&
          GrupoInvestigacion == null &&
          Planteamiento == null &&
          Justificacion == null &&
          General == null &&
          Especifico == null &&
          Bibliografia == null) {
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
    List<Step> stepList() => [
          Step(
              state: _activeCurrentStep <= 0
                  ? StepState.editing
                  : StepState.complete,
              isActive: _activeCurrentStep >= 0,
              title: const Text(''),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Input(
                      false,
                      controlTitulo,
                      "Titulo de la Propuesta",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateString0a50),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Text('Primer Integrante',
                      style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          color: const Color.fromARGB(255, 221, 221, 221))),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlNombre,
                      "Nombre",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateString0a49),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlApellido,
                      "Apellido",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateString0a49),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlIdentificacion,
                      "Identificacion",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateString0a49),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlNumero,
                      "N°",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateNumberID),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlPrograma,
                      "Programa",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateString0a49),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlCorreo,
                      "Correo",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateEmail),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlCelular,
                      "Celular",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateNumberCelular),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Text('Segundo Integrante',
                      style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          color: const Color.fromARGB(255, 221, 221, 221))),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlNombre2,
                      "Nombre",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateString0a49),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlApellido2,
                      "Apellido",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateString0a49),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlIdentificacion2,
                      "Identificacion",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateString0a49),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlNumero2,
                      "N°",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateNumberID),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlPrograma2,
                      "Programa",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateString0a49),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlCorreo2,
                      "Correo",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221),
                      validationFunction: validateEmail),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                    false,
                    controlCelular2,
                    "celular",
                    const EdgeInsets.all(0),
                    const EdgeInsets.only(bottom: 8),
                    const Color.fromRGBO(30, 30, 30, 1),
                    const Color.fromARGB(255, 221, 221, 221),
                    validationFunction: validateNumberCelular,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      SizedBox(width: Dimensiones.screenWidth * 0.02),
                      Button(
                        texto: "Siguiente",
                        color: const Color.fromRGBO(91, 59, 183, 1),
                        colorTexto: Colors.white,
                        onPressed: () {
                          setState(() => _activeCurrentStep += 1);
                        },
                      ),
                    ],
                  ),
                ],
              )),
          Step(
              state: _activeCurrentStep <= 1
                  ? StepState.editing
                  : StepState.complete,
              isActive: _activeCurrentStep >= 1,
              title: const Text(''),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Input(
                        false,
                        controlLineaInvestigacion,
                        "Linea de investigacion",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221),
                        validationFunction: validateString0a49),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    Input(
                        false,
                        controlSublineaInvestigacion,
                        "Sublinea de investigacion",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221),
                        validationFunction: validateString0a49),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    Input(
                        false,
                        controlAreaTematica,
                        "Area tematica",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221),
                        validationFunction: validateString0a49),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    Input(
                        false,
                        controlGrupoInvestigacion,
                        "Grupo de investigacion",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221),
                        validationFunction: validateString0a49),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          texto: "Atras",
                          color: Color.fromARGB(255, 66, 66, 66),
                          colorTexto: Colors.white,
                          onPressed: () {
                            setState(() => _activeCurrentStep -= 1);
                          },
                        ),
                        Button(
                          texto: "Siguiente",
                          color: const Color.fromRGBO(91, 59, 183, 1),
                          colorTexto: Colors.white,
                          onPressed: () {
                            setState(() => _activeCurrentStep += 1);
                          },
                        ),
                      ],
                    ),
                  ])),
          Step(
              state: _activeCurrentStep <= 2
                  ? StepState.editing
                  : StepState.complete,
              isActive: _activeCurrentStep >= 2,
              title: const Text(''),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputMedium(
                        controlPlanteamiento,
                        "Planteamiento",
                        EdgeInsets.symmetric(
                            vertical: Dimensiones.screenHeight * 0.02),
                        Colors.white,
                        const Color.fromRGBO(30, 30, 30, 1),
                        validationFunction: validateString0a499),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    InputMedium(
                        controlJustificacion,
                        "Justificacion",
                        EdgeInsets.symmetric(
                            vertical: Dimensiones.screenHeight * 0.02),
                        Colors.white,
                        const Color.fromRGBO(30, 30, 30, 1),
                        validationFunction: validateString0a499),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          texto: "Atras",
                          color: Color.fromARGB(255, 66, 66, 66),
                          colorTexto: Colors.white,
                          onPressed: () {
                            setState(() => _activeCurrentStep -= 1);
                          },
                        ),
                        Button(
                          texto: "Siguiente",
                          color: const Color.fromRGBO(91, 59, 183, 1),
                          colorTexto: Colors.white,
                          onPressed: () {
                            setState(() => _activeCurrentStep += 1);
                          },
                        ),
                      ],
                    ),
                  ])),
          Step(
              state: _activeCurrentStep <= 3
                  ? StepState.editing
                  : StepState.complete,
              isActive: _activeCurrentStep >= 3,
              title: const Text(''),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputMedium(
                        controlGeneral,
                        "General",
                        EdgeInsets.symmetric(
                            vertical: Dimensiones.screenHeight * 0.02),
                        Colors.white,
                        const Color.fromRGBO(30, 30, 30, 1),
                        validationFunction: validateString0a499),
                    SizedBox(height: Dimensiones.screenHeight * 0.02),
                    InputMedium(
                        controlEspecifico,
                        "Especificos",
                        EdgeInsets.symmetric(
                            vertical: Dimensiones.screenHeight * 0.02),
                        Colors.white,
                        const Color.fromRGBO(30, 30, 30, 1),
                        validationFunction: validateString0a499),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          texto: "Atras",
                          color: Color.fromARGB(255, 66, 66, 66),
                          colorTexto: Colors.white,
                          onPressed: () {
                            setState(() => _activeCurrentStep -= 1);
                          },
                        ),
                        Button(
                          texto: "Siguiente",
                          color: const Color.fromRGBO(91, 59, 183, 1),
                          colorTexto: Colors.white,
                          onPressed: () {
                            setState(() => _activeCurrentStep += 1);
                          },
                        ),
                      ],
                    ),
                  ])),
          Step(
              state: StepState.editing,
              isActive: _activeCurrentStep >= 4,
              title: const Text(''),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputMedium(
                        controlBibliografia,
                        "Bibliografias",
                        EdgeInsets.symmetric(
                            vertical: Dimensiones.screenHeight * 0.02),
                        Colors.white,
                        const Color.fromRGBO(30, 30, 30, 1),
                        validationFunction: validateString0a499),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
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
                            if (pickedFileextencion?.toLowerCase() == 'pdf') {
                              return ""; // Validación exitosa, no hay mensaje de error
                            } else {
                              return 'El archivo debe ser de tipo PDF.'; // Mensaje de error si el tipo de archivo no es PDF
                            }
                          }),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          texto: "Atras",
                          color: Color.fromARGB(255, 66, 66, 66),
                          colorTexto: Colors.white,
                          onPressed: () {
                            setState(() => _activeCurrentStep -= 1);
                          },
                        ),
                        Button(
                            texto: "Enviar",
                            color: const Color.fromRGBO(91, 59, 183, 1),
                            colorTexto: Colors.white,
                            onPressed: isButtonEnabled &&
                                    pickedFileextencion?.toLowerCase() == 'pdf'
                                ? () async {
                                    String index =
                                        await controlI.consultarIndex();

                                    var Propuesta = <String, dynamic>{
                                      'titulo': controlTitulo.text,
                                      'idEstudiante': controlu.emailf,
                                      'idPropuesta': index,
                                      'nombre': controlNombre.text,
                                      'apellido': controlApellido.text,
                                      'identificacion':
                                          controlIdentificacion.text,
                                      'numero': controlNumero.text,
                                      'programa': controlPrograma.text,
                                      'correo': controlCorreo.text,
                                      'celular': controlCelular.text,
                                      'nombre2': controlNombre2.text,
                                      'apellido2': controlApellido2.text,
                                      'identificacion2':
                                          controlIdentificacion2.text,
                                      'numero2': controlNumero2.text,
                                      'programa2': controlPrograma2.text,
                                      'correo2': controlCorreo2.text,
                                      'celular2': controlCelular2.text,
                                      'lineaInvestigacion':
                                          controlLineaInvestigacion.text,
                                      'sublineaInvestigacion':
                                          controlSublineaInvestigacion.text,
                                      'areaTematica': controlAreaTematica.text,
                                      'grupoInvestigacion':
                                          controlGrupoInvestigacion.text,
                                      'planteamiento':
                                          controlPlanteamiento.text,
                                      'justificacion':
                                          controlJustificacion.text,
                                      'general': controlGeneral.text,
                                      'especificos': controlEspecifico.text,
                                      'bibliografia': controlBibliografia.text,
                                      'anexos': controlAnexo.text,
                                      'estado': "Pendiente",
                                      'retroalimentacion': '',
                                      'calificacion': '',
                                      'idDocente': ''
                                    };
                                    controlp
                                        .registrarPropuesta(Propuesta,
                                            pickedFilePath, pickedFileextencion)
                                        .then((value) => {
                                              Get.showSnackbar(
                                                  const GetSnackBar(
                                                title: 'Regristrar Propuesta',
                                                message:
                                                    'Datos registrados Correctamente',
                                                icon: Icon(
                                                    Icons.gpp_good_outlined),
                                                duration: Duration(seconds: 5),
                                                backgroundColor:
                                                    Colors.greenAccent,
                                              )),
                                              Get.offAll(() =>
                                                  HomePage(rol: "estudiante")),
                                            })
                                        .catchError((e) {
                                      Get.showSnackbar(const GetSnackBar(
                                        title: 'Regristrar Propuesta',
                                        message: 'Error al registrar propuesta',
                                        icon: Icon(Icons.warning),
                                        duration: Duration(seconds: 5),
                                        backgroundColor: Colors.red,
                                      ));
                                    });
                                  }
                                : () async {
                                    Get.showSnackbar(const GetSnackBar(
                                      title: 'Regristrar Propuesta',
                                      message: 'Por favor verifique los campos',
                                      icon: Icon(Icons.gpp_good_outlined),
                                      duration: Duration(seconds: 5),
                                      backgroundColor:
                                          Color.fromARGB(255, 241, 63, 9),
                                    ));
                                  }),
                      ],
                    ),
                  ])),
        ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            top: Dimensiones.height5,
            right: Dimensiones.width5,
            left: Dimensiones.width5),
        child: Column(
          children: <Widget>[
            Header(
                icon: Icons.arrow_back_rounded, texto: 'Registrar Propuesta'),
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: Dimensiones.screenHeight * 0.79,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensiones.screenWidth * 0.01),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('General',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.0,
                                  color: const Color.fromARGB(
                                      255, 221, 221, 221))),
                          Text('Especif',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.0,
                                  color: const Color.fromARGB(
                                      255, 221, 221, 221))),
                          Text('Probem',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.0,
                                  color: const Color.fromARGB(
                                      255, 221, 221, 221))),
                          Text('Objetivo',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.0,
                                  color: const Color.fromARGB(
                                      255, 221, 221, 221))),
                          Text('anexos',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.0,
                                  color: const Color.fromARGB(
                                      255, 221, 221, 221))),
                        ]),
                  ),
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                          scrollbarTheme: ScrollbarThemeData(
                            interactive: true,
                            crossAxisMargin: Dimensiones.screenWidth * 0.02,
                            mainAxisMargin: Dimensiones.screenWidth * 0.05,
                            radius: const Radius.circular(14),
                            thumbColor:
                                MaterialStateProperty.all((Colors.grey[500])),
                          ),
                          canvasColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: Stepper(
                        controlsBuilder: (context, controller) {
                          return const SizedBox.shrink();
                        },
                        physics: const ScrollPhysics(),
                        margin: EdgeInsets.zero,
                        type: StepperType.horizontal,
                        currentStep: _activeCurrentStep,
                        steps: stepList(),
                        onStepTapped: (int index) {
                          setState(() => _activeCurrentStep = index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
