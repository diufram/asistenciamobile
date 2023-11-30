import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/login/my_button.dart';
import 'package:asistencia_vehicular/ui/screens/taller/taller_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/my_textfield.dart';

class TallerCreateScreen extends GetWidget<TallerController> {
  const TallerCreateScreen({super.key});

  void addServicio() async {
    final result = await controller.addServicioToTaller();
    if (result) {
      Get.snackbar("Servicio Agregado", "Exitoso");
      Get.toNamed(AsistenciaRoutes.hometaller);
    } else {
      Get.snackbar("Error", "Error al añadir el servicio");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        title: const Text(
          'AGREGAR SERVICIO',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: SafeArea(child: SingleChildScrollView(
          child: GetBuilder<TallerController>(
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 238, 238, 238),
                      //hintStyle: TextStyle(color: Colors.grey),
                    ),
                    dropdownColor: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    hint: Obx(() => controller.s.value == ""
                        ? const Text("SELECCIONA EL SERVICIO")
                        : Text(controller.s.value)),
                    onChanged: (newValue) {
                      controller.selectServicio = newValue.toString();
                      controller.s.value = newValue.toString();
                      print(controller.selectServicio);
                    },
                    value: controller.selectServicio,
                    items: controller.servicios.map((selectedType) {
                      return DropdownMenuItem(
                        child: Text(selectedType.nombre),
                        value: selectedType.nombre,
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      controller: controller.precioTextController,
                      hintText: 'Precio Base',
                      obscureText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child:
                        MyButton(onTap: addServicio, text: "AGREGAR SERVICIO"),
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
