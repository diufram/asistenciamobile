import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/theme/colors.dart';

class AsistenciaTecnicoScreen extends GetView<AsistenciaController> {
  const AsistenciaTecnicoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        child: Column(
          children: [
            SizedBox(
              height: 550,
              width: MediaQuery.of(context).size.width,
              child: GetBuilder<AsistenciaController>(
                builder: (controller) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.asistencias.length,
                      itemBuilder: ((context, index) {
                        final String id =
                            controller.asistencias[index].id.toString();
                        final String descripcion =
                            controller.asistencias[index].descripcion;
                        return ListTile(
                          title: GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                  AsistenciaRoutes.asistenciatitletecnico,
                                  arguments: controller.asistencias[index]);
                            },
                            child: Card(
                              elevation: 10,
                              color: bases,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ID: $id",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "DESCRIPCION: $descripcion",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        onRefresh: () async {
          await controller.getAsistencia();
          await Future.delayed(const Duration(seconds: 1));
        },
      ),
    );
  }
}
