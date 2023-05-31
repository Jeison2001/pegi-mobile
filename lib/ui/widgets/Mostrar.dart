import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class MostrarTodo extends StatefulWidget {
  final String texto;
  final IconData? icon;
  final IconData? icon2;

  final EdgeInsets padding;
  bool fijarIcon;
  final bool? estado;
  final String? tipo;
  final Color colorBoton;
  final Color color;
  final VoidCallback onPressed;
  VoidCallback? onPressed2;

  String? calificacion;
  MostrarTodo(
      {super.key,
      required this.texto,
      this.tipo,
      this.calificacion,
      this.estado = false,
      required this.colorBoton,
      required this.onPressed,
      required this.color,
      required this.fijarIcon,
      this.icon,
      required this.padding,
      this.icon2,
      this.onPressed2});

  @override
  State<MostrarTodo> createState() => _MostrarTodoState();
}

class _MostrarTodoState extends State<MostrarTodo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimensiones.screenHeight * 0.02,
          bottom: 0,
          left: 0.001,
          right: 0.001),
      child: Container(
          height: Dimensiones.screenHeight * 0.14,
          width: Dimensiones.width90,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              color: widget.color),
          child: Padding(
              padding: widget.padding,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: Dimensiones.screenHeight * 0.019),
                          child: SizedBox(
                            width: Dimensiones.width60,
                            child: Text(
                              widget.texto,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                            child: widget.estado == false
                                ? Container()
                                : Row(
                                    children: [
                                      Container(
                                        width: Dimensiones.screenWidth * 0.25,
                                        height: Dimensiones.screenHeight * 0.03,
                                        padding:
                                            const EdgeInsets.only(top: 2.0),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(80),
                                              bottomRight: Radius.circular(80),
                                              topLeft: Radius.circular(80),
                                              topRight: Radius.circular(80)),
                                          color: widget.colorBoton,
                                        ),
                                        child: Text(
                                          widget.tipo.toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.0,
                                              color: const Color.fromARGB(
                                                  255, 221, 221, 221)),
                                        ),
                                      ),
                                      Container(
                                        width: Dimensiones.screenWidth * 0.25,
                                        height: Dimensiones.screenHeight * 0.03,
                                        padding:
                                            const EdgeInsets.only(top: 2.0),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(80),
                                              bottomRight: Radius.circular(80),
                                              topLeft: Radius.circular(80),
                                              topRight: Radius.circular(80)),
                                          color: Colors.transparent,
                                        ),
                                        child: Text(
                                          widget.tipo
                                                      .toString()
                                                      .toLowerCase() ==
                                                  'calificado'
                                              ? "Nota: ${widget.calificacion}"
                                              : "",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.0,
                                              color: const Color.fromARGB(
                                                  255, 221, 221, 221)),
                                        ),
                                      )
                                    ],
                                  )),
                      ],
                    ),
                    Column(
                      verticalDirection: VerticalDirection.up,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            heightFactor: 1.5,
                            alignment: Alignment.topCenter,
                            child: widget.fijarIcon == false
                                ? Container()
                                : IconButton(
                                    onPressed: () {
                                      widget.onPressed();
                                    },
                                    icon: Icon(
                                      widget.icon,
                                      size: 25,
                                      color:
                                          const Color.fromRGBO(91, 59, 183, 1),
                                    ),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            heightFactor: 1.5,
                            alignment: Alignment.topCenter,
                            child: widget.fijarIcon == false &&
                                    widget.icon2 != null
                                ? Container()
                                : IconButton(
                                    onPressed: () {
                                      widget.onPressed2!();
                                    },
                                    icon: Icon(
                                      widget.icon2,
                                      size: 25,
                                      color:
                                          const Color.fromRGBO(91, 59, 183, 1),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ]))),
    );
  }
}
