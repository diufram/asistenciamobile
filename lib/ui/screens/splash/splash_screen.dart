import 'package:asistencia_vehicular/ui/screens/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashController> {
  SplashScreen({super.key});
  final splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("SPLASH")),
    );
  }
}
