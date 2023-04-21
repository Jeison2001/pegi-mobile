import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class Header extends StatelessWidget {
  IconData icon;
  String texto;

  Header({Key? key, required this.icon, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(icon, color: Colors.white)),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sunny, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications, color: Colors.white))
        ]),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensiones.height2,
                horizontal: Dimensiones.screenWidth * 0.04),
            child: Text(texto,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
  }
}
