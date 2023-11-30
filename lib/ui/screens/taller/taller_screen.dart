import 'package:asistencia_vehicular/data/theme/colors.dart';
import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/taller/taller_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/my_button.dart';

class TallerScreen extends GetView<TallerController> {
  const TallerScreen({super.key});

  void agregarServicio() async {
    Get.toNamed(AsistenciaRoutes.serviciototallercreate);
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
              child: GetBuilder<TallerController>(
                builder: (controller) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.serviciosToTaller.length,
                      itemBuilder: ((context, index) {
                        final String descripcion =
                            controller.serviciosToTaller[index].nombre;
                        final String ubicacion =
                            controller.serviciosToTaller[index].precio;
                        return ListTile(
                          title: Card(
                            elevation: 10,
                            color: bases,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "SERVICIO: $descripcion",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "PRECIO BASE: $ubicacion",
                                        style: const TextStyle(
                                            color: Colors.white),
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
              child: MyButton(
                  onTap: agregarServicio, text: "AGREGAR SERVICIO AL TALLER"),
            ),
          ],
        ),
        onRefresh: () async {
          await controller.getServicioToTallers();
          await Future.delayed(const Duration(seconds: 1));
        },
      ),
    );
  }
}
