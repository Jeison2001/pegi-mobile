import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pegi/ui/utils/Dimensiones.dart';

class InputText extends StatelessWidget {
  final String controlador;
  final String texto;
  final bool esContrasena;
  Color? colorF;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Color colorText;

  InputText(this.esContrasena, this.controlador, this.texto, this.margin,
      this.padding, this.colorF, this.colorText,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController control =
        TextEditingController(text: controlador);

    return Container(
      padding: padding,
      margin: margin,
      child: TextField(
          cursorColor: Colors.black,
          obscureText: esContrasena,
          style: TextStyle(color: colorText),
          autofocus: false,
          controller: control,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 30),
            filled: true,
            fillColor: colorF,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            focusColor: colorText,
            labelText: texto,
            labelStyle: GoogleFonts.montserrat(
              fontSize: 16,
              color: colorText,
            ),
          )),
    );
  }
}

class InputTextMedium extends StatelessWidget {
  final String? controlador;
  final String texto;
  Color? colorF;
  Color? colorText;
  EdgeInsets? padding;

  InputTextMedium(
      this.controlador, this.texto, this.padding, this.colorText, this.colorF,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController control =
        TextEditingController(text: controlador);
    return Container(
      padding: padding,
      child: TextField(
          cursorColor: colorText,
          autofocus: false,
          maxLines: 8,
          controller: control,
          style: TextStyle(color: colorText),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Dimensiones.screenWidth * 0.08,
                vertical: Dimensiones.screenHeight * 0.03),
            filled: true,
            fillColor: colorF,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            focusColor: colorText,
            labelText: texto,
            labelStyle: GoogleFonts.montserrat(
              fontSize: 16,
              color: colorText,
            ),
          )),
    );
  }
}

class InputTextDownload extends StatelessWidget {
  final String texto;
  IconData icon;
  final Color color;
  final VoidCallback? onPressed;
  InputTextDownload(
      {required this.texto,
      required this.icon,
      required this.color,
      this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(vertical: Dimensiones.screenHeight * 0.04),
        child: MaterialButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            color: color,
            onPressed: onPressed,
            height: Dimensiones.height30,
            minWidth: Dimensiones.screenWidth * 0.85,
            child: Padding(
              padding: EdgeInsets.all(Dimensiones.screenWidth * 0.02),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: Dimensiones.screenHeight * 0.04),
                    child: Icon(icon,
                        size: 60.0, color: Color.fromARGB(255, 119, 116, 116)),
                  ),
                  Text(texto,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w200)),
                ],
              ),
            )));
  }
}
