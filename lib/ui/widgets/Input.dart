import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class Input extends StatefulWidget {
  final TextEditingController controlador;
  final String texto;
  final bool esContrasena;
  Color? colorF;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Color colorText;
  final Function(String)? validationFunction;

  Input(
    this.esContrasena,
    this.controlador,
    this.texto,
    this.margin,
    this.padding,
    this.colorF,
    this.colorText, {
    this.validationFunction,
    Key? key,
  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: Column(
        children: [
          TextField(
            cursorColor: Colors.black,
            obscureText: widget.esContrasena,
            style: TextStyle(color: widget.colorText),
            autofocus: false,
            controller: widget.controlador,
            onChanged: (value) {
              setState(() {
                showError = widget.validationFunction?.call(value) != null;
              });
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 30),
              filled: true,
              fillColor: widget.colorF,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              focusColor: widget.colorText,
              labelText: widget.texto,
              labelStyle: TextStyle(
                fontSize: 16,
                color: widget.colorText,
              ),
            ),
          ),
          if (showError && widget.validationFunction != null)
            Text(
              widget.validationFunction!(widget.controlador.text) ?? '',
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}

class InputMedium extends StatefulWidget {
  final TextEditingController controlador;
  final String texto;
  Color? colorF;
  Color? colorText;
  EdgeInsets? padding;
  final Function(String)? validationFunction;

  InputMedium(
    this.controlador,
    this.texto,
    this.padding,
    this.colorText,
    this.colorF, {
    this.validationFunction,
    Key? key,
  }) : super(key: key);

  @override
  _InputMediumState createState() => _InputMediumState();
}

class _InputMediumState extends State<InputMedium> {
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorColor: widget.colorText,
            autofocus: false,
            maxLines: 8,
            controller: widget.controlador,
            style: TextStyle(color: widget.colorText),
            onChanged: (value) {
              setState(() {
                showError = widget.validationFunction?.call(value) != null;
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Dimensiones.screenWidth * 0.08,
                  vertical: Dimensiones.screenHeight * 0.03),
              filled: true,
              fillColor: widget.colorF,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              focusColor: widget.colorText,
              labelText: widget.texto,
              labelStyle: GoogleFonts.montserrat(
                fontSize: 16,
                color: widget.colorText,
              ),
            ),
          ),
          if (showError && widget.validationFunction != null)
            Text(
              widget.validationFunction!(widget.controlador.text) ?? '',
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}

class InputDownload extends StatelessWidget {
  final String texto;
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;
  final Function()?
      validationFunction; // Atributo para la función de validación

  InputDownload({
    required this.texto,
    required this.icon,
    required this.color,
    this.onPressed,
    this.validationFunction, // Asignación del atributo de validación
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensiones.screenHeight * 0.04),
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
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
                  bottom: Dimensiones.screenHeight * 0.04,
                ),
                child: Icon(
                  icon,
                  size: 60.0,
                  color: Color.fromARGB(255, 119, 116, 116),
                ),
              ),
              Text(
                texto,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
              if (validationFunction != null) // Mostrar mensaje de error
                Text(
                  validationFunction!(),
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
