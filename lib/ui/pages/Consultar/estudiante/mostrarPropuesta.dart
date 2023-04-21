import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/domain/models/propuesta.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../../../widgets/Button.dart';
import '../../../widgets/inputText.dart';

class MostrarPropuesta extends StatefulWidget {
  final Propuesta propuesta;

  const MostrarPropuesta({
    super.key,
    required this.propuesta,
  });

  @override
  State<MostrarPropuesta> createState() => _MostrarPropuestaState();
}

class _MostrarPropuestaState extends State<MostrarPropuesta> {
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
  int _activeCurrentStep = 0;

  @override
  Widget build(BuildContext context) {
    List<Step> stepList() => [
          Step(
              state: StepState.indexed,
              isActive: _activeCurrentStep >= 0,
              title: const Text(''),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputText(
                      false,
                      controlNombre.text = widget.propuesta.titulo,
                      "Titulo de la Propuesta",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Text('Primer Integrante',
                      style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          color: const Color.fromARGB(255, 221, 221, 221))),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.nombre,
                      "Nombre",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.apellido,
                      "Appelido",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.identificacion,
                      "Identificacion",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.numero,
                      "N°",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.programa,
                      "Programa",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.correo,
                      "Correo",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.celular,
                      "Celular",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Text('Segundo Integrante',
                      style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          color: const Color.fromARGB(255, 221, 221, 221))),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.nombre2,
                      "Nombre",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.apellido2,
                      "Appelido",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.identificacion2,
                      "Identificacion",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.numero2,
                      "N°",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.programa2,
                      "Programa",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.correo2,
                      "Correo",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  InputText(
                      false,
                      widget.propuesta.celular2,
                      "Celular",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              state: StepState.indexed,
              isActive: _activeCurrentStep >= 1,
              title: const Text(''),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputText(
                        false,
                        widget.propuesta.lineaInvestigacion,
                        "Linea de investigacion",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221)),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    InputText(
                        false,
                        widget.propuesta.sublineaInvestigacion,
                        "Sublinea de investigacion",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221)),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    InputText(
                        false,
                        widget.propuesta.areaTematica,
                        "Area tematica",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221)),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    InputText(
                        false,
                        widget.propuesta.grupoInvestigacion,
                        "Grupo de investigacion",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(
                          texto: "Atras",
                          color: Color.fromARGB(255, 66, 66, 66),
                          colorTexto: Colors.white,
                          onPressed: () {
                            setState(() => _activeCurrentStep -= 1);
                          },
                        ),
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
                  ])),
          Step(
              state: StepState.indexed,
              isActive: _activeCurrentStep >= 2,
              title: const Text(''),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputTextMedium(
                      widget.propuesta.planteamiento,
                      "Planteamiento",
                      EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.02),
                      Colors.white,
                      const Color.fromRGBO(30, 30, 30, 1),
                    ),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    InputTextMedium(
                      widget.propuesta.justificacion,
                      "Justificacion",
                      EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.02),
                      Colors.white,
                      const Color.fromRGBO(30, 30, 30, 1),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(
                          texto: "Atras",
                          color: Color.fromARGB(255, 66, 66, 66),
                          colorTexto: Colors.white,
                          onPressed: () {
                            setState(() => _activeCurrentStep -= 1);
                          },
                        ),
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
                  ])),
          Step(
              state: StepState.indexed,
              isActive: _activeCurrentStep >= 3,
              title: const Text(''),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputTextMedium(
                      widget.propuesta.general,
                      "General",
                      EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.02),
                      Colors.white,
                      const Color.fromRGBO(30, 30, 30, 1),
                    ),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    InputTextMedium(
                      widget.propuesta.especificos,
                      "Especificos",
                      EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.02),
                      Colors.white,
                      const Color.fromRGBO(30, 30, 30, 1),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(
                          texto: "Atras",
                          color: Color.fromARGB(255, 66, 66, 66),
                          colorTexto: Colors.white,
                          onPressed: () {
                            setState(() => _activeCurrentStep -= 1);
                          },
                        ),
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
                  ])),
          Step(
              state: StepState.indexed,
              isActive: _activeCurrentStep >= 4,
              title: const Text(''),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputTextMedium(
                      widget.propuesta.bibliografia,
                      "Bibliografias",
                      EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.02),
                      Colors.white,
                      const Color.fromRGBO(30, 30, 30, 1),
                    ),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    InputTextDownload(
                        texto: "Descargar anexo",
                        icon: Icons.add_to_photos_outlined,
                        color: const Color.fromRGBO(30, 30, 30, 1),
                        onPressed: () {}),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Button(
                          texto: "Atras",
                          color: Color.fromARGB(255, 66, 66, 66),
                          colorTexto: Colors.white,
                          onPressed: () {
                            setState(() => _activeCurrentStep -= 1);
                          },
                        ),
                        SizedBox(width: Dimensiones.screenWidth * 0.02),
                        Button(
                          texto: "Enviar",
                          color: const Color.fromRGBO(91, 59, 183, 1),
                          colorTexto: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ])),
        ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensiones.screenHeight * 0.0001,
              horizontal: Dimensiones.screenWidth * 0.03),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensiones.height2),
            child: Column(
              children: <Widget>[
                Header(
                    icon: Icons.arrow_back_rounded,
                    texto: 'Consultar Propuesta'),
                MostrarTodo(
                  texto: widget.propuesta.titulo,
                  colorBoton:
                      widget.propuesta.estado.toLowerCase() == 'pendiente'
                          ? const Color.fromRGBO(91, 59, 183, 1)
                          : const Color.fromRGBO(18, 180, 122, 1),
                  estado: true,
                  tipo: widget.propuesta.estado,
                  onPressed: () {},
                  color: Colors.black,
                  fijarIcon: false,
                  icon: Icons.mode_edit_outline_rounded,
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensiones.screenHeight * 0.0001,
                      horizontal: Dimensiones.screenWidth * 0.03),
                ),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  height: Dimensiones.screenHeight * 0.53,
                  width: Dimensiones.screenWidth * 0.89,
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
                                thumbColor: MaterialStateProperty.all(
                                    (Colors.grey[500])),
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
        ),
      ),
    );
  }
}
