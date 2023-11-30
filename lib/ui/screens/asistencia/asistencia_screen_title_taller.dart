import 'package:asistencia_vehicular/domain/models/asistencia_model.dart';
import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_controller.dart';
import 'package:asistencia_vehicular/ui/screens/login/my_button.dart';
import 'package:asistencia_vehicular/ui/screens/tecnico/tecnico_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AsistenciaTitleTaller extends GetView<AsistenciaController> {
  AsistenciaTitleTaller({super.key});
  final Asistencia asistencia = Get.arguments;
  final myPosition = LatLng(-17.786693, -63.179431);

  void asignarTecnico(String tecnicoid) async {
    await controller.asignarTecnico(tecnicoid, asistencia.id.toString());
    Get.toNamed(AsistenciaRoutes.hometaller);
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
      body: Container(
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
            const SizedBox(
              height: 10,
            ),
            GetBuilder<TecnicoController>(builder: (controller) {
              return Column(children: [
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
                  hint: Obx(() => controller.t.value == ""
                      ? const Text("SELECCIONA EL TECNICO")
                      : Text(controller.t.toString().toUpperCase())),
                  onChanged: (newValue) {
                    controller.sTecnico = newValue.toString();
                    controller.t.value = newValue.toString();
                  },
                  value: controller.selectedTecnico,
                  items: controller.tecnico.map((selectedType) {
                    return DropdownMenuItem(
                      child: Text(selectedType.name),
                      value: selectedType.id,
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                    onTap: () {
                      asignarTecnico(controller.t.value);
                    },
                    text: "ASIGNAR TECNICO")
              ]);
            }),
          ],
        ),
      ),
    );
  }
}
