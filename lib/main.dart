import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/domain/Controllers/controlProyecto.dart';
import 'package:pegi/domain/Controllers/controladorIndex.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/ui/pages/App.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// ...
final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  FlutterDownloader.registerCallback(downloadCallback);
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  GetPlatform.isWeb
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAU4hPmspfzaZ9-7hOeIJSM_1FN3WzFlQE",
              authDomain: "pegi-7ed4c.firebaseapp.com",
              projectId: "pegi-7ed4c",
              storageBucket: "pegi-7ed4c.appspot.com",
              messagingSenderId: "743468186486",
              appId: "1:743468186486:web:5e1c06d140dbf67d139857",
              measurementId: "G-GRQEHTYESB"))
      : await Firebase.initializeApp();
  Get.put(ControlUsuario());
  Get.put(ControlPropuesta());
  Get.put(ControlIndex());
  Get.put(ControlProyecto());

  runApp(const App());
}

void downloadCallback(String id, int status, int progress) {
  print('Descarga $id en progreso: $progress%');
}
