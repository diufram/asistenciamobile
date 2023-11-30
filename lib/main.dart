
import 'package:asistencia_vehicular/ui/main_binding.dart';
import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      initialRoute: AsistenciaRoutes.splash,
      getPages: AsistenciaPages.pages,
    );
  }
}
