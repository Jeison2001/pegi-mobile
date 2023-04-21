import 'package:flutter/material.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressAvatar extends StatelessWidget {
  String label;
  String seguimiento;
  double porcentaje; //
  Color color;
  String texto;
  bool? tieneFecha;
  String? fecha;
  ProgressAvatar(
      {super.key,
      this.tieneFecha = false,
      this.fecha,
      required this.texto,
      required this.seguimiento,
      required this.label,
      required this.porcentaje,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensiones.width5),
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              color: Color.fromRGBO(30, 30, 30, 1)),
          child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensiones.screenHeight * 0.02),
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensiones.width10, right: Dimensiones.width5),
                  child: CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 10.0,
                    animation: true,
                    percent: porcentaje,
                    center: Text(
                      label,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: color,
                    backgroundColor: const Color.fromRGBO(65, 65, 68, 1),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      texto,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.01),
                      child: Text(
                        seguimiento,
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                        child: tieneFecha == false
                            ? Container()
                            : Container(
                                width: Dimensiones.width15,
                                height: Dimensiones.screenHeight * 0.03,
                                padding: const EdgeInsets.all(4.0),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(100),
                                      bottomRight: Radius.circular(100),
                                      topLeft: Radius.circular(100),
                                      topRight: Radius.circular(100)),
                                  color: Color.fromRGBO(33, 150, 243, 1),
                                ),
                                child: Text(
                                  fecha.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      //backgroundColor: Color.fromRGBO(33, 150, 243, 1),
                                      color:
                                          Color.fromARGB(255, 221, 221, 221)),
                                ),
                              )),
                  ],
                ),
              ]))),
    );
  }
}
