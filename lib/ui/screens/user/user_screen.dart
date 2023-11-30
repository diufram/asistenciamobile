import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/my_button.dart';

class UserScreen extends GetView {
  const UserScreen({super.key});

  void logout() {
    final controller = Get.find<HomeController>();
    controller.logout();
    Get.offNamed(AsistenciaRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SizedBox(
          height: 550,
          width: MediaQuery.of(context).size.width,
          child: Text("user"),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 30,
          child: MyButton(onTap: logout, text: "LOGOUT"),
        ),
      ],
    ));
  }
}
