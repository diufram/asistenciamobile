import 'package:asistencia_vehicular/data/theme/colors.dart';
import 'package:asistencia_vehicular/ui/screens/login/my_button.dart';
import 'package:asistencia_vehicular/ui/screens/vehiculos/vehiculo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/asistencia_navigation.dart';

class VehiculoScreen extends GetWidget<VehiculoController> {
  const VehiculoScreen({super.key});

  void addVehiculo() async {
    Get.toNamed(AsistenciaRoutes.vehiculocreate);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        child: Column(
          children: [
            SizedBox(
              height: 550,
              width: MediaQuery.of(context).size.width,
              child: GetBuilder<VehiculoController>(
                builder: (controller) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.vehiculos.length,
                      itemBuilder: ((context, index) {
                        final String marca = controller.vehiculos[index].marca;
                        final String modelo =
                            controller.vehiculos[index].modelo;
                        final String img = controller.vehiculos[index].path;
                        return ListTile(
                          title: Card(
                            elevation: 10,
                            color: bases,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.network(
                                  "http://3.144.236.115/${img}",
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "MARCA: $marca",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      Text(
                                        "MODELO: $modelo",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: MyButton(onTap: addVehiculo, text: "AÑADIR VEHICULO"),
            ),
          ],
        ),
        onRefresh: () async {
          await controller.getVehiculo();
          await Future.delayed(const Duration(seconds: 1));
        },
      ),
    );
  }
}
