import 'dart:io';
import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/login/my_button.dart';
import 'package:asistencia_vehicular/ui/screens/vehiculos/vehiculo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login/my_textfield.dart';

class VehiculoCreateScreen extends GetWidget<VehiculoController> {
  const VehiculoCreateScreen({super.key});
  void uploadImagen() {
    controller.getImage();
  }

  void addVehiculo() async {
    final result = await controller.addVehiculo();
    if (result) {
      Get.snackbar("Vehiculo Añadido", "Exitoso");
      Get.offAllNamed(AsistenciaRoutes.home);
    } else {
      Get.snackbar("Error", "Error al añadir el vehiculo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Get.offAllNamed(AsistenciaRoutes.home),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        title: const Text(
          'AGREGAR VEHICULO',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: SafeArea(child: SingleChildScrollView(
          child: GetBuilder<VehiculoController>(
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // MODELO TEXTFIELD
                  MyTextField(
                      controller: controller.marcaTextController,
                      hintText: 'Marca',
                      obscureText: false),

                  const SizedBox(
                    height: 10,
                  ),

                  // MODELO TEXTFIELD
                  MyTextField(
                      controller: controller.modeloTextController,
                      hintText: 'Model',
                      obscureText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      controller: controller.anhoTextController,
                      hintText: 'Año',
                      obscureText: false),

                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: controller.image?.path == null
                        ? const Center(
                            child: Text("IMAGE"),
                          )
                        : Image.file(
                            File(controller.image!.path),
                            width: 300,
                            height: 200,
                          ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
                    height: MediaQuery.of(context).size.height - 780,
                    child: MyButton(
                        onTap: uploadImagen, text: "Seleccionar Imagen"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child:
                        MyButton(onTap: addVehiculo, text: "AGREGAR VECHICULO"),
                  ),
                ],
              );
            },
          ),
        )),
      ),
    );
  }
}
