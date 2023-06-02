import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class Consultar extends StatefulWidget {
  final String texto;
  final Color colorBoton;
  final VoidCallback onPressed;
  final IconData icon;

  const Consultar({
    Key? key, // Corrección aquí
    required this.icon,
    required this.texto,
    required this.colorBoton,
    required this.onPressed,
  }) : super(key: key);
  @override
  State<Consultar> createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensiones.width5),
              child: MaterialButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: widget.colorBoton,
                  onPressed: () {
                    widget.onPressed();
                  },
                  height: Dimensiones.height15,
                  child: Padding(
                    padding: EdgeInsets.all(Dimensiones.screenWidth * 0.02),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: Dimensiones.screenWidth * 0.02,
                              right: Dimensiones.screenWidth * 0.04),
                          child:
                              Icon(widget.icon, size: 40, color: Colors.white),
                        ),
                        Text(widget.texto,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}

class Mostrar extends StatelessWidget {
  final String texto;
  final String tipo;
  final Color colorTipo;
  final Color colorBoton;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;

  const Mostrar({
    required this.texto,
    required this.tipo,
    required this.colorTipo,
    required this.colorBoton,
    required this.onPressed,
    required this.onLongPress,
    Key? key, // Corrección aquí
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensiones.width5, vertical: Dimensiones.height2),
        child: MaterialButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            color: colorBoton,
            onPressed: () {
              onPressed();
            },
            onLongPress: () {
              onLongPress();
            },
            height: Dimensiones.screenHeight * 0.17,
            minWidth: Dimensiones.screenWidth * 0.90,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensiones.screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      texto,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          fontSize: 17.0,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: Dimensiones.screenHeight * 0.015,
                    ),
                    Container(
                      width: Dimensiones.screenWidth * 0.25,
                      height: Dimensiones.screenHeight * 0.03,
                      padding: const EdgeInsets.only(top: 2.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80),
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(80)),
                        color: colorTipo,
                      ),
                      child: Text(
                        tipo.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                            color: const Color.fromARGB(255, 221, 221, 221)),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
