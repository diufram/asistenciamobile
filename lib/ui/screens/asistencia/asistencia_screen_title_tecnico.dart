import 'package:asistencia_vehicular/domain/models/asistencia_model.dart';
import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_controller.dart';
import 'package:asistencia_vehicular/ui/screens/login/my_button.dart';
import 'package:asistencia_vehicular/ui/screens/login/my_textfield.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AsistenciaTitleTecnico extends GetView<AsistenciaController> {
  AsistenciaTitleTecnico({super.key});
  final Asistencia asistencia = Get.arguments;
  final myPosition = LatLng(-17.786693, -63.179431);

  void cobrar() async {
    await controller.cobrar(asistencia.id.toString());
    Get.toNamed(AsistenciaRoutes.hometecnico);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("ASISTENCIA"),
        leading: BackButton(onPressed: () => Get.back()),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                "http://3.144.236.115${asistencia.url}",
                height: 300,
                width: 300,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "DESCRIPCION:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(asistencia.descripcion),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "SERVICIO:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(asistencia.nombre.toString()),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "CLIENTE:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(asistencia.clienteNombre.toString()),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: controller.cobro,
                  hintText: "Monto a Cobrar",
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),
              MyButton(onTap: cobrar, text: "COBRAR")
            ],
          ),
        ),
      ),
    );
  }
}
