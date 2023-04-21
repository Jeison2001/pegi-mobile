import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/widgets/Icons.dart';
import 'package:pegi/ui/widgets/Input.dart';

import '../../../domain/Controllers/controladorUsuario.dart';
import '../../utils/Dimensiones.dart';

class Registrar extends StatefulWidget {
  const Registrar({super.key});

  @override
  State<Registrar> createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlApellido = TextEditingController();
  TextEditingController controlCorreo = TextEditingController();
  TextEditingController controlContrasena = TextEditingController();
  ControlUsuario controlu = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensiones.height70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage('assets/images/home.png'),
                      fit: BoxFit.cover)),
            )),
        Positioned(
            top: Dimensiones.height5,
            left: Dimensiones.width5,
            child: IconButton(
              icon: AppIcon(
                  iconD: Icons.arrow_back_ios,
                  iconColor: const Color.fromARGB(255, 202, 209, 209)),
              onPressed: () {
                Get.offAllNamed('/principal');
              },
            )),
        Positioned(
            top: Dimensiones.height15,
            left: Dimensiones.width15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Registrar',
                  style: GoogleFonts.kodchasan(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Ingrese sus datos para continuar',
                  style: GoogleFonts.kodchasan(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ],
            )),
        Positioned(
            left: 0,
            right: 0,
            top: Dimensiones.height30,
            height: Dimensiones.height80,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensiones.width10,
                  vertical: Dimensiones.height5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Input(
                    false,
                    controlCorreo,
                    "Correo",
                    const EdgeInsets.all(0),
                    const EdgeInsets.only(top: 10, bottom: 20),
                    const Color.fromARGB(255, 197, 197, 197),
                    Colors.grey.shade700,
                  ),
                  Input(
                    false,
                    controlContrasena,
                    "Contraseña",
                    const EdgeInsets.all(0),
                    const EdgeInsets.only(top: 10),
                    const Color.fromARGB(255, 197, 197, 197),
                    Colors.grey.shade700,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensiones.height5),
                    child: ElevatedButton(
                      onPressed: () {
                        controlu.RegistrarDatos(
                                controlCorreo.text, controlContrasena.text)
                            .then((value) {
                          if (controlu.emailf != 'Sin Registro') {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'Validacion de Usuarios',
                              message: 'Datos registrados Correctamente',
                              icon: Icon(Icons.gpp_good_outlined),
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.greenAccent,
                            ));
                            Get.offAllNamed("/ingresar");
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'Validacion de Usuarios',
                              message: 'Datos Invalidos',
                              icon: Icon(Icons.warning),
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }).catchError((e) {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Validacion de Usuarios',
                            message: 'Datos Invalidos',
                            icon: Icon(Icons.warning),
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.red,
                          ));
                        });
                      },
                      child: Text("Registrar",
                          style: GoogleFonts.kodchasan(
                            color: Colors.white,
                            fontSize: 13,
                          )),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minimumSize: const Size(400, 50),
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
