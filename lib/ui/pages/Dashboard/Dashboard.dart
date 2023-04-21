import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Navbar.dart';
import 'package:pegi/ui/widgets/ProgressAvatar.dart';

import '../../../data/services/peticionesPropuesta.dart';
import '../../../data/services/peticionesProyecto.dart';
import '../../../domain/Controllers/controlProyecto.dart';
import '../../../domain/Controllers/controladorUsuario.dart';
import '../../widgets/Calendar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
    peticionesProyecto
        .contadorProyecto(controlu.emailf, 'calificado')
        .then((value) {
      setState(() {
        calificadosProy = value;
      });
    });
  }

  void func2() {
    peticionesProyecto.contadorPro(controlu.emailf).then((value) {
      setState(() {
        totalProy = value;
      });
    });
  }

  void func3() {
    peticionesPropuesta
        .contadorPropuesta(controlu.emailf, 'calificado')
        .then((value) {
      setState(() {
        calificadosProp = value;
      });
    });
  }

  void func4() {
    peticionesPropuesta.contadorProp(controlu.emailf).then((value) {
      setState(() {
        totalProp = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    controlp.consultarProyectos(controlu.emailf).then((value) => null);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensiones.screenHeight * 0.02,
              horizontal: Dimensiones.width5),
          child: Column(
            children: <Widget>[
              Navbar("Docente", Icons.space_dashboard),
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
              SizedBox(height: Dimensiones.height5),
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
