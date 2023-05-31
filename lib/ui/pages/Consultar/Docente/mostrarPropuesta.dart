import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../../../widgets/Button.dart';
import '../../../widgets/Input.dart';

class MostrarPropuesta extends StatefulWidget {
  const MostrarPropuesta({super.key});

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
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlApellido,
                      "Appelido",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlIdentificacion,
                      "Identificacion",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlNumero,
                      "N°",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlPrograma,
                      "Programa",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlCorreo,
                      "Correo",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlCelular,
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
                  Input(
                      false,
                      controlNombre2,
                      "Nombre",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlApellido2,
                      "Appelido",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlIdentificacion2,
                      "Identificacion",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlNumero2,
                      "N°",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlPrograma2,
                      "Programa",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlCorreo2,
                      "Correo",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlCelular2,
                      "Celular",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Dimensiones.height2),
                      child: Row(
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
                      )),
                ],
              )),
          Step(
              state: StepState.indexed,
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
                        const Color.fromARGB(255, 221, 221, 221)),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    Input(
                        false,
                        controlSublineaInvestigacion,
                        "Sublinea de investigacion",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221)),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    Input(
                        false,
                        controlAreaTematica,
                        "Area tematica",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221)),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    Input(
                        false,
                        controlGrupoInvestigacion,
                        "Grupo de investigacion",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221)),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensiones.height2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button(
                              texto: "Atras",
                              color: const Color.fromARGB(255, 66, 66, 66),
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
                        )),
                  ])),
          Step(
              state: StepState.indexed,
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
                    ),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    InputMedium(
                      controlJustificacion,
                      "Justificacion",
                      EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.02),
                      Colors.white,
                      const Color.fromRGBO(30, 30, 30, 1),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensiones.height2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button(
                              texto: "Atras",
                              color: const Color.fromARGB(255, 66, 66, 66),
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
                        )),
                  ])),
          Step(
              state: StepState.indexed,
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
                    ),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    InputMedium(
                      controlEspecifico,
                      "Especificos",
                      EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.02),
                      Colors.white,
                      const Color.fromRGBO(30, 30, 30, 1),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensiones.height2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button(
                              texto: "Atras",
                              color: const Color.fromARGB(255, 66, 66, 66),
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
                        )),
                  ])),
          Step(
              state: StepState.indexed,
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
                    ),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    InputDownload(
                        texto: "Añadir anexo",
                        icon: Icons.add_to_photos_outlined,
                        color: const Color.fromRGBO(30, 30, 30, 1),
                        onPressed: () {}),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensiones.height2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Button(
                              texto: "Atras",
                              color: const Color.fromARGB(255, 66, 66, 66),
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
                        )),
                  ])),
        ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(
                icon: Icons.arrow_back_rounded, texto: 'Consultar Propuesta'),
            MostrarTodo(
                texto: 'Harina base de \ninsectos.',
                colorBoton: const Color.fromRGBO(91, 59, 183, 1),
                estado: true,
                tipo: 'Pendiente',
                onPressed: () {},
                color: Colors.black,
                fijarIcon: false,
                icon: Icons.mode_edit_outline_rounded,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensiones.screenWidth * 0.06,
                    vertical: Dimensiones.height2)),
            Padding(
              padding:
                  EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.0001),
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
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: Dimensiones.screenHeight * 0.002),
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensiones.screenWidth * 0.001),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('General',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            fontSize: 12.0,
                            color: const Color.fromARGB(255, 221, 221, 221))),
                    Text('Especificaciones',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            fontSize: 12.0,
                            color: const Color.fromARGB(255, 221, 221, 221))),
                    Text('Problematica',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            fontSize: 12.0,
                            color: const Color.fromARGB(255, 221, 221, 221))),
                    Text('Objetivos',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            fontSize: 12.0,
                            color: const Color.fromARGB(255, 221, 221, 221))),
                    Text('Bibliografia',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            fontSize: 12.0,
                            color: const Color.fromARGB(255, 221, 221, 221))),
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
                      thumbColor: MaterialStateProperty.all((Colors.grey[500])),
                    ),
                    canvasColor: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: Stepper(
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
    );
  }
}
