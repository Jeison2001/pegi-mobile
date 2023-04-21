import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class Filter extends StatelessWidget {
  final TextEditingController controlador;
  String texto;
  Filter({Key? key, required this.controlador, required this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensiones.height2),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensiones.width5),
                child: Text(texto,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 15,
                    )),
              ),
              Expanded(
                child: TextField(
                    controller: controlador,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: const Color.fromRGBO(113, 77, 217, 1),
                    autofocus: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 30),
                      filled: true,
                      fillColor: const Color.fromRGBO(30, 30, 30, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    )),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.02),
            child: Container(
              height: Dimensiones.height5,
              width: Dimensiones.width90,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 4, color: Color.fromRGBO(30, 30, 30, 1)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
