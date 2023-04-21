import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Calendar.dart';
import 'package:pegi/ui/widgets/Navbar.dart';
import 'package:pegi/ui/widgets/ProgressAvatar.dart';

import '../../../data/services/peticionesPropuesta.dart';
import '../../../data/services/peticionesProyecto.dart';
import '../../../domain/Controllers/controlProyecto.dart';
import '../../../domain/Controllers/controladorUsuario.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  @override
  void initState() {
    super.initState();
    func();
    func2();
    func3();
    func4();
  }

  PeticionesProyecto peticionesProyecto = PeticionesProyecto();
  PeticionesPropuesta peticionesPropuesta = PeticionesPropuesta();

  var calificadosProy = 0;
  var totalProy = 0;
  var calificadosProp = 0;
  var totalProp = 0;
  ControlProyecto controlp = Get.find();
  ControlUsuario controlu = Get.find();

  void func() {
    peticionesProyecto.contadorProyec().then((value) {
      setState(() {
        calificadosProy = value;
      });
    });
  }

  void func2() {
    peticionesProyecto.contadorProy().then((value) {
      setState(() {
        totalProy = value;
      });
    });
  }

  void func3() {
    peticionesPropuesta.contadorPropAdmin().then((value) {
      setState(() {
        calificadosProp = value;
      });
    });
  }

  void func4() {
    peticionesPropuesta.contadorPropAdm().then((value) {
      setState(() {
        totalProp = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensiones.screenHeight * 0.02,
              horizontal: Dimensiones.width5),
          child: Column(
            children: <Widget>[
              Navbar("Administrador", Icons.space_dashboard),
              const Calendar(),
              ProgressAvatar(
                porcentaje: (calificadosProp / totalProp),
                color: const Color.fromRGBO(91, 59, 183, 1),
                label:
                    '${((calificadosProp / totalProp) * 100).toString() == 'NaN' ? '-' : ((calificadosProp / totalProp) * 100).round().toString()}%',
                texto: 'Propuestas \ncalificadas',
                seguimiento:
                    '${calificadosProp.toString()}/${totalProp.toString()} revisiones',
              ),
              const SizedBox(height: 30),
              ProgressAvatar(
                porcentaje: (calificadosProy / totalProy),
                color: const Color.fromRGBO(91, 59, 183, 1),
                label:
                    '${((calificadosProy / totalProy) * 100).toString() == 'NaN' ? '-' : ((calificadosProy / totalProy) * 100).round().toString()}%',
                texto: 'Proyectos \ncalificadas',
                seguimiento:
                    '${calificadosProy.toString()}/${totalProy.toString()} revisiones',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
