
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/ui/pages/home.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Icons.dart';
import 'package:pegi/ui/widgets/Input.dart';

class Ingresar extends StatefulWidget {
  const Ingresar({super.key});

  @override
  State<Ingresar> createState() => _IngresarState();
}

class _IngresarState extends State<Ingresar> {
  TextEditingController controlUsuario = TextEditingController();
  TextEditingController controlContrasena = TextEditingController();
  ControlUsuario controlu = Get.find();
  String? emailError;
  String? passwordError;
  bool isButtonEnabled = false; // Estado inicial del botón deshabilitado

  @override
  void initState() {
    super.initState();
    controlUsuario.addListener(validateForm);
    controlContrasena.addListener(validateForm);
  }

  @override
  void dispose() {
    controlUsuario.dispose();
    controlContrasena.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      emailError = 'El correo no puede estar vacío.';
    } else if (!value.endsWith("@unicesar.edu.co")) {
      emailError = 'El correo debe terminar con "@unicesar.edu.co".';
    } else {
      emailError = null; // Limpiar el mensaje de error
    }
    return emailError;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      passwordError = 'La contraseña no puede estar vacía.';
    } else if (value.isEmpty || value.length >= 50) {
      passwordError = 'La contraseña debe tener entre 1 y 49 caracteres.';
    } else {
      passwordError = null; // Limpiar el mensaje de error
    }
    return passwordError;
  }

  void validateForm() {
    setState(() {
      // Verificar si hay mensajes de error en los campos de correo y contraseña
      if (validateEmail(controlUsuario.text) == null &&
          validatePassword(controlContrasena.text) == null) {
        // Ambos campos están validados, habilitar el botón
        isButtonEnabled = true;
      } else {
        // Al menos uno de los campos tiene un mensaje de error, deshabilitar el botón
        isButtonEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensiones.height70,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensiones.height5,
            left: Dimensiones.width5,
            child: IconButton(
              icon: const AppIcon(
                iconD: Icons.arrow_back_ios,
                iconColor: Color.fromARGB(255, 202, 209, 209),
              ),
              onPressed: () {
                Get.offAllNamed('/principal');
              },
            ),
          ),
          Positioned(
            top: Dimensiones.height15,
            left: Dimensiones.width15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingresar',
                  style: GoogleFonts.kodchasan(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Ingrese sus datos para continuar',
                  style: GoogleFonts.kodchasan(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensiones.height30,
            height: Dimensiones.height80,
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
                  Input(
                    false,
                    controlUsuario,
                    "Correo",
                    const EdgeInsets.all(0),
                    EdgeInsets.symmetric(vertical: Dimensiones.height5),
                    const Color.fromARGB(255, 197, 197, 197),
                    Colors.grey.shade700,
                    validationFunction: validateEmail,
                  ),
                  Input(
                    true,
                    controlContrasena,
                    "Contraseña",
                    const EdgeInsets.all(0),
                    const EdgeInsets.only(bottom: 8),
                    const Color.fromARGB(255, 197, 197, 197),
                    Colors.grey.shade700,
                    validationFunction: validatePassword,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      child: Text(
                        '¿No tiene una cuenta?',
                        style: GoogleFonts.kodchasan(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () => Get.offAllNamed('/registrar'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensiones.height5,
                    ),
                    child: ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                              controlu
                                  .enviarDatos(
                                controlUsuario.text,
                                controlContrasena.text,
                              )
                                  .then((value) {
                                if (controlu.emailf != 'Sin Registro') {
                                  if (controlu.rol != "") {
                                    Get.offAll(HomePage(rol: controlu.rol));
                                  }
                                } else {
                                  Get.showSnackbar(
                                    const GetSnackBar(
                                      title: 'Validación de Usuarios',
                                      message: 'Datos Inválidos',
                                      icon: Icon(Icons.warning),
                                      duration: Duration(seconds: 5),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }).catchError((e) {
                                Get.showSnackbar(
                                  const GetSnackBar(
                                    title: 'Validación de Usuarios',
                                    message: 'Datos Inválidos',
                                    icon: Icon(Icons.warning),
                                    duration: Duration(seconds: 5),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minimumSize: const Size(400, 50),
                      ),
                      child: Text(
                        "Ingresar",
                        style: GoogleFonts.kodchasan(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
