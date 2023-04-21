import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class Navbar extends StatelessWidget {
  final String rol;
  IconData icono;
  Navbar(this.rol, this.icono, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensiones.height5),
      child: Column(
        children: [
          Row(children: [
            Icon(icono, color: Colors.white),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.sunny, color: Colors.white)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications, color: Colors.white)),
            IconButton(
                onPressed: () {
                  Get.offAllNamed('/principal');
                },
                icon: const Icon(Icons.login_outlined, color: Colors.white)),
          ]),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Hola, ' + rol,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 5),
              Text('sé productivo hoy',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}
