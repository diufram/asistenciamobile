import 'dart:io';
import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_controller.dart';
import 'package:asistencia_vehicular/ui/screens/login/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import '../../../services/globals.dart';
import '../login/my_textfield.dart';

class AsistenciaCreateScreen extends GetWidget<AsistenciaController> {
  const AsistenciaCreateScreen({super.key});

  static const double defaultLat = -17.786693;
  static const double defaultLng = -63.179431;

  void uploadImagen() {
    controller.getImage();
  }

  void addAsistencia() async {
    final result = await controller.addAsistencia();
    if (result) {
      Get.snackbar("Solicitud de asistencia Creada", "Exitoso");
      Get.offAllNamed(AsistenciaRoutes.home);
    } else {
      Get.snackbar("Error", "Error al solicitar la asistencia");
    }
  }

  void getServicioToTaller() async {
    await controller.getServiciosToTaller();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: BackButton(
              onPressed: () => Get.offAllNamed(AsistenciaRoutes.home)),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[800],
          elevation: 0,
          title: const Text(
            'SOLICITUD DE ASISTENCIA',
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(25),
          child: SafeArea(
            child: SingleChildScrollView(
              child: GetBuilder<AsistenciaController>(
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // MODELO TEXTFIELD
                      MyTextField(
                          controller: controller.descripcionTextController,
                          hintText: 'Descripcion',
                          obscureText: false),

                      const SizedBox(
                        height: 10,
                      ),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        hint: Obx(() => controller.s.value == ""
                            ? const Text("SELECCIONA EL SERVICIO")
                            : Text(controller.selectedServicio
                                .toString()
                                .toUpperCase())),
                        onChanged: (newValue) {
                          controller.selectedServicio = newValue.toString();
                          controller.s.value = newValue.toString();
                          getServicioToTaller();
                        },
                        value: controller.selectedServicio,
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
                      Obx(
                        () => controller.sw.value
                            ? DropdownButtonFormField(
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                hint: Obx(() => controller.st.value == ""
                                    ? const Text("SERVICIO DEL TALLER")
                                    : Text(controller.selectedServicioToTaller
                                        .toString()
                                        .toUpperCase())),
                                onChanged: (newValue) {
                                  controller.selectedServicioToTaller =
                                      newValue.toString();
                                  controller.st.value = newValue.toString();
                                  print("taller id: " + controller.st.value);
                                },
                                value: controller.selectedServicioToTaller,
                                items: controller.servicioToTallers
                                    .map((selectedType) {
                                  return DropdownMenuItem(
                                    child: Text(
                                        "Taller: ${selectedType.tallerNombre}" +
                                            "\n"
                                                "Precio Base:  ${selectedType.precio}" +
                                            "\n"),
                                    value: selectedType.tallerId,
                                  );
                                }).toList(),
                              )
                            : const Text("SELECIONA UNA OPCION"),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 200,
                        child: controller.myPosition == null
                            ? const Center(child: CircularProgressIndicator())
                            : FlutterMap(
                                options: MapOptions(
                                  initialCenter: controller.myPosition!,
                                  minZoom: 5,
                                  maxZoom: 25,
                                  initialZoom: 18,
                                ),
                                children: [
                                  TileLayer(
                                    urlTemplate:
                                        'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                                    additionalOptions: const {
                                      'accessToken': MAPBOX_ACCESS_TOKEN,
                                      'id': 'mapbox/streets-v12'
                                    },
                                  ),
                                  MarkerLayer(markers: [
                                    Marker(
                                      point: controller.myPosition!,
                                      child: const Icon(
                                        Icons.person_pin,
                                        color: Colors.blueAccent,
                                        size: 40,
                                      ),
                                    )
                                  ])
                                ],
                              ),
                      ),
                      Container(
                        child: controller.image?.path == null
                            ? const Center(
                                child: Text("SELECIONAN UNA IMAGEN"),
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
                        child: MyButton(
                            onTap: addAsistencia, text: "SOLICITAR ASISTENCIA"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
