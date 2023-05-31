import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class Button extends StatefulWidget {
  final String texto;
  final Color color;
  final Color colorTexto;
  final VoidCallback onPressed;
  const Button(
      {super.key,
      required this.texto,
      required this.color,
      required this.colorTexto,
      required this.onPressed});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        minimumSize: Size(Dimensiones.width5, Dimensiones.screenHeight * 0.05),
      ),
      child: Text(widget.texto,
          style: GoogleFonts.kodchasan(
            color: widget.colorTexto,
            fontSize: 14,
          )),
    );
  }
}
