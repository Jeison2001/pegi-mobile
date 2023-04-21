import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              child: Container(
            width: double.maxFinite,
            height: Dimensiones.height90,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/home.png'),
                    fit: BoxFit.cover)),
          )),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: Dimensiones.height40),
                child: Text(
                  'Pegi',
                  style: GoogleFonts.kodchasan(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w500),
                ),
              )),
          Positioned(
              width: Dimensiones.screenWidth,
              top: Dimensiones.height60,
              height: Dimensiones.height50,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensiones.width10,
                  vertical: Dimensiones.height5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: Dimensiones.screenHeight * 0.03),
                          child: Text(
                            'Bienvenido',
                            style: GoogleFonts.kodchasan(
                                color: Colors.black,
                                fontSize: Dimensiones.width10,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(bottom: Dimensiones.height5),
                      child: Text(
                          'Asombroso cómo este sistema de desarrollo te permite gestionar tu academia online desde la comodidad de tu hogar.',
                          style: GoogleFonts.kodchasan(
                            color: Colors.black,
                            fontSize: 13,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.offAllNamed('/ingresar');
                            },
                            child: Text("Ingresar",
                                style: GoogleFonts.kodchasan(
                                  color: Colors.white,
                                  fontSize: 13,
                                )),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              minimumSize: Size(Dimensiones.width35,
                                  Dimensiones.buttonHeight),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.offAllNamed('/registrar');
                            },
                            child: Text("Registrarse",
                                style: GoogleFonts.kodchasan(
                                  color: Colors.black,
                                  fontSize: 13,
                                )),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(
                                        color: Colors.black, width: 1.5)),
                                minimumSize: Size(Dimensiones.width35,
                                    Dimensiones.buttonHeight)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
