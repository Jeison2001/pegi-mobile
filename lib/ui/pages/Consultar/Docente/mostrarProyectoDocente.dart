import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pegi/domain/models/proyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Input.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';
import 'package:pegi/ui/widgets/inputText.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path/path.dart' as path;
import 'package:open_file/open_file.dart';

class MostrarProyectoDocente extends StatefulWidget {
  final Proyecto proyecto;

  const MostrarProyectoDocente({super.key, required this.proyecto});

  @override
  State<MostrarProyectoDocente> createState() => _MostrarProyectoDocenteState();
}

class _MostrarProyectoDocenteState extends State<MostrarProyectoDocente> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensiones.screenHeight * 0.0001,
              horizontal: Dimensiones.screenWidth * 0.03),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Header(
                    icon: Icons.arrow_back_rounded,
                    texto: 'Consultar Proyecto'),
                MostrarTodo(
                  texto: widget.proyecto.titulo,
                  colorBoton:
                      widget.proyecto.estado.toLowerCase() == 'pendiente'
                          ? const Color.fromRGBO(91, 59, 183, 1)
                          : const Color.fromRGBO(18, 180, 122, 1),
                  estado: true,
                  tipo: widget.proyecto.estado,
                  calificacion: widget.proyecto.calificacion,
                  onPressed: () {},
                  color: Colors.black,
                  fijarIcon: false,
                  icon: Icons.mode_edit_outline_rounded,
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensiones.screenHeight * 0.0001,
                      horizontal: Dimensiones.screenWidth * 0.03),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.04),
                  child: Container(
                    height: Dimensiones.screenHeight * 0.0001,
                    width: Dimensiones.width90,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 4, color: Color.fromRGBO(30, 30, 30, 1)),
                      ),
                    ),
                  ),
                ),
                InputText(
                    false,
                    widget.proyecto.titulo,
                    "Titulo del proyecto",
                    EdgeInsets.only(right: Dimensiones.screenWidth * 0.08),
                    const EdgeInsets.only(bottom: 8),
                    const Color.fromRGBO(30, 30, 30, 1),
                    const Color.fromARGB(255, 221, 221, 221)),
                InputDownload(
                  texto: "Descargar documento",
                  icon: Icons.download_rounded,
                  color: const Color.fromRGBO(30, 30, 30, 1),
                  onPressed: () async {
                    var status = await Permission.storage.status;
                    if (!status.isGranted) {
                      await Permission.storage.request();
                    }
                    final tempDir = (await getTemporaryDirectory()).path;
                    final uri = Uri.parse(widget.proyecto.anexos);
                    final response = await http.get(uri);
                    final fileName = path.basename(uri.path);
                    String filePath = "$tempDir/$fileName";
                    final file = File(filePath);
                    await file.writeAsBytes(response.bodyBytes);
                    await OpenFile.open(filePath);

                    // Inicializa el plugin de notificaciones locales
                    FlutterLocalNotificationsPlugin
                        flutterLocalNotificationsPlugin =
                        FlutterLocalNotificationsPlugin();
                    var initializationSettingsAndroid =
                        const AndroidInitializationSettings(
                            '@mipmap/ic_launcher');
                    var initializationSettingsIOS =
                        const IOSInitializationSettings();
                    var initializationSettings = InitializationSettings(
                        android: initializationSettingsAndroid,
                        iOS: initializationSettingsIOS);
                    await flutterLocalNotificationsPlugin
                        .initialize(initializationSettings);

// Configura los detalles de la notificación
                    var androidPlatformChannelSpecifics =
                        const AndroidNotificationDetails(
                            'your channel id', 'your channel name',
                            importance: Importance.max,
                            priority: Priority.high,
                            showWhen: false);
                    var iOSPlatformChannelSpecifics =
                        const IOSNotificationDetails();
                    var platformChannelSpecifics = NotificationDetails(
                        android: androidPlatformChannelSpecifics,
                        iOS: iOSPlatformChannelSpecifics);
                    await flutterLocalNotificationsPlugin.show(
                        0,
                        'Descarga completada',
                        'El archivo $fileName se ha descargado correctamente',
                        platformChannelSpecifics,
                        payload: 'item x');
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
